//
//  MapControllerViewController.swift
//  TestTabbarNavigation
//
//  Created by Ben Smith on 15/02/2017.
//  Copyright © 2017 Ben Smith. All rights reserved.
//

import UIKit
import MapKit

class MapControllerViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    let regionRadius: CLLocationDistance = 1000
    var festivalarray: [Festival] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        DataProvider.sharedInstance.getFestivalsData()
        let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)

        centerMapOnLocation(location: initialLocation)
        
        
        // Register to receive notification data
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(FestivalTableViewController.notifyObservers),
                                               name:  NSNotification.Name(rawValue: "gotFestivalsData" ),
                                               object: nil)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }

    func notifyObservers(notification: NSNotification) {
        var festivalsDictionary: Dictionary<String,[Festival]> = notification.userInfo as! Dictionary<String, [Festival]>
        festivalarray = festivalsDictionary["festivals"]!
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
