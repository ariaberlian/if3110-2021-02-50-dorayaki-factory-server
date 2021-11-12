import { Sequelize } from "sequelize";
import db from "../config/database.js";

const { DataTypes } = Sequelize;
export const Resep = db.define(
    'resep',
    {
        id_resep:{
            type:DataTypes.INTEGER,
            primaryKey:true
        },
        nama_resep:{
            type:DataTypes.STRING
        }
    },
    {
        freezeTableName:true,
        timestamps:false
    }
);


export const BahanResep = db.define(
    'bahan_resep',
    {
        id_resep:{
            type:DataTypes.INTEGER,
            primaryKey:true
        },
        bahan_baku:{
            type:DataTypes.STRING,
            primaryKey:true
        },
        jumlah : {
            type:DataTypes.INTEGER
        }
    },
    {
        freezeTableName:true,
        timestamps:false
    }
);
