//
//  DataProvider.swift
//  FestivalParkApp
//
//  Created by Maya Lekova on 2/21/17.
//  Copyright © 2017 Ben Smith. All rights reserved.
//

import Foundation

class DataProvider {
    public static let sharedInstance = DataProvider()
    
    private init() {
    }
    
    public func getFestivalsData() {
        // TODO: request the data from Firebase
        if let filePath = Bundle.main.path(forResource: "Festivals", ofType: "json"), let data = NSData(contentsOfFile: filePath) {
            do {
                let json = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments)
                
                let festivals = Festival.modelsFromDictionaryArray(array: json as! NSArray)
                let movieDetails = ["festivals": festivals]
                NotificationCenter.default.post(name: Notification.Name(rawValue: "gotFestivalsData"), object: self , userInfo: movieDetails)
                
            }
            catch {
                print("Error while parsing hardcoded data")
            }
        } else {
            print("Error while opening json with data")
        }
    }
}
