import express from "express";
import { getAdmins, Register, Login, Logout } from "../controller/Admins.js";
import { verifyToken } from "../middleware/VerifyToken.js";
import { refreshToken } from "../controller/RefreshToken.js";
import { getBahanBaku,addBahanBaku, updateStokBahanBaku } from "../controller/BahanBaku.js";
import { addResep, getBahanResep, getResep } from "../controller/Resep.js";
import { addRequestToko, getRequest, getRequestToko, updateRequestStatus } from "../controller/RequestToko.js";

const router = express.Router();

router.get('/admins', verifyToken, getAdmins);
router.post('/admins', Register);
router.post('/login', Login);
router.get('/token', refreshToken);
router.delete('/logout', Logout);
router.get('/bahan-baku', verifyToken, getBahanBaku);
router.post('/add-bahan-baku', verifyToken, addBahanBaku);
router.post('/update-bahan-baku', verifyToken, updateStokBahanBaku);
router.get('/resep', getResep);
router.get('/bahan-resep', verifyToken, getBahanResep);
router.post('/tambah-resep', verifyToken, addResep);
router.get('/request', verifyToken, getRequest);
router.get('/request-toko', getRequestToko);
router.post('/add-request-toko', addRequestToko);
router.post('/update-request-status', verifyToken, updateRequestStatus);



router.get('/', (req,res)=>res.send("Welcome Brader.. Jayen will sing for you <br>"+ `<iframe width="560" height="315" src="https://www.youtube.com/embed/YttA4FPAYuQ?controls=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>`));

export default router;