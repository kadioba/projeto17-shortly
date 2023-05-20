import { Router } from "express";
import { deleteUrl, getUrlById, openShortUrl, shortenUrl } from "../contollers/urls.controllers.js";
import validateToken from "../middlewares/validateToken.middleware.js";
import validateSchema from "../middlewares/validateSchema.middleware.js";
import { urlSchema } from "../schemas/urls.schemas.js";

const urlsRouter = Router()

urlsRouter.post("/urls/shorten", validateToken, validateSchema(urlSchema), shortenUrl)
urlsRouter.get("/urls/:id", getUrlById)
urlsRouter.get("/urls/open/:shortUrl", openShortUrl)
urlsRouter.delete("/urls/:id", validateToken, deleteUrl)

export default urlsRouter