var mongoose = require('mongoose');
var Animals = require('./../controllers/animals');
var Animal = mongoose.model("Animal");
module.exports = {
  //create list of all animals
  index : function(req, res){
    Animal.find({}, function(errors, animal) {
      res.render('index', {animal: animal})
    })
  },
  //create a new animal
  create : function(req, res){
    var animal = new Animal(req.body);
    animal.save(function(err){
      if (err){
        console.log(err);
        } else {
        console.log("success");
        res.redirect('/');
      }
    })
  },
  //get the id of the animal
  get_id : function(req, res){
    Animal.find({_id: req.params.id}, function(err, animal){
      if(err){
        console.log(err);
      }
      else {
        res.render('edit.ejs', {animal:animal[0]});
      }
    })
  },
  //create ???
  create_new_page : function(req, res){
    res.render('new.ejs')
  },

  //delete an animal
  delete : function(req, res){
    Animal.remove({ _id: req.params.id }, function(err, result){
      if (err) { console.log(err); }
      res.redirect('/');
    })
  },
  //edit the animal
  edit : function(req, res){
    Animal.update({_id:req.params.id}, req.body, function(err, animal){
      if(err){
       console.log(err);
      } else { res.redirect('/') }
    })
  },



}//the end
