var winNum = (Math.trunc(Math.random()*100));
function quarternum(x){
    for (var i = x; i > 0; i--){
        if ((Math.trunc(Math.random()*100)) == winNum){
            console.log("winner");
            x = x + (Math.floor(Math.random()*50)+50);
        }
    }
    console.log("you lose");
}

quarternum(2);
