//: Playground - noun: a place where people can play

import UIKit

for index in 1...10 {
    print(index)
}

var list = ["Coffee","Cake","Frogs legs","Chicken"]
for listItem in list {
    print(listItem)
}

for (index, value) in list.enumerated() {
    print("\(index) \(value)")
}

var dictionaryOfItems = ["Sports" : "Tennis racket", "footwear" : "shoes", "Clothes" : "jeans"]

for (key, value) in dictionaryOfItems {
    print(key)
    print(value)

}