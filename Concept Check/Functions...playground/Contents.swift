//: Playground - noun: a place where people can play

import UIKit

//Recognise the correct function definition
//Recognise correct return of function
//Recognise calling a function
//Recognise parameters in a function
//Recognise parameter types in a function

func myFunction() {
    
}

func myFunction(first: Int, theNextOne: String) {
    
}

func myFunction() -> String{
    return ""
}

myFunction(first: 2, theNextOne: "")

func checkValidEmail(emailToCheck email: String) {
    if email == "" {
    }
}

checkValidEmail(emailToCheck: "")

var money = 100
while (money >= 10){
    money -= 10
}

var budget = 20
var drunk = false

if (money > 90) && (drunk) && (budget < money) {
    print("I got money and I am not drunk")
} else if (money > 90) && (drunk == false) && (budget < money){
    print("I got money but I am drunk")
} else {
    print("Just go home")
}







var lights = true

func turnOnOff() -> Bool {
    return !lights
}

turnOnOff()