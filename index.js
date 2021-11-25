import express from 'express'
import dotenv from "dotenv";
import cookieParser from "cookie-parser";
import cors from "cors";
import router from "./routes/index.js"
import db from "./config/database.js"
import bp from "body-parser"

dotenv.config();
const app = express();


try {
  await db.authenticate();
  console.log("Database connected");
  
} catch (error) {
  console.log("Connection error", error);
}

app.use(cors({ credentials:true, origin:'http://localhost:3000' }));
app.use(cookieParser());
app.use(bp.json())
app.use(bp.urlencoded({ extended: true }))
app.use(express.json());
app.use(router);

const port = 5000
app.listen(port, () => {
  console.log(`listening at http://localhost:${port}`)
})