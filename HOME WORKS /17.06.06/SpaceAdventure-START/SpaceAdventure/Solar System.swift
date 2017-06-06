//
//  File.swift
//  SpaceAdventure
//
//  Created by YERZHAN SERIKBAY on 6/6/17.
//  Copyright © 2017 Your School. All rights reserved.
//

import Foundation

class SolarSystem {
    let name: String
    let describe: String
    
    init(planet: String, describe: String) {
        self.name = planet
        self.describe = describe
    }
}

let mercury = SolarSystem(planet: "Mercury", describe: "Mercury is the closest planet to the Sun and the smallest planet in the Solar System")

let earth = SolarSystem(planet: "Earth", describe: "Earth is the largest and densest of the inner planets, the only one known to have current geological activity, and the only place where life is known to exist.")

let mars = SolarSystem(planet: "Mars", describe: "Mars' surface, peppered with vast volcanoes, such as Olympus Mons, and rift valleys, such as Valles Marineris, shows geological activity that may have persisted until as recently as 2 million years ago.")

var planets = [mercury.describe, earth.describe, mars.describe]
let randomIndex = Int(arc4random_uniform(UInt32(planets.count)))
