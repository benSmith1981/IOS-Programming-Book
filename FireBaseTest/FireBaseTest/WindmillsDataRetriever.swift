//
//  WindmillsDataRetriever.swift
//  FireBaseTest
//
//  Created by Ben Smith on 16/02/2017.
//  Copyright © 2017 Ben Smith. All rights reserved.
//

import Foundation
import Firebase

class WindmillsDataRetriever {
    
    static let sharedInstance = WindmillsDataRetriever()
    private init() {}

    var firebase = FIRDatabase.database().reference()
    var windmillsSnapshots : [FIRDataSnapshot] = []

    func retrieveWindmillsData() {

//        let userID = FIRAuth.auth()?.currentUser?.uid
        firebase.observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            if let dataDict = snapshot.value as? NSDictionary, let data = dataDict["Windmills"] as? NSArray {
                let windmills = Windmills.modelsFromDictionaryArray(array: data)
                let windmillsData = ["windmills": windmills]
                NotificationCenter.default.post(name: Notification.Name(rawValue: "gotWindmillsData"), object: self , userInfo: windmillsData)
            }
            
        }) { (error) in
            print(error.localizedDescription)
        }

    }
}
