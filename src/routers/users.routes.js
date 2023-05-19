import { Router } from "express";
import { getRanking, getUserData } from "../contollers/users.controllers.js";

const usersRouter = Router()

usersRouter.get("/users/me", getUserData)
usersRouter.get("/ranking", getRanking)

export default usersRouter