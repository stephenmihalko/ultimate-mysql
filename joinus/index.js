// These are 'import' statements
var express = require('express');
var mysql = require('mysql');
var bodyParser = require('body-parser');

// Create the actual app in code
var app = express();

// Tell it to use EJS for the HTML extension
app.set("view engine", "ejs");

// Parses the email from the post request
app.use(bodyParser.urlencoded({extended: true}));

// Take whatever is in that /public folder and make it available to javascript
app.use(express.static(__dirname + "/public"));

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
    // This is a callback for the MySQL server connection
    connection.query(q,
      function(error, results, fields)
      {
        if (error) throw error;
        var count = results[0].total;
        // Look for a "views" directory and look for "home.ejs" in that directory.
		response.render('home', {count: count});
      }
    );
  }
);

app.post("/register",
  function(request, response)
  {
    // This actually extracts the "email" part of the request
    var person = {email: request.body.email};
    connection.query( 'INSERT INTO Users SET ?', person,
      function(error, result)
      {
	if (error) throw error;
	response.redirect("/");
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
