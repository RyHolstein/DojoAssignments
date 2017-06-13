var express = require("express");
var path = require("path");
var app = express();


//variables for chat room
var usernames = []
var messages = []

// static content
app.use(express.static(path.join(__dirname, "/static")));
// setting up ejs and our views folder
app.set('views', path.join(__dirname, '/views'));
app.set('view engine', 'ejs');


// root route to render the index.ejs view
app.get('/', function(req, res) {
  res.render("index");

})


var server = app.listen(8000, function() {
  console.log("listening on port 8000");
});


var io = require('socket.io').listen(server);
io.sockets.on("connection", function(socket){
  console.log("connected to socket");
  if (messages.length >= 1) {
    io.emit("message_list", {messages: messages});
  }


  //when the user logs inn
  socket.on("user_logged", function (data){
    console.log(data.user);
  })
  socket.on("message_created", function(data) {
    messages.push(data);
    io.emit("message_post", {info:data})
  })








})//end of connection












//end
