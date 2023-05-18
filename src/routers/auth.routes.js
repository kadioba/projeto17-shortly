import { Router } from "express"
import { signUp } from "../contollers/auth.controllers"

const authRouter = Router()

authRouter.post("/signup", signUp)