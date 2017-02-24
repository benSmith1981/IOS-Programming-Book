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

    var festivalarray: [Festival] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        // Register to receive notification data
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(MapViewController.notifyObservers),
                                               name:  NSNotification.Name(rawValue: "gotFestivalsData" ),
                                               object: nil)
        DataProvider.sharedInstance.getFestivalsData()
        //set the location to current location
        locationManager.delegate = self
        locationManager.distanceFilter = 1000
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        mapView.showsUserLocation = true

        
        // Get the windmills from Firebase
//        retrieveWindmillsData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showWindmillsOnMapFirebase(){
        
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
    
    func showFestivalsOnMap(){
        
        for festival in festivalarray {
            
            if let name = festival.title,
                let latString = festival.location?.latitude,
                let longString = festival.location?.longitude {
                
                //need to remove the comma
                let newlatString = latString.replacingOccurrences(of: ",", with: ".", options: .literal, range: nil)
                let newlongString = latString.replacingOccurrences(of: ",", with: ".", options: .literal, range: nil)

                let lat = Double(newlatString)
                let long = Double(newlongString)

                var currentFestivalLocation = CLLocationCoordinate2D(latitude: lat!,longitude: long!)
                let festivalAnnotation = MapAnnotation.init(coordinate: currentFestivalLocation, eigenaar: name)
                mapView.addAnnotation(festivalAnnotation)
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
    
    
    // 1
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? MapAnnotation {
            let identifier = "pin"
            var view: MKPinAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
                as? MKPinAnnotationView { // 2
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {
                // 3
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                //                view.rightCalloutAccessoryView = UIButton(.detailDisclosure) as UIView
            }
            return view
        }
        return nil
    }
    
    func notifyObservers(notification: NSNotification) {
        var festivalsDictionary: Dictionary<String,[Festival]> = notification.userInfo as! Dictionary<String, [Festival]>
        festivalarray = festivalsDictionary["festivals"]!
        showFestivalsOnMap()
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
