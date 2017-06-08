

function Vehicle(name, wheels, passengers, speed ){


  var chars = "0123456789ABCEDGHIJKLMNOPQRSTUVWXYZ";
  this.distance_traveled = 0;
  this.name = name;
  this.wheels = wheels;
  this.passengers = passengers;
  this.speed = speed;
  this.vin = getVin()

  function getVin(){
    var vin = "";
    for(var i = 0; i < 17; i++){
      vin += chars[Math.floor(Math.random()*30)]
    }
    return vin
  }


};

Vehicle.prototype.makeNoise = function (noise) {
  console.log(noise);
};

var bike = new Vehicle("bike", 2, 1, 20);

Vehicle.prototype.move = function(){
  this.makeNoise();
  this.updateDistanceTraveled();
  return this;
};

Vehicle.prototype.checkMiles = function(){
  console.log(this.distanceTraveled);
  return this;
};

Vehicle.prototype.updateDistanceTraveled = function(){
  this.distanceTraveled += this.speed;
  console.log(this.distanceTraveled);
  return this;
}















//end
