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

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    @IBOutlet weak var tableView: UIView!
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var addTip: UIButton!
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var locationsTable: UITableView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var overlay: UIView!
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        //logIn()
        //tableView.isHidden = true
        // Do any additional setup after loading the view.
        
        //Stop map being interactive
//        self.map.isZoomEnabled = false;
//        self.map.isScrollEnabled = false;
//        self.map.isUserInteractionEnabled = false;
        
        overlay.alpha = 0
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        self.map.showsUserLocation = true
        
        self.userNameLabel.text = usersDetails.firstName
        
        if let url = NSURL(string:usersDetails.image) {
            if let data = NSData(contentsOf: url as URL){
                profileImage.image = UIImage(data: data as Data)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        let centre = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        let region = MKCoordinateRegion(center: centre, span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
        self.map.setRegion(region, animated: true)
        self.locationManager.stopUpdatingLocation()
        //UIView.animate(withDuration: 0.3, animations: {self.overlay.alpha = 1;})
    }
    
    func mapViewDidFinishRenderingMap(_ mapView: MKMapView, fullyRendered: Bool) {
        UIView.animate(withDuration: 0.3, animations: {self.overlay.alpha = 1;})
    }
    
}
