
//express routes
var mongoose = require('mongoose');
var Animal = mongoose.model("Animal")
var Animals = require('./../controllers/animals')
module.exports = function(app){

  //get routes
  app.get('/', Animals.index);
  app.get('/mongooses/edit/:id', Animals.get_id);
  app.get('/mongoose/new', Animals.create_new_page);
  app.get('/mongooses/destroy/:id', Animals.delete);

  //post routes
  app.post('/', Animals.create);
  app.post("/edit/:id", Animals.edit)

}//end
