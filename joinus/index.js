// These are 'import' statements
var express = require('express');
var mysql = require('mysql');

// Create the actual app in code
var app = express();

// Have it connect to the database
var connection = mysql.createConnection(
{
  host     : 'localhost',
  user     : 'root',
  password : 'password',
  database : 'join_us'
});

// This is a callback for when requests happen: 
// "If a request comes in for /, do this function
app.get("/",
  function(request, response)
  {
    var q = 'SELECT COUNT(*) AS total FROM Users;';
    connection.query(q,
      function(error, results, fields)
      {
        if (error) throw error;
        var count = results[0].total;
        response.send("We have " + count + " users.");
      }
    );
  }
);

app.get("/joke",
  function(request, response)
  {
    response.send("Chickens, hahahaha!");
  }
);

// This starts a server for listening
app.listen(8080,
  function()
  {
    console.log("Server listening on port 8080.");
  }
);
