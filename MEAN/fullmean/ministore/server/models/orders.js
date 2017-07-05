let mongoose = require('mongoose');
let Schema = mongoose.Schema;

let OrderSchema = new Schema({
  _customer: {type: Schema.Types.ObjectId, ref: 'Customer'},
  _product: {type: Schema.Types.ObjectId, ref: 'Product'},
  quantity: {type: Number, required: true },

}, {timestamps:true})

mongoose.model('Order', OrderSchema)
