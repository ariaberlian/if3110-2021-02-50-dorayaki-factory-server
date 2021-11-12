import express from "express";
import { getAdmins, Register, Login, Logout } from "../controller/Admins.js";
import { verifyToken } from "../middleware/VerifyToken.js";
import { refreshToken } from "../controller/RefreshToken.js";

const router = express.Router();

router.get('/admins', verifyToken, getAdmins);
router.post('/admins', Register);
router.post('/login', Login);
router.get('/token', refreshToken);
router.delete('/logout', Logout);
router.get('/', (req,res)=>res.send("welcome"));
export default router;