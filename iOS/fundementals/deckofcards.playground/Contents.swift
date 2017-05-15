//: Playground - noun: a place where people can play

import UIKit



struct Card {
    var value: String
    var suit: String
    var numerical_value: Int
    func show(){
        print(value, "of", suit)
    }
    
//end of card struc
}


class Deck {
    var cards = [Card]()
    init() {
        self.reset()
        print("Creating new Deck of Cards")
    }//end of init
    
    func reset() { //function for making a new deck or resting current one
        let values = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
        let suits = ["Clubs", "Spades", "Hearts", "Diamonds"]
        for suit in suits{
            for  i in 0...12 {
                let newCard = Card(value:values[i], suit:suit, numerical_value:i+1 )
                self.cards.append(newCard)
            }
        }
    }//end of reset

    func deal() -> Card? { //function for drawing card from the top of the deck
        return self.cards.remove(at: 0)
        
    }

    func shuffle() { //fucntion for shuffling cards
        for _ in 0...100{
            let ranNum1 = arc4random_uniform(51)
            let ranNum2 = arc4random_uniform(51)
            if ranNum1 != ranNum2 {
                var temp: Card
                temp = self.cards[Int(ranNum1)]
                self.cards[Int(ranNum1)] = self.cards[Int(ranNum2)]
                self.cards[Int(ranNum2)] = temp
            }
        }
    }//end of shuffle
   
    func show(){
        for card in cards{
            card.show()
        }
    }//end of show
    
//end of Class Card
}

class Player {
    var name: String
    var hand: [Card]
    init(name:String) {
        self.name = name
        self.hand = [Card]()
    }//end init

    func drawcard(deck:Deck) -> Card? {
        if let drawn = deck.deal() {
            self.hand.append(drawn)
            return drawn
        }
        else{
            return nil
        }
    }// end of drawcard
    
    func showHand(){
        print("My hand has ")
        for card in self.hand {
            print(card.value, "of", card.suit)
        }
    }//end of showhand
    
    func findCard(suit:String, value:String) -> Bool {
        for card in self.hand{
            if  card.suit == suit && card.value == value {
                print("true")
                return true
            }
        }
        print("False")
        return false
    }
    
}//end player class





var myDeck: Deck = Deck() //make a new deck
myDeck.shuffle() //shuffle the deck
//deck1.show() //show the cards on the deck

var player: Player = Player(name:"Ryan")

player.drawcard(deck: myDeck)
player.drawcard(deck: myDeck)
player.drawcard(deck: myDeck)
player.drawcard(deck: myDeck)
player.showHand()

player.findCard(suit: "Spades", value: "3")
player.findCard(suit: "Spades", value: "4")
player.findCard(suit: "Spades", value: "5")
player.findCard(suit: "Spades", value: "6")

//for card in deck1.cards {
//    print(card.value)
//    print(card.suit)
//    print(card.numerical_value)
//    print("******************")
//


// ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
//["Clubs", "Spades", "Hearts", "Diamonds"]
// [1,2,3,4,5,6,7,8,9,10,11,12,13]



















//end 



