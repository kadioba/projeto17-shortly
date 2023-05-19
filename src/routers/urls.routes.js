import { Router } from "express";
import { deleteUrl, getUrlById, openShortUrl, shortenUrl } from "../contollers/urls.controllers.js";

const urlsRouter = Router()

urlsRouter.post("/urls/shorten", shortenUrl)
urlsRouter.get("/urls/:id", getUrlById)
urlsRouter.get("/urls/open/:shortUrl", openShortUrl)
urlsRouter.delete("/urls/:id", deleteUrl)

export default urlsRouter