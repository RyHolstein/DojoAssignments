var mongoose = require('mongoose');
var User = mongoose.model('User');
var Bid = mongoose.model('Bid');
var Item = mongoose.model('Item');


module.exports = {
  //User fucntion ===============================
  login: (req, res)=> {
    User.findOne(req.body).exec((err, foundUser)=>{
      if(foundUser){
        req.session.userId = foundUser._id;
        res.json(foundUser)

      }else {

        var newUser = new User(req.body);
        console.log(newUser);
        newUser.save(function(err, savedUser){

          if(err){
            res.json(err)

          }else {
            req.session.userId = savedUser._id;
            res.json(savedUser)
          }
        })
      }
    })
  },

  getCurrentUser: (req, res)=> {
    User.findOne({_id:req.session.userId}).exec((err, foundUser)=>{
      if(err){
        res.json(err);
      } else {
        res.json(foundUser)
      }
    })
  },//end



  //here are the functions for bids ============================

addBid: (req, res)=> {
    Item.findOne({name: req.body.name}).exec((err, item)=>{
      if(item){
        console.log('Item was Found');
        var thisBid = {bid: req.body.bid, _user:req.session.userId};
        console.log(thisBid);
        var newBid = new Bid(thisBid)
        newBid.save((err, bid)=>{
          if(err){
            console.log("there was an error creating Bid");
            res.json(err)
          } else {
            console.log("bidpushed");
            item.bids.push(newBid._id);
            item.save((err, item)=>{
              if(err){
                res.json(err)
              }else{
                res.json(item)
              }
            })

          }
        })
      }else {
        var thisItem = {name:req.body.name}
        var newItem = new Item(thisItem);
        newItem.save((err, item)=>{
          if(err){
            console.log("there was an error saving item");
            res.json(bid)
          }else {
            console.log('Item was created');
            var thisBid = {bid: req.body.bid, _user:req.session.userId};
            var newBid = new Bid(thisBid)
            newBid.save((err, bid)=>{
              if(err){
                console.log("there was an error creating Bid");
                res.json(err)
              } else {
                console.log("bidpushed");
                newItem.bids.push(newBid._id);
                item.save((err, item)=>{
                  if(err){
                    res.json(err)
                  }else{
                    res.json(item)
                  }
                })
              }
            })
          }
        })
      }
    })
},//end

getBids: (req, res)=>{
  Item.find({}).populate({path:'bids', model:'Bid', populate:{path:'_user', model:'User'}}).exec((err, bids)=> {
    if(err){
      console.log(err);
      res.json(err);
    }else {
      console.log(bids);
      res.json(bids)
    }
  })
},


reset: (req, res)=> {
  Item.remove({}, function(err){
  })
}






}














//end
