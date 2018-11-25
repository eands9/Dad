//
//  Car.swift
//  Classes and Objects
//
//  Created by Eric Hernandez on 10/22/18.
//  Copyright © 2018 Eric Hernandez. All rights reserved.
//

import Foundation

enum CarType {
    case Sedan
    case Coupe
    case Hatchback
}

class Car {
    var colour = "Black"
    var numberOfSeats = 5
    var typeOfCar : CarType = .Coupe
    
    init(customerChosenColour : String) {
        <#statements#>
    }
}
