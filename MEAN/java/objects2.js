console.log("welcome")




function Vehicle(name, numWheels, numPassengers, speed) {
  var distance_traveled = 0;

  this.name = name;
  this.numWheels = numWheels;
  this.numPassengers = numPassengers;
  this.speed = speed;
  this.makeNoise = function(noise){
    console.log(noise);
  }
  function updateDistanceTraveled(){
    distance_traveled += speed;
    return distance_traveled;
  }
  this.move = function(){
    updateDistanceTraveled();
    this.makeNoise("Honk Honk");
  }
  this.checkmiles = function(){
    console.log(distance_traveled);
  }
}

var car = new Vehicle("car", 4, 5, 50);

car.checkmiles();



















//end
