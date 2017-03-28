//
//  DataProvider.swift
//  MyFirstTableViewProject
//
//  Created by Ben Smith on 01/03/2017.
//  Copyright © 2017 Ben Smith. All rights reserved.
//

import Foundation

import FirebaseDatabase

class DataProvider {
    
    public static let sharedInstance = DataProvider() //1) sharedInstance
    
    private init() { //2) Singleton
    }
    
    var ref: FIRDatabaseReference! //3) Reference to firebase
    
    func getShoppingListData() { //3) function to call firebase
        ref = FIRDatabase.database().reference() //4) Create our reference to firebase, store in ref
        
        ref.observeSingleEvent(of: .value, with: { (snapshot) in //5)
            if let dataDictionary = snapshot.value as? NSDictionary {
                var shoppingItemArray = dataDictionary["ShoppingItems"]
                var shoppingDataArray = ShoppingItems.modelsFromDictionaryArray(array: shoppingItemArray as! NSArray)
                let shoppingData = ["shoppingItems": shoppingDataArray]
                NotificationCenter.default.post(name: Notification.Name(rawValue: "gotShoppingListData"), object: self , userInfo: shoppingData)
            } else {
                print("Error while retrieving data from Firebase")
            }
        })
    }
    
    func addData(){
        ref = FIRDatabase.database().reference() //4) Create our reference to firebase, store in ref

        let key = ref.
        let post = ["uid": userID,
                    "author": username,
                    "title": title,
                    "body": body]
        let childUpdates = ["/posts/\(key)": post,
                            "/user-posts/\(userID)/\(key)/": post]
        ref.updateChildValues(childUpdates)
    }
}




//var festivals = ShoppingItem.modelsFromDictionaryArray(array: data)
//let festivalsData = ["festivals": festivals]
//NotificationCenter.default.post(name: Notification.Name(rawValue: "getWindmillsData"), object: self , userInfo: festivalsData)
