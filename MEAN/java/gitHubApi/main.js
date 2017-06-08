$(document).ready(function(){



$('button').click(function(){
  $.get("https://api.github.com/users/terrymillz", displayName)
});


function displayName(data){
  console.log(data["name"]);
  $(".name_holder").append(data["name"]);
}






}); //end
