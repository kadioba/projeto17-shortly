import joi from "joi"

export const signUpSchema = joi.object({
    name: joi.string().trim().required(),
    email: joi.string().email({ tlds: { allow: false } }).required(),
    password: joi.string().required(),
    confirmPassword: joi.string().required().equal(joi.ref("password"))
})

export const signInSchema = joi.object({
    email: joi.string().email({ tlds: { allow: false } }).required(),
    password: joi.string().required(),
})