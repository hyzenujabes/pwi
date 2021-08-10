const express = require('express');
const router = express.Router();
const model = require ('./../../models/categorias');

const get = async (req, res) =>{
    const categorias = await model.getAll();
    res.render('adminCategorias', {categorias});
}

const create = async (req, res) => {
    const categoria = req.body;
    console.log (categoria);
    const {insertId} = await model.create (categoria);
    console.log(insertId);
    res.redirect('/admin/categorias');
}
const update = async (req, res) => {
    const {id} = req.params;
    const producto = req.body;
    console.log (producto);
    const {insertId} = await model.update (id, producto);
    console.log(insertId);
    res.redirect('/admin/productos');
}
const showUpdate = async (req, res) => {
    const {id} = req.params;
    const [categorias] = await model.getSingle(id);
    res.render('updateCategoria', {categorias});
}
const del = async (req, res) => {
    const {id} = req.params;
    const {insertId} = await model.del(id);
    console.log(insertId);
    res.redirect('/admin/categorias');
}

router.get('/create', (req, res) => res.render('createCategoria'));
router.get('/update/:id', showUpdate);
router.post('/update/:id', update);
router.post ('/create', create);
router.get('/', get);
router.get('/delete/:id', del);
module.exports = router;