var Controller = require('../controllers/controller');
var path = require('path');

module.exports = function(app){
  //routes for customer *********************
  app.post('/api/customer/create', Controller.createCustomer),
  app.get('/api/customer/getAll', Controller.getAllCustomers),
  app.get('/api/customer/delete/:id', Controller.deleteCustomer),
  //routes for Product **********************
  app.post('/api/product/create', Controller.createProduct),
  app.get('/api/product/getAll', Controller.getAllProducts)

}
