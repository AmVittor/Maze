var mysql = require('mysql2');

var connection = mysql.createConnection({
  host: 'localhost',
  port: '3306',
  user: 'admin',
  password: 'D1g1t@lschool',
  database: 'maze'
});

connection.connect(function (err) {
  if (err) throw err;
  console.log('Conectado ao BD com sucesso!');
});

module.exports = connection;
