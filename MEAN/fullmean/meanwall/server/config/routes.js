var controller = require('../controllers/controllers');

module.exports = function(app) {
  app.post('/api/login', controller.loginReg);
  app.get('/api/messages', controller.getMessages);
  app.post('/api/messages', controller.createMessage);
  app.post('/api/comments/:message_id', controller.createComment);
}
