var x = [3,5,"Dojo", "rocks", "Michael", "Sensei"];

for (y in x) {
  console.log(x[y])
}

x.push(100);
console.log(x);

var arr = ["hello", "world", "JavaScript is Fun"];

x.push(arr);
console.log(x); // now it looks like an object instead of just an array

function addSumm(){
  var count = 0;
  for (var i = 1; i < 501; i++){
    count += i;
  }
  console.log(count);
}

addSumm();

 var thisArr = [1, 5, 90, 25, -3, 0]

 function findMin(arr){
   var min = arr[0];
   for (var i = 1; i < arr.length; i++){
     if (arr[i] < min){
       min = arr[i];
     }
   }
   console.log(min)
 }

findMin(thisArr)


function findAverage(arr){
  var count = 0;
  for (var i = 0; i < arr.length; i++ ){
    count += arr[i];
  }
  console.log(count/arr.length)
}

findAverage(thisArr);

var newNinja = {
 name: 'Jessica',
 profession: 'coder',
 favorite_language: 'JavaScript', //like that's even a question!
 dojo: 'Dallas'
}


for (index in newNinja){
  console.log("My", index, "is", newNinja[index])
}

















//end
