//: Playground - noun: a place where people can play

import UIKit

//AREA
var width: Double = 10
var height: Double = 10

var area: Double {
    get {
        print("We are getting the area")
        return width * height
    }
}
//print(area)
print(width)

////TIME
class Time {
    var seconds:Double
    
    init(seconds: Double) {
        self.seconds = seconds
    }
    
    var minutes: Double {
        get {
            return seconds / 60
        }
        set(minutes) {
            print("setting \(minutes)")
            seconds = minutes * 60
        }
    }
}
//instance
var time = Time.init(seconds: 300)
//GET the minutes
print(time.minutes)
//SET the mintues
time.minutes = 100
//Now what value is seconds?
print(time.seconds)


//LAZY variables
class Person {
    var name = "Ben"

    lazy var feelingGood: Bool = {
        return self.calculationOfFeelingGood()
    }()
    
    func calculationOfFeelingGood() -> Bool {
        ///how much money
        
        //Good weekend
        
        //Hungover?
        
        //Go on holiday
        
        //Weather...
        
        return true
    }
}

var ben = Person()
print(ben.feelingGood)
