var HOUR = 8;
var MINUTE = 10;
var PERIOD = "AM";

if( HOUR===8 && MINUTE===50 && PERIOD==="AM")
  {
    console.log("It's almost 9 in the morning")
  }

if(HOUR===7 && MINUTE===15 && PERIOD==="PM")
  {
    console.log("It's just after 7 in the evening")
  }

 if(MINUTE<=30)
   {
     console.log("It's just after", HOUR)
   }
if(MINUTE>=30)
  {
    console.log("Its's almost", HOUR+1)
  }
if(PERIOD==="AM")
  {
    console.log("in the Morning")
  }
if(PERIOD==="PM")
  {
    console.log("in the evening")
  }
