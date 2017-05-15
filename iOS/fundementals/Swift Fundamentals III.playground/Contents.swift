//: Playground - noun: a place where people can play

import UIKit

var array = [Int]()

for i in 1...225{
    array.append(i)
}

var randNumberOne = Int(arc4random_uniform(UInt32(array.count)))
var randNumberTwo = Int(arc4random_uniform(UInt32(array.count)))

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

swapTwoInts(&array[randNumberOne], &array[randNumberTwo])


for i in 1...100{
    var one = Int(arc4random_uniform(UInt32(array.count)))
    var two = Int(arc4random_uniform(UInt32(array.count)))
    swapTwoInts(&array[one], &array[two])
}

for i in 0..<array.count{
    if array[i] == 45 {
        array.remove(at: i)
        print("We found the answer to the universe at \(i)")
        break
    }
}