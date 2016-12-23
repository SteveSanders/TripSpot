//
//  userDetailsModal.swift
//  TripSpot
//
//  Created by Steve Sandbach on 23/12/2016.
//  Copyright © 2016 Steve Sandbach. All rights reserved.
//

import Foundation

var userName: String! = "Test"
var userAddress: String! = "fail"

var zoomed = false

struct userDetails {
    var FBID: String
    var firstName: String
    var lastName: String
    var email: String
    var image: String
    var TSID: String
    var authenticated: DarwinBoolean
}

struct Friend {
    let firstName: String
    let lastName: String
    let image: String
    let FBID: String
}

var usersDetails: userDetails? {
    didSet {
        print("USERS DETAILS SET")
        getFriends()
    }
}

var subscribers: [Friend]? {
    didSet {
        print("FRIENDS SET")
    }
}
