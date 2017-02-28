//
//  ViewController.swift
//  MapViewExample
//
//  Created by Ben Smith on 25/02/2017.
//  Copyright © 2017 Ben Smith. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController, MKMapViewDelegate {

    var festivalarray: [Festival] = []
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Register to receive notification data
        //a)
        NotificationCenter.default.addObserver(self, //b)
            selector: #selector(ViewController.notifyObservers), // c)
            name:  NSNotification.Name(rawValue: "gotFestivalsData" ), // d)
            object: nil) // e)
        //get dummy data on festivals
        DataProvider.sharedInstance.getFestivalsData() // f)
        setZoomAndInitialLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func notifyObservers(notification: NSNotification) { //a)
        var festivalsDictionary: Dictionary<String,[Festival]> = notification.userInfo as! Dictionary<String, [Festival]> //b)
        festivalarray = festivalsDictionary["festivals"]! //c)
        showFestivalsOnMap() //b)
    }
    
    // MARK: - Setup map
    
    func setZoomAndInitialLocation() {
        //a) delegate to this class
        mapView.delegate = self
        //b) set location to dam sq
        let damSquareLocation = CLLocationCoordinate2D(latitude: 52.373, longitude: 4.893)
        //c) area in metres to show at zoom level
        let regionRadius: CLLocationDistance = 3000
        //d) make a constant set zoom level at location
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(damSquareLocation,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        //e) tell the mapview to move to this region at a certain zoom level
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    // MARK: - Display retrieve data using observer
    func showFestivalsOnMap(){
        for festival in festivalarray {
            let festivalAnnotation = FestivalMapAnnotation.init(festival: festival)
            self.mapView.addAnnotation(festivalAnnotation)
        }
    }
    
    // MARK: - Map View delegate
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? { //a
        if let annotation = annotation as? FestivalMapAnnotation { //b)
            let identifier = "pin" //c)
            var view: MKAnnotationView //d)
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) { //e)
                dequeuedView.annotation = annotation //f)
                view = dequeuedView //g)
                view.image = UIImage(named:"pin-map") //h)
            } else {
                view = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier) //i)
                view.calloutOffset = CGPoint(x: -5, y: 5) //j)
                view.image = UIImage(named:"pin-map") //k)
                view.detailCalloutAccessoryView = UIButton(type: .detailDisclosure) as UIView //l)
                view.canShowCallout = true //m)
                
            }
            return view //n)
        }
        return nil //o)
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        performSegue(withIdentifier: "pinFestivalDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pinFestivalDetail" {
            let currentAnnotation = mapView.selectedAnnotations[0] as! FestivalMapAnnotation
            
            let destination = segue.destination as? FestivalTableViewController
            
            destination?.theFestival = currentAnnotation.festival
        }
    }
}

