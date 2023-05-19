import { db } from "../database/database.connection.js"
import bcrypt from "bcrypt"
import jwt from "jsonwebtoken"
import dotenv from "dotenv"

dotenv.config()
const secretKey = process.env.JWT_SECRET

export async function signUp(req, res) {

    const { name, email, password } = req.body

    const hashedPassword = bcrypt.hashSync(password, 10);

    try {
        await db.query(`INSERT INTO users (name, email, password) VALUES ($1, $2, $3);`, [name, email, hashedPassword])

        res.sendStatus(201)
    } catch (err) {
        if (err.code === "23505") return res.sendStatus(409)
        res.status(400).send(err)
    }
}

export async function signIn(req, res) {

    const { email, password } = req.body

    try {
        const user = await db.query(`SELECT password FROM users WHERE email = $1`, [email])
        if (!user) return res.sendStatus(401)

        const isPasswordCorrect = bcrypt.compare(password, user.rows[0].password)
        if (!isPasswordCorrect) return res.sendStatus(401)

        const token = jwt.sign({ id: user.rows[0].id }, secretKey, { expiresIn: '1h' })

        res.status(200).send({ token })
    } catch (err) {
        res.send(err)
    }
}