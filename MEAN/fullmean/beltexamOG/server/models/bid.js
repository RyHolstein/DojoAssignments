let mongoose = require('mongoose');

let Schema = mongoose.Schema;

let BidSchema = new Schema ({
  _user: {type: Schema.Types.ObjectId, ref: 'User'},
  bid: {type: Number, required:[true, "You Must enter an amount"]}
})

mongoose.model('Bid', BidSchema);
