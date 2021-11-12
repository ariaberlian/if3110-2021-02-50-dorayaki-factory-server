import { Sequelize } from "sequelize";
import db from "../config/database.js";

const { DataTypes } = Sequelize;
const Admins = db.define(
    'admin',
    {
        username:{
            type:DataTypes.STRING,
            primaryKey:true
        },
        password:{
            type:DataTypes.TEXT
        },
        email:{
            type:DataTypes.STRING
        },
        refresh_token:{
            type:DataTypes.TEXT
        },
    },
    {
        freezeTableName:true,
        timestamps: false
    }
);

export default Admins;