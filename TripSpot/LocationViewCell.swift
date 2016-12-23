//
//  LocationViewCell.swift
//  TripSpot
//
//  Created by Steve Sandbach on 12/12/2016.
//  Copyright © 2016 Steve Sandbach. All rights reserved.
//

import UIKit

class LocationViewCell: UITableViewCell {
    @IBOutlet weak var locationDistanceLabel: UILabel!
    @IBOutlet weak var locationRatingImage: UIImageView!
    @IBOutlet weak var locationAreaLabel: UILabel!
    @IBOutlet weak var locationNameLabel: UILabel!
    //stars
    @IBOutlet var starOne: UIImageView!
    @IBOutlet var starTwo: UIImageView!
    @IBOutlet var starThree: UIImageView!
    @IBOutlet var starFour: UIImageView!
    @IBOutlet var starFive: UIImageView!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
