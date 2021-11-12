import Admins from "../models/AdminModel.js";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";

export const getAdmins = async(req, res) => {
    try {
        const admins = await Admins.findAll({
            attributes:['username','email']
        });
        res.json(admins);
    } catch (error) {
        console.error(error);
    }
}

export const Register = async(req, res) => {
    const { username, email, password, confPassword } = req.body;
    if(password !== confPassword) return res.status(400).json({msg: "Password dan Confirm Password tidak cocok"});
    const salt = await bcrypt.genSalt();
    const hashPassword = await bcrypt.hash(password, salt);
    try {
        await Admins.create({
            username: username,
            password: hashPassword,
            email: email
        });
        res.json({msg: "Register Berhasil"});
    } catch (error) {
        console.error(error);
    }
}

export const Login = async(req, res) => {
    try {
        const admin = await Admins.findAll({
            where:{
                username: req.body.username
            }
        });
        const match = await bcrypt.compare(req.body.password, admin[0].password);
        if(!match) return res.status(400).json({msg: "Username atau password salah"});
        const username = admin[0].username;
        const email = admin[0].email;
        const accessToken = jwt.sign({username, email}, process.env.ACCESS_TOKEN_SECRET,{
            expiresIn: '20s'
        });
        const refreshToken = jwt.sign({username, email}, process.env.REFRESH_TOKEN_SECRET,{
            expiresIn: '1d'
        });
        await Admins.update({refresh_token: refreshToken},{
            where:{
                username: username
            }
        });
        res.cookie('refreshToken', refreshToken,{
            httpOnly: true,
            maxAge: 24 * 60 * 60 * 1000, // set cookie selama 1 hari
            //secure : true //aktifkan jika menggunakan https
        });
        res.json({ accessToken });
    } catch (error) {
        res.status(404).json({msg:"Username atau password salah"});
    }
}

export const Logout = async(req, res) => {
    const refreshToken = req.cookies.refreshToken;
    if(!refreshToken) return res.sendStatus(204);
    const admin = await Admins.findAll({
        where:{
            refresh_token: refreshToken
        }
    });
    if(!admin[0]) return res.sendStatus(204);
    const username = admin[0].username;
    await Admins.update({refresh_token: null},{
        where:{
            username: username
        }
    });
    res.clearCookie('refreshToken');
    return res.sendStatus(200);
}