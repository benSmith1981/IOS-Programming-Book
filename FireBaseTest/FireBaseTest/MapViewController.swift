//
//  MapViewController.swift
//  FireBaseTest
//
//  Created by Ben Smith on 16/02/2017.
//  Copyright © 2017 Ben Smith. All rights reserved.
//

import UIKit
import MapKit
import Firebase

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var windmillSnapshots: [FIRDataSnapshot] = []
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        
        //set the location to current location
        locationManager.delegate = self
        locationManager.distanceFilter = 1000
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        mapView.showsUserLocation = true

        
        // Get the windmills from Firebase
//        retrieveWindmillsData()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showWindmillsOnMap(){
        
        for windmill in self.windmillSnapshots {
            let windmillSnapshot: FIRDataSnapshot! = windmill
            guard let windmill = windmillSnapshot.value as? [String:String] else { return }
            
            if let name = windmill[Constants.windmillFields.Eigenaar],
                let lat = windmill[Constants.windmillFields.LAT],
                let long = windmill[Constants.windmillFields.LNG] {
                
                var currentWindmillLocation = CLLocationCoordinate2D(latitude: Double(lat)!,longitude: Double(long)!)
                let windmillAnnotation = MapAnnotation.init(coordinate: currentWindmillLocation, eigenaar: name)
                mapView.addAnnotation(windmillAnnotation)
            }
            

        }
    }
    
    func retrieveWindmillsData() {
        
        var ref = FIRDatabase.database().reference()
        // Listen for new messages in the Firebase database
        FIRDatabase.database().reference().child("Windmills").observe(.childAdded, with: { [weak self] (snapshot) -> Void in
            guard let strongSelf = self else { return }
            strongSelf.windmillSnapshots.append(snapshot)
        })
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
