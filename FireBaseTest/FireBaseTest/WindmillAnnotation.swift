//
//  WindmillAnnotation.swift
//  FireBaseTest
//
//  Created by Ben Smith on 25/02/2017.
//  Copyright © 2017 Ben Smith. All rights reserved.
//

//
//  MapAnnotation.swift
//  FireBaseTest
//
//  Created by Ben Smith on 16/02/2017.
//  Copyright © 2017 Ben Smith. All rights reserved.
//

import UIKit
import MapKit

class WindmillAnnotation: NSObject, MKAnnotation {
    var windmill: [String:String]
    
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(windmill: [String:String]) {
        self.windmill = windmill
        if let name = windmill[Constants.windmillFields.Eigenaar],
            let lat = windmill[Constants.windmillFields.LAT],
            let long = windmill[Constants.windmillFields.LNG] {
            self.title = name
            self.subtitle = ""
            self.coordinate = CLLocationCoordinate2D(latitude: Double(lat)!,longitude: Double(long)!)

        } else {
            self.title = ""
            self.subtitle = ""
            self.coordinate = CLLocationCoordinate2D(latitude: 0,longitude: 0)
        }
        
        super.init()
        
    }
    
}

