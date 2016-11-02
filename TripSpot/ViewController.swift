//
//  ViewController.swift
//  TripSpot
//
//  Created by Steve Sandbach on 31/10/2016.
//  Copyright © 2016 Steve Sandbach. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var FaceBook: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        UIApplication.shared.statusBarStyle = .lightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

