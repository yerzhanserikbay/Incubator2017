//
//  ViewController.swift
//  Cool Places in Astana
//
//  Created by YERZHAN SERIKBAY on 6/19/17.
//  Copyright © 2017 YERZHAN SERIKBAY. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    
    @IBOutlet var mapView: MKMapView!
    
    var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        
        _ = CLLocation(latitude: 51.0904 , longitude: 71.3985 )
        
        locationManager.requestAlwaysAuthorization()
        
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        mapView.showsPointsOfInterest = true
        mapView.delegate = self
        
        let expo = Place()
        expo.coordinate = CLLocationCoordinate2D(latitude: 51.0893, longitude: 71.4158)
        expo.title = "KAZAKHSTAN EXPO CENTER"
        expo.subtitle = "55 Mangylik El street"
        expo.discipline = "Park"
        expo.about = "Expo 2017 is an International Exposition scheduled to take place between June 10 and September 10, 2017 in Astana, Kazakhstan"
        
        let nu = Place()
        nu.coordinate = CLLocationCoordinate2D(latitude: 51.0899, longitude: 71.4016)
        nu.title = "Nazarbayev University"
        nu.subtitle = "53 Qabanbai Batyr street"
        nu.discipline = "University"
        nu.about = "Nazarbayev University is an autonomous research university in Astana, the capital of Kazakhstan"
        
        let megaSilkWay = Place()
        megaSilkWay.coordinate = CLLocationCoordinate2D(latitude: 51.0899, longitude: 71.4016)
        megaSilkWay.title = "Mega SilkWay"
        megaSilkWay.subtitle = "62 Qabanbai Batyr street"
        megaSilkWay.discipline = "Mall"
        megaSilkWay.about = "MEGA Silk Way is being implemented within EXPO-2017 preparations and will open its doors to customers in December 2016."
        
        let home = Place()
        home.coordinate = CLLocationCoordinate2D(latitude: 51.0911, longitude: 71.4053)
        home.title = "Home"
        home.subtitle = "29/1 street"
        home.discipline = "Home"
        home.about = "Sweet Home"
        
        
        
        let dorm25 = Place()
        dorm25.coordinate = CLLocationCoordinate2D(latitude: 51.0871, longitude: 71.3959)
        dorm25.title = "Nazarbayev University Dormitory"
        dorm25.subtitle = "25 Block"
        dorm25.discipline = "Unversity"
        dorm25.about = "One of the most comfortable dormitory in Nazarbayev University for undergraduted studetns"
        
        let dorm24 = Place()
        dorm24.coordinate = CLLocationCoordinate2D(latitude: 51.0877, longitude: 71.3961)
        dorm24.title = "Nazarbayev University Dormitory"
        dorm24.subtitle = "24 Block"
        dorm24.discipline = "University"
        dorm24.about = "One of the most comfortable dormitory in the Nazarbayev University for MBA students"
        
        let dorm23 = Place()
        dorm23.coordinate = CLLocationCoordinate2D(latitude: 51.0884, longitude: 71.3964)
        dorm23.title = "Nazarbayev University Dormitory"
        dorm23.subtitle = "23 Block"
        dorm23.discipline = "University"
        dorm23.about = "One of the most comfortable dormitory in the Nazarbayev University for graduated studetns"
        
        let dorm22 = Place()
        dorm22.coordinate = CLLocationCoordinate2D(latitude: 51.0890, longitude: 71.3965)
        dorm22.title = "Nazarbayev University Dormitory"
        dorm22.subtitle = "22 Block"
        dorm22.discipline = "University"
        dorm22.about = "One of the most comfortable dormitory in the Nazarbayev University for teachers and profs"
        
        let dorm21 = Place()
        dorm21.coordinate = CLLocationCoordinate2D(latitude: 51.0884, longitude: 71.3983)
        dorm21.title = "Nazarbayev University Dormitory"
        dorm21.subtitle = "21 Block"
        dorm21.discipline = "University"
        dorm22.about = "One of the dormitory in the Nazarbayev University for studetns whoes studyies is not good"
        
        let dorm11 = Place()
        dorm11.coordinate = CLLocationCoordinate2D(latitude: 51.0888, longitude: 71.3984)
        dorm11.title = "Nazarbayev University Dormitory"
        dorm11.subtitle = "11 Block"
        dorm11.discipline = "University"
        dorm11.about = "One of the dormitory in the Nazarbayev University for stuff"
        
        
        
        
        
        mapView.addAnnotation(expo)
        mapView.addAnnotation(nu)
        mapView.addAnnotation(megaSilkWay)
        mapView.addAnnotation(home)
        mapView.addAnnotation(dorm25)
        mapView.addAnnotation(dorm24)
        mapView.addAnnotation(dorm23)
        mapView.addAnnotation(dorm22)
        mapView.addAnnotation(dorm21)
        mapView.addAnnotation(dorm11)
        
        
        
    }


}

//MARK: - Information Button

extension ViewController: MKMapViewDelegate {
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? Place {
            let identifier = "pin" // differents between as? and as!
            var view: MKPinAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView {
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton.init(type: .detailDisclosure) as UIView
            }
            return view
        }
        return nil
    }

    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        let place = view.annotation as! Place
        let placeTitle = place.title
    //    let placeSubtitle = place.subtitle
        let placeAbout = place.about
     //   let placeDiscipline = place.discipline
        
        let ac = UIAlertController(title: placeTitle, message: placeAbout, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
}

//extension ViewController: MKMapViewDelegate {
//    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
//        let annotation = view.annotation
//        
//        let userLocation = mapView.userLocation.location
//        
//        let annotationLocation = CLLocation(latitude: (annotation?.coordinate.latitude)!, longitude: (annotation?.coordinate.longitude)!)
//        
//        print(userLocation?.distance(from: annotationLocation) ?? "")
//    }
//}
