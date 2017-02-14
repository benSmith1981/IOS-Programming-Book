//: Playground - noun: a place where people can play

import UIKit
var numbers = [1,2,10,11]
var total:Int = 0

for currentNumber in numbers {
    total = total + currentNumber
    print(total)
}

var dictionaryOfItems = ["Sports" : "Tennis racket", "footwear" : "shoes", "Clothes" : "jeans"]

for (blabla, gogo) in dictionaryOfItems {
    print("\(blabla) in bla bla bla \(gogo)")
}