var mysql = require("mysql");

// 1. Create connection to database.
var connection = mysql.createConnection({
  host     : "localhost",
  user     : "root",
  password : "password",
  database : "join_us"
});

// 2. Send command to database.
var q = "SELECT COUNT(*) AS total FROM Users;";
connection.query(q, function(error, results, fields) {
  if (error) throw error;
  console.log(results[0].total);
});

// 3. Close the connection
connection.end();
