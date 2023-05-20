import { Router } from "express";
import { deleteUrl, getUrlById, openShortUrl, shortenUrl } from "../contollers/urls.controllers.js";
import validateToken from "../middlewares/validateToken.middleware.js";

const urlsRouter = Router()

urlsRouter.post("/urls/shorten", validateToken, shortenUrl)
urlsRouter.get("/urls/:id", getUrlById)
urlsRouter.get("/urls/open/:shortUrl", openShortUrl)
urlsRouter.delete("/urls/:id", deleteUrl)

export default urlsRouter