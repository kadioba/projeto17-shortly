import { nanoid } from "nanoid"
import { db } from "../database/database.connection.js"


export async function shortenUrl(req, res) {
    const { url } = req.body
    const { userId } = res.locals
    const shortenUrl = nanoid(8)
    try {
        const urlInserted = await db.query(`INSERT INTO urls (url, "shortUrl", "userId") VALUES ($1, $2, $3) RETURNING *;`, [url, shortenUrl, userId])
        res.status(201).send({
            id: urlInserted.rows[0].id,
            shortUrl: urlInserted.rows[0].shortUrl
        })
    } catch (err) {
        res.status(500).send(err)
    }
}

export async function getUrlById(req, res) {
    try {
        const url = await db.query(`SELECT id, "shortUrl", url FROM urls WHERE id = $1`, [req.params.id])
        if (url.rowCount === 0) return res.sendStatus(404)

        res.status(200).send(url.rows[0])
    } catch (err) {
        res.status(500).send(err)
    }
}

export async function openShortUrl(req, res) {
    const shortUrl = req.params.shortUrl
    try {
        const url = await db.query(`SELECT id, url, "userId" FROM urls WHERE "shortUrl" = $1;`, [shortUrl])
        if (url.rowCount === 0) return res.sendStatus(404)

        await db.query(`INSERT INTO visits ("urlId", "ownerId") VALUES ($1, $2)`, [url.rows[0].id, url.rows[0].userId])

        res.redirect(url.rows[0].url);

    } catch (err) {
        res.status(500).send(err)
    }
}

export async function deleteUrl(req, res) {
    try {
        const url = await db.query(`SELECT id, "userId" FROM urls WHERE id = $1`, [req.params.id])
        if (url.rowCount === 0) return res.sendStatus(404)
        if (res.locals.userId !== url.rows[0].userId) return res.sendStatus(401)

        await db.query(`DELETE FROM visits WHERE "urlId" = $1`, [url.rows[0].id])
        await db.query(`DELETE FROM urls WHERE id = $1 AND "userId" = $2;`, [url.rows[0].id, url.rows[0].userId])
        res.sendStatus(204)
    } catch (err) {
        res.status(500).send(err)
    }
}