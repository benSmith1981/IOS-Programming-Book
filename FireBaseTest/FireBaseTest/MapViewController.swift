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

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!

    var windmillSnapshots: [FIRDataSnapshot] = []{
        didSet {
        }
    }

    var festivalarray: [Festival] = [] {
        didSet {
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.isNavigationBarHidden = true

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setZoomAndInitialLocation()

        // Register to receive notification data
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(MapViewController.notifyObservers),
                                               name:  NSNotification.Name(rawValue: "gotFestivalsData" ),
                                               object: nil)
        //get dummy data on festivals
        DataProvider.sharedInstance.getFestivalsData()
        
        // Get the windmills from Firebase
//        retrieveWindmillsData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Setup map

    func setZoomAndInitialLocation() {
        //delegate to this class
        mapView.delegate = self
        //set location to dam sq
        let damSquareLocation = CLLocationCoordinate2D(latitude: 52.373, longitude: 4.893)
        //area in metres to show at zoom level
        let regionRadius: CLLocationDistance = 3000
        //set refion
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(damSquareLocation,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    // MARK: - Display retrieve data using observer
    func showFestivalsOnMap(){
        for festival in festivalarray {
            let festivalAnnotation = MapAnnotation.init(festival: festival)
            self.mapView.addAnnotation(festivalAnnotation)
        }
    }
    
    func notifyObservers(notification: NSNotification) {
        var festivalsDictionary: Dictionary<String,[Festival]> = notification.userInfo as! Dictionary<String, [Festival]>
        festivalarray = festivalsDictionary["festivals"]!
        showFestivalsOnMap()
    }
    
    // MARK: - Map View delegate
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? MapAnnotation {
            let identifier = "pin"
            var view: MKAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) {
                dequeuedView.annotation = annotation
                view = dequeuedView
                view.image = UIImage(named:"pin-map")
            } else {
                view = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.image = UIImage(named:"pin-map")
                view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure) as UIView
                view.canShowCallout = true

            }
            return view
        }
        return nil
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        performSegue(withIdentifier: "SeguetoDetailViewController", sender: self)
    }
    
    // MARK: - Segue

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SeguetoDetailViewController" {
            let currentAnnotation = mapView.selectedAnnotations[0] as! MapAnnotation
                        
            let destination = segue.destination as? DetailViewTableViewController
            
            destination?.festival = currentAnnotation.festival
        }
    }
    
    
//    func retrieveWindmillsData() {
//        
//        var ref = FIRDatabase.database().reference()
//        // Listen for new messages in the Firebase database
//        FIRDatabase.database().reference().child("Windmills").observe(.childAdded, with: { [weak self] (snapshot) -> Void in
//            guard let strongSelf = self else { return }
//            strongSelf.windmillSnapshots.append(snapshot)
//        })
//    }
//    
//    func showWindmillsOnMapFirebase(){
//        
//        for windmill in self.windmillSnapshots {
//            let windmillSnapshot: FIRDataSnapshot! = windmill
//            guard let windmill = windmillSnapshot.value as? [String:String] else { return }
//            
//            let windmillAnnotation = WindmillAnnotation.init(windmill: windmill)
//            mapView.addAnnotation(windmillAnnotation)
//            
//        }
//    }

}
