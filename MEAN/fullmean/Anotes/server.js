//modules
var express = require('express');
var bodyParser = require('body-parser');
var app = express();
var path = require('path');
var mongoose = require('mongoose');



//set up the mongoose
mongoose.connect('db://localhost/anotes');
var MessageSchema = mongoose.Schema({
    content: String,
}, {timestamps: true})
mongoose.model('Message', MessageSchema);

//set up express
app.use(express.static(path.join(__dirname, 'notes-app', 'dist')));
app.use(bodyParser.urlencoded({extended:true}));
app.use(bodyParser.json({extended:true}));

//catch all route to make sure any non-express angular routes are serving angular index.html
app.post('/messages', function(req, res){
  console.log(req.body);
  var message = new Message(req.body);
  message.save(function(err){
    if(err){
      console.log(err);
      res.sendStatus(500);
    }else{
      console.log("message successfully created");
      Message.find({}, function(err, messages){
        if(err){
          console.log(err);
          res.sendStatus(500);
        }else {
          res.json(mess)
        }
      })
    }
  })
})

app.all("*", (req,res,next) => {
    res.sendfile(path.resolve("./public/dist/index.html"))
});


app.listen(8000, function(){
  console.log("running on local host 8000");
})
