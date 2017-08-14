//
//  UserSocial.swift
//  Share Contact by QR code
//
//  Created by YERZHAN SERIKBAY on 7/31/17.
//  Copyright © 2017 YERZHAN SERIKBAY. All rights reserved.
//

import Firebase
import FirebaseAuth

class UserSocial {
    

    var firstName: String?
    var lastName: String?
    var company: String?
    var phoneNumber: String?
    var email: String?
    var url: String?
    var address: String?
    var birthday: String?
    var socialProfile: String?
    var instantMessage: String?
    var relatives: String?
    var notes: String?
    
    
    init(firstName: String?) {
        self.firstName = firstName
    }
    
    init(lastName: String?) {
        self.lastName = lastName
    }
    
    init(company: String?) {
        self.company = company
    }
    
    init(phoneNumber: String?) {
        self.phoneNumber = phoneNumber
    }
    
    init(email: String?) {
        self.email = email
    }
    
    init(url: String?) {
        self.url = url
    }
    
    init(address: String?) {
        self.address = address
    }
    
    init(birthday: String?) {
        self.birthday = birthday
    }
    
    init(socialProfile: String?) {
        self.socialProfile = socialProfile
    }
    
    init(instantMessage: String?) {
        self.instantMessage = instantMessage
    }
    
    init(relatives: String?) {
        self.relatives = relatives
    }
    
    init(notes: String?) {
        self.notes = notes
    }
    
    
    
//    static func fetchUser(completion: @escaping ((User?, String?) -> Void)) {
//        
//        let userID = Auth.auth().currentUser?.uid
//        
//        let firstNameRef = Database.database().reference().child("Users").child(userID!).child("Social").child("First Name")
//        
//        firstNameRef.observeSingleEvent(of: .value, with: { snapshot in
//            if let m = snapshot.value as? String {
//                let user = User(firstName: m)
//                completion(user, nil)
//            }
//            
//        })
//        
//        let lastNameRef = Database.database().reference().child("Users").child(userID!).child("Social").child("Last Name")
//        lastNameRef.observeSingleEvent(of: .value, with: { snapshot in
//            if let m = snapshot.value as? String {
//                let user = User(lastName: m)
//                completion(user, nil)
//            }
//        })
//        
//        let companyRef = Database.database().reference().child("Users").child(userID!).child("Social").child("Company")
//        companyRef.observeSingleEvent(of: .value, with: { snapshot in
//            if let m = snapshot.value as? String {
//                let user = User(company: m)
//                completion(user, nil)
//            }
//        })
//        
//        let phoneNumberRef = Database.database().reference().child("Users").child(userID!).child("Social").child("Phone Number")
//        phoneNumberRef.observeSingleEvent(of: .value, with: { snapshot in
//            if let m = snapshot.value as? String {
//                let user = User(phoneNumber: m)
//                completion(user, nil)
//            }
//        })
//        
//        let emailRef = Database.database().reference().child("Users").child(userID!).child("Social").child("Email")
//        emailRef.observeSingleEvent(of: .value, with: { snapshot in
//            if let m = snapshot.value as? String {
//                let user = User(email: m)
//                completion(user, nil)
//            }
//        })
//        
//        let urlRef = Database.database().reference().child("Users").child(userID!).child("Social").child("URL")
//        urlRef.observeSingleEvent(of: .value, with: { snapshot in
//            if let m = snapshot.value as? String {
//                let user = User(url: m)
//                completion(user, nil)
//            }
//        })
//        
//        //   let addressRef = Database.database().reference().child("Users").child(userID!).child("Social").child("Address")
//        //   addressRef.observeSingleEvent(of: .value, with: { snapshot in
//        //       if let m = snapshot.value as? String? {
//        //         let user = User(address: m)
//        //       completion(user, nil)
//        // }
//        //})
//        
//        //let birthdayRef = Database.database().reference().child("Users").child(userID!).child("Social").child("Birthday")
//        //    birthdayRef.observeSingleEvent(of: .value, with: { snapshot in
//        //      if let m = snapshot.value as? String? {
//        //        let user = User(birthday: m)
//        //      completion(user, nil)
//        //   }
//        // })
//        
//        let socialProfileRef = Database.database().reference().child("Users").child(userID!).child("Social").child("Social Profile")
//        socialProfileRef.observeSingleEvent(of: .value, with: { snapshot in
//            if let m = snapshot.value as? String {
//                let user = User(socialProfile: m)
//                completion(user, nil)
//            }
//        })
//        
//        let instantMessageRef = Database.database().reference().child("Users").child(userID!).child("Social").child("Instant Message")
//        instantMessageRef.observeSingleEvent(of: .value, with: { snapshot in
//            if let m = snapshot.value as? String {
//                let user = User(instantMessage: m)
//                completion(user, nil)
//            }
//        })
//        
//        let relativesRef = Database.database().reference().child("Users").child(userID!).child("Social").child("Relatives")
//        relativesRef.observeSingleEvent(of: .value, with: { snapshot in
//            if let m = snapshot.value as? String {
//                let user = User(relatives: m)
//                completion(user, nil)
//            }
//        })
//        
//        let notesRef = Database.database().reference().child("Users").child(userID!).child("Social").child("Notes")
//        notesRef.observeSingleEvent(of: .value, with: { snapshot in
//            if let m = snapshot.value as? String {
//                let user = User(notes: m)
//                completion(user, nil)
//            }
//        })
//    }
}
