import {Resep, BahanResep} from "../models/ResepModel.js"

export const getResep = async(req,res) => {
    try{
        const resep = await Resep.findAll();
        res.json(resep);
    }catch(error){
        console.error(error);
    }
}

export const getBahanResep = async(req,res) => {
    try{
        const bahan_resep = await BahanResep.findAll({
            attributes: ['bahan_baku', 'jumlah'],
            where:{
                id_resep : req.params.idresep
            }
        });
        res.json(bahan_resep);
    }catch(error){
        console.error(error);
    }
}

export const addResep = async(req,res) => {
    try{
        const {nama_resep, ...bahan_resep} = req.body;

        await Resep.create({
            nama_resep : nama_resep
        })

        var resep = await Resep.findOne({
            attributes:['id_resep'],
            where:{
                nama_resep : nama_resep
            }
        });

        var id_resep = resep.getDataValue('id_resep');
        console.log(bahan_resep);

        for(let i = 0; i < bahan_resep['bahan_baku'].length; i++){
            await BahanResep.create({
                id_resep:id_resep,
                bahan_baku:bahan_resep['bahan_baku'][i],
                jumlah : bahan_resep['jumlah'][i]
            })
        }
        res.json({msg: "Penambahan Resep berhasil"});
    }catch(error){
        console.error(error);
    }
}