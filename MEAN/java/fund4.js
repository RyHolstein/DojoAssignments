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
  this.run = function(){
    console.log(this.name, "is running")
    return this.distance_traveled += 10;
  }
  this.crawl = function(){
    console.log(this.name, "is crawling")
    return this.distance_traveled += 1;
  }
}//end of person

//
function Ninja(name, cohort){
  this.name = name;
  this.cohort = cohort;
  this.belt_level = "Yellow Belt";
  this.level_up = function() {
    if (this.belt_level == "Yellow Belt") {
      this.belt_level = "Red Belt";
      return this.belt_level
    }
    if (this.belt_level == "Red Belt") {
      this.belt_level = "Black Belt";
      return this.belt_level
    }
    if (this.belt_level == "Black Belt") {
      console.log("You alerady have the Hokage");
      return this.belt_level
    }
  }
}
//end

var ryan = new Ninja("Ryan", "March 2017");

console.log(ryan.belt_level)
ryan.level_up()
console.log(ryan.belt_level)
ryan.level_up()
console.log(ryan.belt_level)
ryan.level_up()
