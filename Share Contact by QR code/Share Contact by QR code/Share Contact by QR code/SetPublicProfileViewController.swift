//
//  SetPublicProfileViewController.swift
//  Share Contact by QR code
//
//  Created by YERZHAN SERIKBAY on 7/31/17.
//  Copyright © 2017 YERZHAN SERIKBAY. All rights reserved.
//

import UIKit
import EasyPeasy
import Eureka
import PostalAddressRow
import FirebaseDatabase
import FirebaseAuth
import Firebase

class SetPublicProfileViewController: FormViewController {
    
    var container: UIView = {
        var v = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 116+64 ))
        v.backgroundColor = UIColor(red: 251/255, green: 250/255, blue: 255/255, alpha: 1.0)
        return v
    }()
    
    var firstName: String = "" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var lastName: String = "" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var company: String = "" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var phoneNumber: String = "" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var email: String = "" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var url: String = "" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var address: String = "" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var birthday: String = "" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var socialProfile: String = "" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var instantMessage: String = "" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var relatives: String = "" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var notes: String = "" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Auth.auth().signInAnonymously(completion: { (user, error) in
            
            if error != nil {
                print(error!)
                return
            }
            print("User logged anonymously wth uid: " + user!.uid)
        })
        
        
        self.view.backgroundColor = .white
        self.view.addSubview(self.container)
        
        
        let userImage = UIImageView(frame: CGRect.zero)
        userImage.backgroundColor = .white
        userImage.layer.cornerRadius = 43
        userImage.clipsToBounds = true
        userImage.image = #imageLiteral(resourceName: "user.png") // 2. Photo
        self.container.addSubview(userImage)
        
        let userName = UILabel(frame: CGRect.zero)
        userName.textColor = .black
        userName.sizeToFit()
        userName.text = "Loading..."
        userName.font = userName.font.withSize(27)
        self.container.addSubview(userName)
        
        let userLastName = UILabel(frame: CGRect.zero)
        userLastName.textColor = .black
        userLastName.sizeToFit()
        userLastName.text = "Loading..."
        userLastName.font = userLastName.font.withSize(27)
        self.container.addSubview(userLastName)
        
        let userCompany = UILabel(frame: CGRect.zero)
        userCompany.textColor = .black
        userCompany.sizeToFit()
        userCompany.text = "Loading..."
        userCompany.font = userCompany.font.withSize(14)
        self.container.addSubview(userCompany)
        
        
        
        userName <- [
            Left(116),
            Top(80)
        ]
        
        userLastName <- [
            Left(116),
            Top(30+80)
        ]
        
        userCompany <- [
            Left(116),
            Top(145)
        ]
        
        userImage <- [
            Left(15),
            Top(80),
            Size(CGSize(width: 86, height: 86))
        ]
        
        
        UserPublic.fetchUser { (user, error) in
            if error == nil {
                guard let user = user else { return }
                
                if let number = user.phoneNumber {
                    self.phoneNumber = number
                    self.form.rowBy(tag: "Phone")?.updateCell()
                }
                
                if let firstName = user.firstName {
                    self.firstName = firstName
                    userName.text = firstName
                    
                }
                
                if let lastName = user.lastName {
                    self.lastName = lastName
                    userLastName.text = lastName
                }
                
                if let company = user.company {
                    self.company = company
                    userCompany.text = company
                }
                
                if let email = user.email {
                    self.email = email
                    self.form.rowBy(tag: "Email")?.updateCell()
                }
                
                if let url = user.url {
                    self.url = url
                    self.form.rowBy(tag: "Url")?.updateCell()
                }
                
                //     if let address = user.address {
                //       self.address = address
                //     self.form.rowBy(tag: "Address")?.updateCell()
                // }
                //     if let birthday = user.birthday {
                //       self.birthday = birthday
                //     self.form.rowBy(tag: "Birthday")?.updateCell()
                // }
                
                if let socialProfile = user.socialProfile {
                    self.socialProfile = socialProfile
                    self.form.rowBy(tag: "Social profile")?.updateCell()
                }
                
                if let instantMessage = user.instantMessage {
                    self.instantMessage = instantMessage
                    self.form.rowBy(tag: "Instant message")?.updateCell()
                }
                
                if let relatives = user.relatives {
                    self.relatives = relatives
                    self.form.rowBy(tag: "Family")?.updateCell()
                }
                
                if let notes = user.notes {
                    self.notes = notes
                    self.form.rowBy(tag: "Notes")?.updateCell()
                }
                
            }
        }
       
        form +++ Section()
        form +++ Section()
        form +++ Section()
        
        form +++ Section("Contact Numbers")
            <<< PhoneRow("Phone") { row in
                row.title = "Phone"
                row.placeholder = "Loading..."
                row.disabled = true
                } .cellUpdate { cell, row in
                    row.value = self.phoneNumber
        }
        
        form +++ Section("Email")
            <<< EmailRow("Email") {
                $0.title = "Email"
                $0.placeholder = "Loading..."
                $0.disabled = true
                } .cellUpdate { cell, row in
                    row.value = self.email
        }
        
        form +++ Section("URL")
            <<< AccountRow("Url") {
                $0.title = "URL"
                $0.placeholder = "Loading..."
                $0.disabled = true
                } .cellUpdate { cell, row in
                    row.value = self.url
                    
        }
        
        form +++ Section("Address")
            <<< TextRow("Address") {
                $0.value = "example for address"
                $0.disabled = true
        }
        
        form +++ Section("Birthday")
            <<< TextRow("Birthday") {
                $0.value = "example for birthday"
                $0.disabled = true
        }
        
        form +++ Section("Social Profile")
            <<< AccountRow("Social profile") {
                //$0.title = "Social Profile"
                $0.placeholder = "Loading..."
                $0.disabled = true
                } .cellUpdate { cell, row in
                    row.value = self.socialProfile
        }
        
        form +++ Section("Instant Message")
            <<< AccountRow("Instant message") {
                // $0.title = "Instant message"
                $0.placeholder = "Loading..."
                $0.disabled = true
                } .cellUpdate { cell, row in
                    row.value = self.instantMessage
        }
        
        form +++ Section("Family")
            <<< TextRow("Family") {
                $0.title = "Family"
                $0.placeholder = "Loading..."
                $0.disabled = true
                } .cellUpdate { cell, row in
                    row.value = self.relatives
        }
        
        form +++ Section("Notes")
            <<< TextAreaRow("Notes") { row in
                row.title = "Notes"
                row.placeholder = "Loading..."
                row.disabled = true
                } .cellUpdate { cell, row in
                    row.value = self.notes
        }
    }
}
