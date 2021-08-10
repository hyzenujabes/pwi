const express = require('express');
const router = express.Router();
const model = require('./../models/usuarios');
const sha1 = require ('sha1');
const {v4: uuid} = require ('uuid');
const { send } = require('./../services/mail');
const {validateRegistro} = require ('./../middlewares/usuarios');

const showRegistro = (req, res) => {
    res.render('registro');
}
const create = async (req, res) => {
    const usuario = req.body;
    console.log(usuario);
    let duplicado = false;
    const uid = uuid();
    console.log(uid);
    const usuarioFinal = { // USUARIO QUE VOY A PASAR A LA BDD
        username: usuario.username,
        pass: sha1(usuario.pass),
        mail: usuario.mail,
        confirmacionCorreo: uid,
        telefono : usuario.telefono
    }
    // verificar el nombre de usuario / mail ya existente
    const usuariosExistentes = await model.all();
    usuariosExistentes.forEach(usuario => {
        if (usuario.username == usuarioFinal.username || usuario.mail == usuarioFinal.mail)
        {
            duplicado = true;
        }
    })
    if (!duplicado) {
    const agregado = await model.create(usuarioFinal);
    console.log(agregado);
    send ({mail : usuarioFinal.mail,
        cuerpo:
        `<h1> Bienvenido ${usuarioFinal.username} </h1> 
        <a href=${process.env.URL_SERVER}:${process.env.PORT}/registro/verify/${usuarioFinal.confirmacionCorreo}> Click para activar tu cuenta!</a>`});
    res.redirect ('/productos');
    }
    else {
        res.render('registro', {message: "el nombre de usuario y/o mail ya existen"});
    }
}
const verify = async (req, res) => {
    const {uid} = req.params;
    console.log(uid);
    const messageId = await model.verify(uid);
    res.redirect('/');
}
router.get('/', showRegistro);
router.post('/', validateRegistro, create);
router.get('/verify/:uid', verify);
module.exports = router;