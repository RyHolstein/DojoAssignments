let mongoose  = require('mongoose');

let UserSchema = new mongoose.Schema({
    username: { type:String, required: true }
}, {timestamps: true});


mongoose.model('User', UserSchema);
