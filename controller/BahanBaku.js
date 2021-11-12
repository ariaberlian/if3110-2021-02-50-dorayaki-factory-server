import BahanBaku from "../models/BahanBakuModel.js";

export const getBahanBaku = async(req,res) => {
    try {
        const bahan_baku = await BahanBaku.findAll();
        res.json(bahan_baku);
    } catch (error) {
        console.error(error);
    }
}

export const addBahanBaku = async(req,res) => {
    const {nama_bahan , stok} = req.body;
    try {
        await BahanBaku.create({
            nama_bahan : nama_bahan,
            stok : stok
        });
        res.json({msg: "Penambahan bahan baku berhasil"});
    } catch (error) {
        console.error(error);
    }
}

export const updateStokBahanBaku = async(req,res) => {
    const {nama_bahan, stok} = req.body; 
    console.log(stok);
    try {
        await BahanBaku.update({stok: stok},{
            where:{
                nama_bahan : nama_bahan
            }
        });
        res.json({msg: "Pengubahan stok bahan baku berhasil"});
    } catch (error) {
        console.error(error);
    }
}