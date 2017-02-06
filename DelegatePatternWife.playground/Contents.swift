//: Playground - noun: a place where people can play

import UIKit


//Our contract...
protocol CallWifeDelegate: class {
    func didArriveAtBar()
    func didExitCab()
    func didDrinkMoreBeer()
    func didCallCab()
    
}


//Our 
class WifeController: UIViewController, CallWifeDelegate {
    func didArriveAtBar(){

    }
    
    func didDrinkMoreBeer(){

    }
    
    func didExitCab(){

    }
    
    func didCallCab(){

    }
}