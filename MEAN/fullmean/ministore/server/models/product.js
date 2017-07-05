let mongoose = require('mongoose');
let Schema = mongoose.Schema;

let ProductSchema = new Schema({
  name: {type:String, required:true},
  imageURL: {type:String, required:true},
  description: {type:String, required:true},
  stock: {type:Number, required:true},
}, {timestamps: true})

mongoose.model('Product', ProductSchema);
