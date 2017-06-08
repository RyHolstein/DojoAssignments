console.log("Welcome")


function sumBetween(num1, num2){ //same but var XY = function(num1, num2){
  var count = 0;
  for (var i = num1; i < num2 + 1; i++){
    count += i;
  }
  return count
}
//console.log(sumBetween(2, 6))
function findMin(arr){ //same but var Min = function(arr) {
  var minIndex = arr[0]
  for (number in arr){
    if (arr[number] < minIndex){
      minIndex = arr[number];
    }
  }
  return minIndex
}

var myArr = [3,6,18,8,20,7]
console.log(findMin(myArr))


function findAvg(arr){  //same but var Avg = function(arr)
  var sum = 0;
  for (number in arr) {
    sum += arr[number];
  }
  return sum/arr.length
}
console.log(findAvg(myArr))


function Person(name) {
  this.name = name;
  this.distance_traveled = 0;
  this.say_name = function() {
    console.log(this.name)
  }
  this.say_something = function(phrase) {
    console.log(this.name, "says", phrase)
  }
  this.walk = function(){
    console.log(this.name, "is Walking")
    return this.distance_traveled += 3;

  }
  this.run = function(){=
    console.log(this.name, "is running")
    return this.distance_traveled += 10;
  }
  this.crawl = function(){
    console.log(this.name, "is crawling")
    return this.distance_traveled += 1;
  }
}//end of person


//vvvvvvvv -random stuff- here vvvvvvv//
function Person(name, age, gender){
  this.name = name;
  this.age = age;
  this.gender = gender;
  this.here = function() {
    console.log("Hello Friend")
  }
}

var ryan = new Person("ryan", 23, "unicorn");
console.log(ryan);

ryan.here()



















//end
