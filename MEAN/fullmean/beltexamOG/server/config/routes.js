var Controller = require('../controllers/controller');



module.exports = (app)=> {
  app.post('/api/user/login', Controller.login),
  app.post('/api/bid/addbid', Controller.addBid),
  app.get('/api/bids/get', Controller.getBids),
  app.get('/api/reset', Controller.reset)
}
