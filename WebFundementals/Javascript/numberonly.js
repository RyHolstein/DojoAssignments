//var newArray = numbersOnly([1, "apple", -3, "orange", 0.5]);

function numbersonly(arr){
  var newArray=[]
  for(var i =0; i<arr.length; i++){
    if(typeof arr[i] === "number")
      newArray.push(arr[i]);
  }
   console.log(newArray)
}

numbersonly([1, "apple", -3, "orange", 0.5])
