var mongoose = require('mongoose');


var User = mongoose.model('User')
var Message = mongoose.model('Message')
var Comment = mongoose.model('Comment')

module.exports = {
  loginReg: function(req, res) {
    User.findOne({name: req.body.name}, (err, user)=>{
      console.log(user);
      if(user == null){
        let newUser = new User(req.body);
        newUser.save( (err, savedUser)=> {
          if(err){
            console.log(err);
            return res.sendStatus(500);
          } else {
            console.log(savedUser);
            req.session.user = savedUser;
            return res.json(savedUser);
          }
        })
      } else {
        req.session.user = user;
        return res.json(user)
      }
    })
  }, // end of login function

  getMessages: function(req, res) {
    Message.find({}).populate('_user').populate({path: 'comments', populate: {path: '_user'}}).exec( (err, messages)=> {
      if(err){
        console.log("there was an error");
        return res.sendStatus(500);
      } else {
        console.log("success");
        return res.json(messages)
      }
    })//end of if
  }, //end GetMessages



  createMessage: (req, res) => {
    if(!req.session.user){
      return res.sendStatus(401)
    } else {
      console.log('****************');
      console.log(req.body);
      let message = new Message(req.body);
      message._user = req.session.user._id;
      message.save((err, newMessage) => {
        if(err){
          console.log(err);
          return;
        }else {
          return res.json(newMessage);
        }
      })
    }
  },// end of createMessages


  createComment: function(req, res){
    if(!req.session.user){
      return sendStatus(401)
    }
    Message.findOne({_id: req.params.message_id}, (err, message) => {
      if(err){
        console.log(err);
        return res.sendStatus(500);
      }else {
        console.log(message);
        let comment = new Comment(req.body);
        comment._user = req.session.user._id;
        comment.save( (err, newComment) => {
          if(err){
            console.log(err);
            return;
          }else {
            message.comments.push(newComment);
            message.save( (err, savedMessage)=>{
              if(err){
                console.log(err);
                return;
              } else {
                return res.json(savedMessage)
              }
            })
          }
        })

      }
    })
  }// end of create comment





}// end of module Exports
