//: Playground - noun: a place where people can play

import UIKit


protocol benDelegate: class {
    func didTeachToday()
    func wasOnTime()
    func sendTheLecture()
    
}

class AccessLevelExample: UIViewController {
    
    var thisIsADefaultPropertyOfAClass: String? // Defaults to Internal or internal to your app
    internal var thisIsAGlobalPropertyOfAClass: String? // Internal to your app
    private var thisIsAPrivatePropertyOfAClass: String? // Private to your class
    public var thisIsAInternalPropertyOfAClass: String? // Public to your application

    final var thisIsFinalCannotBeChangedBySubclasses: String?
    
    final func testFunction() {
        //final function
    }
    
    private func privateTestFunction() {
        //private function
    }
    
    internal func internalTestFunction() {
        //private function
    }
    
    public func publicTestFunction() {
        //private function
    }
}

class SubclassAccess: AccessLevelExample {
    
//    override func privateTestFunction() {
//        
//    }
    
    override func internalTestFunction() {
        //this is ok
        self.thisIsFinalCannotBeChangedBySubclasses = ""
    }
    
    override func publicTestFunction() {
        //public function
    }
    
    
}


var familyNames = ["Ben","Stef","George"]

for (index, value) in familyNames.enumerated(){
    print("\(index) == \(value)")
}

//Our contract...
//protocol CallWifeDelegate: class {
//    func didArriveAtBar()
//    func didExitCab()
//    func didDrinkMoreBeer()
//    func didCallCab()
//    
//}


//Our 
//class WifeController: UIViewController, CallWifeDelegate {
//    func didArriveAtBar(){
//
//    }
//    
//    func didDrinkMoreBeer(){
//
//    }
//    
//    func didExitCab(){
//
//    }
//    
//    func didCallCab(){
//
//    }
//}
