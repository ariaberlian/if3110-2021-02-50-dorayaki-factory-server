import { Sequelize } from "sequelize";
import db from "../config/database.js";

const { DataTypes } = Sequelize;
const BahanBaku = db.define(
    'bahan_baku',
    {
        nama_bahan:{
            type:DataTypes.STRING,
            primaryKey:true
        },
        stok:{
            type:DataTypes.INTEGER
        }
    },
    {
        freezeTableName:true,
        timestamps:false
    }
);

export default BahanBaku;