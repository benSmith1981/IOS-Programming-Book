//
//  MapAnnotation.swift
//  FireBaseTest
//
//  Created by Ben Smith on 16/02/2017.
//  Copyright © 2017 Ben Smith. All rights reserved.
//

import UIKit
import MapKit

class MapAnnotation: NSObject, MKAnnotation {
    var festival: Festival

    //required for call out
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(festival: Festival) {

        self.festival = festival
        self.title = festival.title
        
        if let latString = festival.location?.latitude,
            let longString = festival.location?.longitude {
            //need to remove the comma
            let newlatString = latString.replacingOccurrences(of: ",", with: ".", options: .literal, range: nil)
            let newlongString = longString.replacingOccurrences(of: ",", with: ".", options: .literal, range: nil)
            
            let lat = Double(newlatString)
            let long = Double(newlongString)
            
            self.coordinate = CLLocationCoordinate2D(latitude: lat!, longitude: long!)
        } else {
            self.coordinate = CLLocationCoordinate2D(latitude: 0, longitude: 0)
        }
        self.subtitle = festival.details?.en?.shortdescription
        
        super.init()

    }

}
