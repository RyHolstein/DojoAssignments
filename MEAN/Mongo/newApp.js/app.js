

var http = require('http');
var fs = require('fs');

var server = http.createServer(function(request, response){
  console.log('client request URL;', request.url);

  if(request.url == '/') {
    fs.readFile('index.html', 'utf8', function(errors, contents){
      response.writeHead(200, {'Content-Type': 'text/html'});
      response.write(contents);
      response.end();
    });
  }
  else if(request.url == '/style.css') {
    fs.readFile('style.css', 'utf8', function(errors, contents){
      response.writeHead(200, {'Content-Type': 'text/css'});
      response.write(contents);
      response.end();
    });
  }
  else if(request.url == '/ninjas') {
    fs.readFile('ninjas.html', 'utf8', function(errors, contents){
      response.writeHead(200, {'Content-Type': 'text/html'});
      response.write(contents);
      response.end();
    });
  }
  else if(request.url == '/dojos/new') {
    fs.readFile('form.html', 'utf8', function(errors, contents){
      response.writeHead(200, {'Content-Type': 'text/html'});
      response.write(contents);
      response.end();
    });
  }


  else {
    response.writeHead(404);
    response.end("the URL requested is not available")
  }
});

server.listen(8000);
console.log('Running in local host at port 8000');

























//http
