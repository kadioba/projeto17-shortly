import { db } from "../database/database.connection.js"

export async function getUserData(req, res) {
    const { userId } = res.locals

    console.log(userId)
    try {
        const user = await db.query(`SELECT users.id AS id, users.name AS name, COUNT(DISTINCT u.id) AS "visitCountUser",
        urls.id AS "idURL", urls."shortUrl" AS "shortUrl", urls.url AS url,
        COUNT(DISTINCT l.id) AS "linkVisits"
        FROM users
        LEFT JOIN visits u ON u."ownerId" = users.id
        LEFT JOIN urls ON urls."userId" = users.id
        LEFT JOIN visits l ON l."urlId" = urls.id
        WHERE users.id = $1
        GROUP BY users.id, urls.id;`, [userId])

        const links = user.rows.map(link => {
            const linkData = {
                id: link.idURL,
                shortUrl: link.shortUrl,
                url: link.url,
                visitCount: link.linkVisits
            }
            return linkData
        })

        console.log(user)

        res.status(200).send({
            id: user.rows[0].id,
            name: user.rows[0].name,
            visitCount: user.rows[0].visitCountUser,
            shortenedUrls: links
        })
    } catch (err) {
        res.status(500).send(err)
    }
}

export async function getRanking(req, res) {
    try {
        const ranking = await db.query(`SELECT users.id AS id, users.name AS name, COUNT(DISTINCT urls.id) AS "linksCount", COUNT(DISTINCT visits.id) AS "visitCount"
        FROM users
        LEFT JOIN urls ON urls."userId" = users.id
        LEFT JOIN visits ON visits."urlId" = urls.id
        GROUP BY users.id
        ORDER BY COUNT(DISTINCT visits.id) DESC
        LIMIT 10`)
        res.status(200).send(ranking.rows)
    } catch (err) {
        res.status(500).send(err)
    }
}