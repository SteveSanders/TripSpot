//
//  LocationsTableViewController.swift
//  TripSpot
//
//  Created by Steve Sandbach on 12/12/2016.
//  Copyright © 2016 Steve Sandbach. All rights reserved.
//

import UIKit
//, UIViewControllerTransitioningDelegate, UINavigationControllerDelegate
class LocationsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var backButton: UIButton!
    @IBOutlet weak var locationTable: LocationTableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        zoomed = true
        self.locationTable.register(LocationViewCell.self, forCellReuseIdentifier: "LocationCell")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.navigationController?.delegate = customPresentAnimationController
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //tableView.tableFooterView = UIView()
        //return 10
        return locations.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell", for: indexPath) as! LocationViewCell
        let location = locations[indexPath.row]
        cell.locationAreaLabel?.text = location.areaName
        cell.locationNameLabel?.text = location.locationName
        //over 200 meters it displasyin km not meters.
        if location.distance > 200 {
            var distance = Double(location.distance)
            var range: Double = distance / 1000
            var rangeTwo = Double(round(100*range)/100)
            cell.locationDistanceLabel?.text = rangeTwo.description + "km"
        } else {
            cell.locationDistanceLabel?.text = location.distance.description + "m"
        }
        let star: UIImage = UIImage(named: "star")!
        let noStar: UIImage = UIImage(named: "noStar")!

        //setStars - need to change image to no star instead of just hide it
        if location.rating < 4 {
            cell.starTwo?.image = noStar
        }
        if location.rating < 6 {
            cell.starThree?.image = noStar
        }
        if location.rating < 8 {
            cell.starFour?.image = noStar
        }
        if location.rating < 10 {
            cell.starFive?.image = noStar
        }
        
        
        return cell
    }
    
    func setStars(rating: Int) {
        
    }

//    @IBAction func goBack(sender: AnyObject) {
//        
//        let view: UIViewController = MapViewController()
//        sender setImage(view)
//        
//        
//    }
    // Override to support conditional editing of the table view.
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }
 
    let customPresentAnimationController = CustomPresentAnimationController()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAction" {
            print("doing our custom shit")
            let destination = segue.destination
            destination.transitioningDelegate = customPresentAnimationController
            destination.modalPresentationStyle = .custom
        }
    }
    
    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
