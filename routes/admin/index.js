const express = require ('express');
const router = express.Router();

const showIndex = (req, res) => {res.render('adminIndex');
    console.log(req.session.user);
}

router.get('/', showIndex);
module.exports = router;