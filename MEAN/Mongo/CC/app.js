var http = require('http');
var fs = require('fs');

var server = http.createServer(function(request, response){
  console.log('client request URL;', request.url);

  //cars domain
  if(request.url == '/cars') {
    fs.readFile('cars.html', 'utf8', function(errors, contents){
      response.writeHead(200, {'Content-Type': 'text/html'});
      response.write(contents);
      response.end();
    });
  }
  else if(request.url == '/images/tesla.jpg') {
    fs.readFile('./images/tesla.jpg', function(errors, contents){
      response.writeHead(200, {'Content-Type': 'image/jpg'});
      response.write(contents);
      response.end();
    });
  }

  //cats domain
  else if(request.url == '/cats') {
    fs.readFile('cats.html', 'utf8', function(errors, contents){
      response.writeHead(200, {'Content-Type': 'text/html'});
      response.write(contents);
      response.end();
    });
  }
  else if(request.url == '/images/cat.jpeg') {
    fs.readFile('./images/cat.jpeg', function(errors, contents){
      response.writeHead(200, {'Content-Type': 'image/jpeg'});
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
