var faker = require("faker");
var mysql = require("mysql");

// 1. Create connection to database.
var connection = mysql.createConnection({
  host     : "localhost",
  user     : "root",
  password : "password",
  database : "join_us"
});

// 2. Send command to database.
var q = "SELECT DAYNAME(CURDATE()) AS today, 2+2-1 AS quickmaths;";
connection.query(q, function(error, results, fields) {
  if (error) throw error;
  console.log(results[0].today);
  console.log(results[0].quickmaths);
});

// 3. Close the connection
connection.end();
