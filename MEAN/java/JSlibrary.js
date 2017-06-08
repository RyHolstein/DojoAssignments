var _ = {
   map: function(list, func) {
     for (var i = 0; i <list.length; i++){
       list[i] = func(list[i]);
     }
     return list;
     }
   },

   reduce: function(list, func, memo) {
     var index = 0;
     var total = 0;
     if (!memo) {
        total = list[0];
        index = 1;
     }
     for(var i = index, i < list.length; i++){
       memo = func(list[i], memo);
     }
   },

   find: function(list, callback) {
     var newArray = []
     for (var i = 0 ; i < list.length; i ++){
       if (callback(list[i])){
         return list[i]
       }
     }
   },




   filter: function(list, func) {
     var newArray = [];
     for(let i = 0; i < list.length; i++) {
       if(func(list[i])) {
         newArray.push(list[i]);
       }
     }
     return newArray
   },





   reject: function() {
     var tempArray =[];
    for (var i = 0; i < array.length; i++) {
      if (!callback(array[i])){
        tempArray.push(array[i]);
      }
    }
    // we could also modify the original array
    return tempArray
   }
 }
