const nodemailer = require ('nodemailer');
// envio e mail tiene asociada una demora, entonces es async await

const send = async({mail, asunto = 'El Barista Loco te da la bienvenida!', cuerpo}) => {
    try{
    const transporter = nodemailer.createTransport({
        /*host: 'smtp.gmail.com',
        port: 587,
        secure: false,
        es lo mismo que el service gmail*/
        service: process.env.MAIL_SERVICE || 'gmail',
        auth:{
            user: process.env.MAIL_USER || 'mail',
            pass: process.env.MAIL_PASSWORD || 'password'
        }
    });
    const info = {
        to: mail,
        subject: asunto,
        html: cuerpo
    };
    const {messageId} = await transporter.sendMail(info);
    return messageId;
    }
    catch(e){
        console.log(e);
    }
}
module.exports = {send};