import { Router } from "express"
import { signIn, signUp } from "../contollers/auth.controllers.js"
import validateSchema from "../middlewares/validateSchema.middleware.js"
import { signInSchema, signUpSchema } from "../schemas/auth.schemas.js"

const authRouter = Router()

authRouter.post("/signup", validateSchema(signUpSchema), signUp)
authRouter.post("/signin", validateSchema(signInSchema), signIn)

export default authRouter