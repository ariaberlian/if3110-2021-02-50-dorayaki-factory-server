import {RequestToko} from "../models/RequestTokoModel.js"
import {main} from "../middleware/Nodemailer.js"

export const getRequest = async(req,res) => {
    try{
        const request_toko = await RequestToko.findAll();
        res.json(request_toko);
    }catch(error){
        console.error(error);
    }
}

export const getRequestToko = async(req,res) => {
    try {
        const request_toko = await RequestToko.findAll({
            where:{
                ip : req.query.ip
            }
        });
        res.json(request_toko);
    } catch (error) {
        console.error(error);
    }
}

export const addRequestToko = async(req,res) => {
    const {ip, varian, jumlah_penambahan} = req.body;
    try {
        await RequestToko.create({
            ip : ip,
            varian : varian,
            jumlah_penambahan : jumlah_penambahan
        });
        main();
        res.json({msg: "Penambahan request berhasil"});
    } catch (error) {
        console.error(error);
    }
}

export const updateRequestStatus = async(req,res) => {
    const {id_request, status} = req.body; 
    try {
        await RequestToko.update({status: status},{
            where:{
                id_request : id_request
            }
        });
        res.json({msg: "Pengubahan status berhasil"});
    } catch (error) {
        console.error(error);
    }
}