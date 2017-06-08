

function Deck(){
  this.makeDeck()
  this.showDeck = function (){
    console.log(this.cards)
  }

}


function Card(suit, value){
  this.suit = suit;
  this.value = value;
}


Deck.prototype.makeDeck = function(){
  self = this;
  this.cards = [];
  var suits = ["spades", "diamonds", "hearts", "clubs"];
  var numbers = ["1","2","3","4","5","6","7","8","9","10","11","12","13"];
  for (name in suits) {
    for (number in numbers){
      self.cards.push(new Card(suits[name], numbers[number]));
    }
  }
  return this
}


Deck.prototype.shuffleCardsMethod = function(){
  var self = this;
  var myCards = this.cards
  // console.log(myCards)
  var shuffledCards = []


for (var i = 0; i <  myCards.length; i++ ){
  var rand = Math.floor(Math.random() * myCards.lenth)

}

  // var m = myCards.length, t, i;
  // while (i) {
  //   // Pick a remaining element…
  //   i = Math.floor(Math.random() * i);
  //   // And swap it with the current element.
  //   t = myCards[m];
  //   myCards[m] = myCards[i];
  //   myCards[i] = t;
  //   i--;
  // }
  this.cards = myCards;
  console.log(myCards);
  return;
  }




function shuffle(array) {
  var m = array.length, t, i;
  // While there remain elements to shuffle…
  while (m) {
    // Pick a remaining element…
    i = Math.floor(Math.random() * 5);
    // And swap it with the current element.
    t = array[m];
    array[m] = array[i];
    array[i] = t;
  }

  return array;
}

var myNumbers = ["1","2","3","4","5","6","7","8","9","10","11","12","13"];



var myDeck = new Deck();


myDeck.shuffleCardsMethod();
myDeck.showDeck();







//end
