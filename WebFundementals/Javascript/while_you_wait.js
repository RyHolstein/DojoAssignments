var daysUntilMyBirthday = 60;

while(daysUntilMyBirthday >= 0){
  if(daysUntilMyBirthday > 30)
    {
      console.log(daysUntilMyBirthday, "days until my birthday. Such a long time")
      daysUntilMyBirthday--;
      continue;
    }

  if(daysUntilMyBirthday > 5)
   {
     console.log(daysUntilMyBirthday, "days until my birthday its almost here")
     daysUntilMyBirthday--;
     continue;
    }
  if(daysUntilMyBirthday > 0)
    {
      console.log(daysUntilMyBirthday, "DAYS UNTIL MY BIRTHDAY!!!")
      daysUntilMyBirthday--;
      continue;
    }
   if(daysUntilMyBirthday=== 0)
     {
       console.log("MY BIRTHDAY IS FINALLY HERE!!!")
       daysUntilMyBirthday--;
     }

}
