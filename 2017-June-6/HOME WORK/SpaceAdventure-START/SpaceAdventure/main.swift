/*

This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike
4.0 International License, by Yong Bakos.

*/

import Foundation

//let solarSystem = "Solar System"


print("Welcome to the Solar System! There are 8 planets to explore. What is your name?")

let name = getln()

print("Nice to meet you, \(name). My name is Eliza, I'm an old friend of Siri. Let's go on an adventure! Shall I randomly choose a planet for you to visit? (Y or N)")

let answer = getln()


if (answer == "Y") {
    print(planets[randomIndex])
} else if (answer == "N"){
    print("About which planet do you want to read interesting fact?\n\n1.Mercury\n2.Earth\n3.Mars")
    
    let planet = getln()

    switch planet {
        case ("Mercury"):
            print("\(mercury.describe)")
        case ("Earth"):
            print("\(earth.describe)")
        case ("Mars"):
            print("\(mars.describe)")
        default: print("ERROR")
    }
}
