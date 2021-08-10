const express = require('express');
const router = express.Router();
const {auth} = require('./../models/usuarios');
const sha1 = require('sha1');
const {validateLogin} = require ('./../middlewares/usuarios');

const showLogin = (req,res) => res.render ('login', {message : ''});

const login = async (req, res) => {
    let {username, pass} = req.body;
    pass = sha1(pass);
    const logged = await auth(username, pass);
    if (logged.legnth === 0) {
        res.render('login', {message: 'usuario o pass incorrectos'})
    }
    else {
        const [{id, admin}] = logged;
        req.session.user = id;
        req.session.admin = admin;
        res.redirect('/');
        
    }
    
}

router.get('/', showLogin);
router.post('/logged', validateLogin, login);
module.exports = router;