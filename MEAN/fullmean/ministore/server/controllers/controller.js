var mongoose = require('mongoose');
var Customer = mongoose.model('Customer');
var Product = mongoose.model('Product');

module.exports = {

  // Customer Function =============================
  createCustomer: function(req, res){
    var newCustomer = new Customer(req.body);
    newCustomer.save((err, savedCustomer)=>{
      if(err){
        console.log(err)
        res.json(err)
      } else {
        res.json(savedCustomer)
      }
    })
  },// end ====

  getAllCustomers: function(req, res){
    Customer.find({}).exec(function(err, customers){
      if(err){
        console.log("Could not get all Customer");
        res.json(err);
      }else{
        res.json(customers)
      }
    })
  },//end =====

  deleteCustomer: (req, res)=> {
    console.log(req.params.id);
    Customer.remove({_id: req.params.id}, (err, data)=> {
      if(err){
        console.log(err)
        res.json(err)
      } else {

        return res.json(data);
      }
    })
  },//end ====

  //==============================================
  // Product Functions ===========================
  createProduct: (req, res)=> {
    var newProduct = new Product(req.body);
    newProduct.save((err, savedProduct)=> {
      if(err){
        console.log(err);
        return res.json(err);
      }else {
        return res.json(savedProduct);
      }
    })
  },//end 
  getAllProducts: (req, res)=> {
    Product.find({}).exec((err, products)=>{
      if (err){
        console.log(err);
        return res.json(err);
      } else {
        return res.json(products);
      }
    })
  },//end










  //Order Functions ==============================






}// END of module Exports



















//end
