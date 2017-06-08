

function runningLogger(){
  console.log("I am Running")
}


runningLogger()


function multiplyByTen(val){
  var multNum = val * 10;
  return multNum
}
console.log(multiplyByTen(5))


function stringReturnOne(){return "This is String One"}

function stringReturnTwo(){return "This is String Two"}


function caller(input){
  if (typeof(input) == "function") {
    console.log("runed")
    input();
  }
  else {
    console.log("Not a function");
    return "nothing"
   }
}

caller(stringReturnTwo);
caller("This is String Two");


function myDoubleConsoleLog(input1, input2) {
  if (typeof(input1) == "function" && typeof(input2) == "function"){
    console.log(input1(), input2())

  }
}

myDoubleConsoleLog(stringReturnOne, stringReturnTwo)


function caller2(input){
  console.log("Starting")
  setTimeout(function(){
    if (typeof(input) == "function"){
  }}, 2000)
  console.log("endings");
  return "interesting";
}

caller2(myDoubleConsoleLog)





















//end
