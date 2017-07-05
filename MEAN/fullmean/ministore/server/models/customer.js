let mongoose = require('mongoose');
let Schema = mongoose.Schema;


let CustomerSchema = new Schema({
  name: {type: String, required:[true, "The name Field Must Be Filled Out"]}
}, { timestamps: true })

mongoose.model('Customer', CustomerSchema);
