



function fib() {
  // Some variables here
  var currentNum = 1;
  var prevNum = 0;
  function nacci() {
    console.log(currentNum);
    var x = prevNum
    prevNum = currentNum;
    currentNum = currentNum + x;
  }
  return nacci
}



var fibCounter = fib();
