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
    var eigenaar : String?
    var coordinate: CLLocationCoordinate2D
    
    init(coordinate: CLLocationCoordinate2D, eigenaar: String) {
        self.eigenaar = eigenaar
        self.coordinate = coordinate
    }

}
