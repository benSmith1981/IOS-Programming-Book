//: Playground - noun: a place where people can play

import UIKit

// Write a function called calculateAverage
// It calculates the average number of numbers from an array
// Average = total of all numbers / number of numbers
// The parametr is an array of Integers, you return a Double
// This is the function defintion:
// func calcAverage(numbers: [Int]) -> Double { }

var numbers = [2, 4, 5 ,6, 6, 6]

func calcAverage(numbers: [Int]) -> Double {
    var total = 0
    let numberOfNumbers = numbers.count
    for number in numbers {
        total += number
    }
    
    return Double(total / numberOfNumbers)
}

print(calcAverage(numbers: numbers))



//Write a function that takes two parameters of type Double
//It returns the 2 numbers multiplied by each other
//The return type is a Double
func multiplyTwoNumbers(number1: Double, number2: Double) -> Double {
    return number1 * number2
}
