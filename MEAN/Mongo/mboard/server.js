var express = require('express');
var app = express();
var bodyParser = require('body-parser');
var mongoose = require('mongoose');
var path = require('path');
mongoose.Promise = global.Promise;


app.use(bodyParser.urlencoded({extended: true}));
app.use(express.static(path.join(__dirname, 'static')));
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

//models
mongoose.connect('mongodb://localhost/messageBoardDB');
var Schema = mongoose.Schema;
var messageSchema = new mongoose.Schema({
  name: String,
  content: String,
  comments: [{type: Schema.Types.ObjectId, ref:"Comment"}],
}, {timestamps: true});

var commentSchema = new mongoose.Schema({
  _message: {type: Schema.Types.ObjectId, ref:"Message"},
  content: String,
  name: String,
}, {timestamps: true});

mongoose.model("Message", messageSchema);
mongoose.model("Comment", commentSchema);

var Message = mongoose.model("Message");
var Comment = mongoose.model("Comment");
messageSchema.path('name').required(true, 'Name cannot be blank');
messageSchema.path('content').required(true, 'Message cannot be blank');
commentSchema.path('name').required(true, 'Name cannot be blank');
commentSchema.path('content').required(true, 'Comment cannot be blank');

//routes
app.get('/', function(req, res){
  Message.find({}).populate('comments').exec(function(err, message) {
      res.render('index', {messages: message});
        });

});


//posts
app.post('/', function(req, res){
  var message = new Message(req.body);
  message.save(function(err){
    if(err){
      console.log(err);
      res.redirect('/');
    } else{
      res.redirect('/');
    }
  })
})

app.post('/:id/comment', function(req, res){
  Message.findOne({_id: req.params.id}, function(err, message){
    var comment = new Comment(req.body);
    comment._message = message._id;
    message.comments.push(comment);
    comment.save(function(err,){
      message.save(function(err){
        if(err){
          console.log("error")
        } else {res.redirect('/')}
      })
    })
  })
})




app.listen(8000, function() {})


















//extra space
