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

        let userID = FIRAuth.auth()?.currentUser?.uid
        firebase.child("Windmills").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let dict = snapshot.value as? NSDictionary
            var view = UIView.init()
            print(view.alpha)
//            let databaseArray = Array(dict)
//            for row in databaseArray {
//                print("row")
//            }
        }) { (error) in
            print(error.localizedDescription)
        }

    }
}
