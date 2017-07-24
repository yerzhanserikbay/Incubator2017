//
//  ViewController.swift
//  Share Contact by QR code
//
//  Created by YERZHAN SERIKBAY on 7/10/17.
//  Copyright © 2017 YERZHAN SERIKBAY. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // how to insert info into Farebase

        
        
        
        
      //  let privatePhoneNumber = Database.database().reference().child("Private").child("Phone Number")
        
       // let privateBirthday = Database.database().reference().child("Private").child("Birthday")
    
    //    let privateAdress = Database.database().reference().child("Private").child("Adress")
        

      //  let publicNameSurname = Database.database().reference().child("Public").child("Name")
        
      //  let publicPhoneNumber = Database.database().reference().child("Public").child("Phone Number")
        
      //  let publicOfficeAdress = Database.database().reference().child("Public").child("Office Adress")
        
        
      //  let socialInstagram = Database.database().reference().child("Social").child("Instagram")
        
      //  let socialFacebook = Database.database().reference().child("Social").child("Facebook")
        
       // let socialTweeter = Database.database().reference().child("Social").child("Twitter")
       
      //  privateFirstName.setValue("Yerzhan")
       // privateLastName.setValue("Serikbay")
      //  privatePhoneNumber.setValue("7077710102")
      //  privateBirthday.setValue("13.08.1996")
      //  privateAdress.setValue("Abay av. 162, apr. 19")
        
      //  publicNameSurname.setValue("Yerzhan Serikbay")
      //  publicPhoneNumber.setValue("7077770707")
      //  publicOfficeAdress.setValue("facebook.com/yerzhanserikbay")
        
      //  socialInstagram.setValue("instagram.com/yerzhanserikbay")
   //     socialFacebook.setValue("facebook.com/yerzhanserikbay")
     //   socialTweeter.setValue("twitter.com/yerzhanserikbay")
        
        

        
        
        
        
        
        
        //how to read info from Farebase
        Database.database().reference().observe(.value, with: { (snapshot) in
            guard let value = snapshot.value, snapshot.exists() else {
                print("Error with getting data")
                return
            }
            
            print("Value is \(value)")
        })
        
    }
}

