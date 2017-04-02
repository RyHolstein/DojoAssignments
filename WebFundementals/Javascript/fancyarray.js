function names(arr){
  console.log(arr);
}

names(["James", "Jill", "Jane", "Jack"])

function namesfancy(arr){
  for(var i = 0; i<arr.length; i++){
  console.log(i + "-->" + arr[i]);
  }
}

namesfancy(["James", "Jill", "Jane", "Jack"])
