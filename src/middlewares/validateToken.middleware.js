import jwt from "jsonwebtoken"
import dotenv from "dotenv"

dotenv.config()

const secretKey = process.env.JWT_SECRET

export default function validateToken(req, res, next) {

    const { authorization } = req.headers
    const token = authorization?.replace("Bearer ", "")

    if (!token) return res.sendStatus(403)

    jwt.verify(token, secretKey, (err, decoded) => {
        if (err) {
            return res.sendStatus(500)
        }

        res.locals.userId = decoded.id;
    })

    next()
}