var express = require("express");

var app = express();




app.set('view engine', 'ejs');
app.set('views', __dirname + '/views');



app.use(express.static(__dirname + "/static"));


app.get('/', function(request, response) {
  response.send("<h1> hello </h1>");
})

app.get("/users", function(request, response){
  var users_array = [
    {name: "Michael", email: "nsfjsn"},
    {name: "Random", email: "kjfkf"}
  ]
  response.render('users', {users: users_array});
})

app.listen(8000, function() {
  console.log('listening to port 8000')
})
