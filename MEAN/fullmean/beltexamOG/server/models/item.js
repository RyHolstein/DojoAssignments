let mongoose = require('mongoose');
let Schema = mongoose.Schema;

let ItemSchema = new Schema({
  name: {type:String, Required:true},
  bids: [{type: Schema.Types.ObjectId, ref: 'Bid'}]
})
mongoose.model("Item", ItemSchema);
