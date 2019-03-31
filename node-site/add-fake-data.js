// These are "import" statements
var faker = require("faker");
var mysql = require("mysql");

// Create connection to database.
var connection = mysql.createConnection({
  host     : "localhost",
  user     : "root",
  password : "password",
  database : "join_us"
});

// Create an empty array
var data = [];

// Create 569 new arrays of data and add to the first array
for (var i = 0; i < 569; i++)
{
  data.push([faker.internet.email(), faker.date.past()]);
}

// This is the query we want to run
var q = 'INSERT INTO Users (email, created_at) VALUES ?';

connection.query(q, [data], function(err, res){
  console.log(err);
  console.log(res);
});

connection.end();
