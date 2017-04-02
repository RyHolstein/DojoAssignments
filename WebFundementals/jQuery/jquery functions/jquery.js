$(document).ready(function(){
  $("#click").click(function(){
    alert('I knew you would');
  })
  $("#disappearbutton").click(function(){
    $("#disappear").hide('slow');
  })
  $("#reappear").click(function(){
    $("#disappear").show('slow');
  })
  $("#lebronpic").click(function(){
    $(".lebron").toggle();
  })
  $("#slide").click(function(){
    $("#dms").slideDown();
  })
  $("#slideb").click(function(){
    $("#dms").slideUp();
  });


  $("#toggleslide").click(function(){
    $("#datboi").slideToogle();
  });

  $("#goat").click(function(){
    $("#thegoat").fadeIn();
  });
  $("#nabro").click(function(){
    $("#thegoat").fadeOut();
  });
  $("#future").addClass("highlight");
  $( ".inner" ).before( "<p>Test</p>" );
  $( ".inner" ).after( "<p>Test Complete</p>");
  $( ".inner" ).append( "<p>Test 1 Complete</p>")
  $( ".inner" ).html("what is up with you");
  $( "p" ).text( "get it with you" );
});
