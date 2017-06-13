var mongoose = require('mongoose');

var AnimalSchema = new mongoose.Schema({
  name: String,
  gender: String,
})
mongoose.model('Animal', AnimalSchema);
var Animal = mongoose.model("Animal");
