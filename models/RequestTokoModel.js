import { Sequelize } from "sequelize";
import db from "../config/database.js";

const { DataTypes } = Sequelize;
export const RequestToko = db.define(
    'request_toko',
    {
        id_request:{
            type:DataTypes.INTEGER,
            primaryKey:true
        },
        ip:{
            type:DataTypes.STRING
        },
        varian:{
            type:DataTypes.STRING
        },
        jumlah_penambahan:{
            type:DataTypes.INTEGER
        },
        status:{
            type:DataTypes.INTEGER,
            allowNull:true
        },
        updated_at:{
            type: 'TIMESTAMP',
            allowNull: true
        }
    },   
    {
        freezeTableName:true,
        timestamps:false
    }
);
