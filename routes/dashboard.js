var express = require('express');
var router = express.Router();

router.get('/', function(req, res, next) {

    res.cookie('userID', 15)
    res.render('dashboard');
});

module.exports = router;