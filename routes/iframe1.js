var express = require('express');
var router = express.Router();

router.get('/', function(req, res, next) {
    
    var userID = req.cookies.userID
    res.render('test_iframe ', {userID: userID});
});

module.exports = router;