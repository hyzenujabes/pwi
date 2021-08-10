const express = require('express');
const router = express.Router();
const model = require ('./../models/categorias');

const get = async (req, res) => {
    const categorias = await model.getAll();
    console.log(categorias);
    res.render('adminCategorias', {categorias});
}
const single = async (req,res) => {
    const {id} = req.params;
    const [categoria] = await getSingle(id);
    res.render ('categoria', {categoria});
}

router.get ('/', get);
router.get('/single/:id', single)
module.exports = router;