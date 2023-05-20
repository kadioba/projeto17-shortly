import { Router } from "express";
import { getRanking, getUserData } from "../contollers/users.controllers.js";
import validateToken from "../middlewares/validateToken.middleware.js";

const usersRouter = Router()

usersRouter.get("/users/me", validateToken, getUserData)
usersRouter.get("/ranking", getRanking)

export default usersRouter