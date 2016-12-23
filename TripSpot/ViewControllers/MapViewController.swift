//
//  MapViewController.swift
//  TripSpot
//
//  Created by Steve Sandbach on 02/11/2016.
//  Copyright © 2016 Steve Sandbach. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate, UIViewControllerTransitioningDelegate {
    @IBOutlet weak var tableView: UIView!
    
    @IBOutlet weak var logOut: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var addTip: UIButton!
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var locationsTable: UITableView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var overlay: UIView!
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        print(transitioningDelegate)
        if transitioningDelegate != nil {
            print("Should do some custom things...")
            //transitioningDelegate?.animationController!(forPresented: self, presenting: self, source: self)
        }
        overlay.alpha = 0
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        self.map.showsUserLocation = true
        self.map.showsPointsOfInterest = false
        
        
        self.userNameLabel.text = usersDetails?.firstName
        if usersDetails?.image != nil {
            if let url = NSURL(string:(usersDetails?.image)!) {
                if let data = NSData(contentsOf: url as URL){
                    profileImage.image = UIImage(data: data as Data)
                }
            }
        } else {
            print("Image not set!")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logOutHit(_ sender: Any) {
        FBLogOut()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        let centre = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        let region = MKCoordinateRegion(center: centre, span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
        if zoomed {
            self.map.setRegion(region, animated: false)
        } else {
            self.map.setRegion(region, animated: true)
        }
        self.locationManager.stopUpdatingLocation()
    }
    
    func mapViewDidFinishRenderingMap(_ mapView: MKMapView, fullyRendered: Bool) {
        UIView.animate(withDuration: 0.3, animations: {self.overlay.alpha = 1;})
    }
    

}
