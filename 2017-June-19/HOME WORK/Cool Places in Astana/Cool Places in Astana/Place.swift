//
//  Place.swift
//  Cool Places in Astana
//
//  Created by YERZHAN SERIKBAY on 6/19/17.
//  Copyright © 2017 YERZHAN SERIKBAY. All rights reserved.
//

import Foundation
import MapKit

class Place: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    
    var title: String?
    var subtitle: String?
    var discipline: String = ""
    var about: String?

//    func pinColor() -> MKPinAnnotationColor {
//        switch discipline {
//        case "University": return .red
//        case "Home", "Park": return .green
//        default: return .purple
//        }
//    }
//}
}
