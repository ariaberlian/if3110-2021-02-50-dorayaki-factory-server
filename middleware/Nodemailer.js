import { createTestAccount, createTransport } from "nodemailer";

// async..await is not allowed in global scope, must use a wrapper
export function main() {

  // create reusable transporter object using the default SMTP transport
  let transporter = createTransport({
    host: "smtp.mail.yahoo.com",
    port: 587,
    secure: false, // true for 465, false for other ports
    auth: {
      user: "jayen.swd@yahoo.com",
      pass: "yascdwkwtogkjimi",
    },
  });

  // send mail with defined transport object
  let info = transporter.sendMail({
    from: '"Jayen Company" <jayen.swd@yahoo.com>', // sender address
    to: "kamitampan123@gmail.com", // list of receivers
    subject: "Permintaan Penambahan Stok", // Subject line
    text: "Terdapat permintaan penambahan stok dari toko", // plain text body
    html: "<b>Terdapat permintaan penambahan stok dari toko</b><br><a href=''>Klik disini untuk melihat detil</a>", // html body
  });
}
