$(document).ready(function(){

  $('#text').click(function(){
    console.log("clicked");
    $(this).toggleClass("blue");
    //$(this).css("color", "red");
  });

  $('#text').hover(
    function(){
      $(this).toggleClass("green");
    }
  );




});
















//end
