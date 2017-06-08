

console.log("welcome")
// VehicleConstructor that takes in the name, number of wheels, and the number of passengers.
// 1 Each vehicle should have a makeNoise method
// 2 Using the constructor, create a Bike
// 3 Redefine the Bike’s makeNoise method to print “ring ring!”
// 4 Create a Sedan
// 5 Redefine the Sedan’s makeNoise method to print “Honk Honk!”
// 6 Using the constructor, create a Bus
// 7 Add a method to Bus that takes in the number of passengers to pick up and adds them to the passenger count​


function  VehicleConstructor(name, numWheels, numPassengers){
  var vehicle = {};

  vehicle.name = name;
  vehicle.numWheels = numWheels;
  vehicle.numPassengers = numPassengers;


  vehicle.makeNoise = function(noise) {
    console.log(noise)
  }
  return vehicle
}



var bike = VehicleConstructor("bike", 2, 1);

bike.makeNoise("Ring Ring")

var sedan = VehicleConstructor("Sedan", 4, 5);
sedan.makeNoise = function(){
  console.log("honk honk");
}

sedan.makeNoise()

var bus = VehicleConstructor("Bus", 8, 0);

bus.addPass = function(number) {
  bus.numPassengers += number;
  return bus.numPassengers;
}

console.log(bus.numPassengers)














//end
