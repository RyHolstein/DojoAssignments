//: Playground - noun: a place where people can play

import UIKit


func tossCoin() -> String {
    var randNum = 0
    randNum = Int(arc4random_uniform(2))
    print("Tossing a coin")
    if(randNum == 0){
        print("Heads")
        return "Heads"
    }
    else{
        print("Tails")
        return "Tails"
    }


}


func tossCoinCount(myint: Int) -> Double {

    var heads = 0
    var total = 0
    for _ in 0..<myint {
        var randNum = 0
        randNum = Int(arc4random_uniform(2))
        if(randNum == 0){
            total += 1
            heads += 1
        }
        else{
            total += 1
        }
    }
    print(total)
    print(heads)
    return Double(heads)/Double(total)
}

tossCoinCount(myint: 800)