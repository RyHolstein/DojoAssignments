
var express = require('express');
var app = express();
var bodyParser = require('body-parser');
var mongoose = require('mongoose');
//mongoose
mongoose.connect('mongodb://localhost/basic_mongoose');
var QuoteSchema = new mongoose.Schema({
  name: String,
  quote: String,
}, {timestamps:true})
mongoose.model('Quote', QuoteSchema);
var Quote = mongoose.model("Quote");

app.use(bodyParser.urlencoded({extended: true}));
// Require path
var path = require('path');
app.use(express.static(path.join(__dirname, 'static')));
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');
// Routes


// Root Request
app.get('/', function(req, res) {
    res.render('index');
})
app.get('/quotes', function(req, res) {
  Quote.find({}, function(errors, quotes) {

    res.render('quotes', {quotes: quotes})
  })
})
// Add User Request
app.post('/quotes', function(req, res) {

    var quote = new Quote(req.body);
    quote.save(function(err){
      if(err){
        console.log(err);
      }else{
        res.redirect('/quotes');
      }
    })


})





// Setting our Server to Listen on Port: 8000
app.listen(8000, function() {
    console.log("listening on port 8000");
})



















//end
