var mysql = require('sync-mysql');

var connection = new mysql ({
    host: 'localhost',
    user: 'root',
    password: '', 
    database: "university"
});

module.exports = connection