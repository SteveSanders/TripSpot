//
//  locationsModel.swift
//  TripSpot
//
//  Created by Steve Sandbach on 23/11/2016.
//  Copyright © 2016 Steve Sandbach. All rights reserved.
//

import Foundation

//Below will obviously eventually be pulled by the server.
//var places = ["Almost Famous", "Mowglis", "Pho", "Byron Burger", "Crazy Pedros", "Viet Shack", "B.Eat Street", "La Tasca", "Hard Rock Cafe", "SubWay", "Barburrito", "Greggs", "Weatherspoons", "Pizza Express", "Red's True BBQ"]

var locations = [location]()

struct location {
    let locationName: String
    let areaName: String
    let imageAddress: String
    let rating: Int
    let distance: Int
}

let almostFamous = location(locationName: "Almost Famous", areaName: "Manchester", imageAddress: "www.example.com", rating: 10, distance: 123)
let mowglis = location(locationName: "Mowglis", areaName: "Manchester", imageAddress: "www.example.com", rating: 8, distance: 248)
let pho = location(locationName: "Pho", areaName: "Manchester", imageAddress: "www.example.com", rating: 6, distance: 1049)
let byronBurger = location(locationName: "Byron Burger", areaName: "Manchester", imageAddress: "www.example.com", rating: 5, distance: 67)
let crazyPedros = location(locationName: "Crazy Pedros", areaName: "Manchester", imageAddress: "www.example.com", rating: 8, distance: 894)
let vietShack = location(locationName: "Viet Shack", areaName: "Manchester", imageAddress: "www.example.com", rating: 8, distance: 1300)
let beatStreet = location(locationName: "Beat Street", areaName: "Manchester", imageAddress: "www.example.com", rating: 1, distance: 8)
let laTasca = location(locationName: "La Tasca", areaName: "Manchester", imageAddress: "www.example.com", rating: 5, distance: 7)
let livingRoom = location(locationName: "Living Room", areaName: "Manchester", imageAddress: "www.example.com", rating: 8, distance: 40)
let weatherSpoons = location(locationName: "Moon Under Water", areaName: "Manchester", imageAddress: "www.example.com", rating: 3, distance: 7)
let pizzaExpress = location(locationName: "Pizza Express", areaName: "Manchester", imageAddress: "www.example.com", rating: 3, distance: 2)
let hrc = location(locationName: "Hard Rock Cafe", areaName: "Manchester", imageAddress: "www.example.com", rating: 9, distance: 1052)
let greggs = location(locationName: "Greggs", areaName: "Manchester", imageAddress: "www.example.com", rating: 4, distance: 20)
let barburrito = location(locationName: "Barburrito", areaName: "Manchester", imageAddress: "www.example.com", rating: 5, distance: 489)
let wrap = location(locationName: "Wrap It", areaName: "Manchester", imageAddress: "www.example.com", rating: 8, distance: 187)
let pieMinster = location(locationName: "Example Place With a Really Long Name That Just Keeps On Going On And On", areaName: "Manchester", imageAddress: "www.example.com", rating: 5, distance: 1287)

func addLocations () {
    locations = []
    locations.append(almostFamous)
    locations.append(mowglis)
    locations.append(pho)
    locations.append(byronBurger)
    locations.append(crazyPedros)
    locations.append(vietShack)
    locations.append(beatStreet)
    locations.append(laTasca)
    locations.append(livingRoom)
    locations.append(weatherSpoons)
    locations.append(pizzaExpress)
    locations.append(hrc)
    locations.append(greggs)
    locations.append(barburrito)
    locations.append(wrap)
    locations.append(pieMinster)
}
