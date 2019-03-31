// This is an 'import' statement
var express = require('express');

// Create the actual app in code
var app = express();

// This is a callback for when requests happen: 
// "If a request comes in for /, do this function
app.get("/",
  function(request, response)
  {
    response.send("You've reached the homepage.");
  }
);

// This starts a server for listening
app.listen(8080,
  function()
  {
    console.log("Server listening on port 8080.");
  }
);
