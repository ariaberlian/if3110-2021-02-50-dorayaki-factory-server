import {Sequelize} from "sequelize";

const database_name = "dorayaki_factory";
const username = "root";
const password = "";
const host = "localhost";
const db = new Sequelize(database_name, username, password, { host:host, dialect:"mysql"});

export default db;