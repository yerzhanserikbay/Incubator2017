//
//  OpenSettingProfileViewController.swift
//  Share Contact by QR code
//
//  Created by YERZHAN SERIKBAY on 7/15/17.
//  Copyright © 2017 YERZHAN SERIKBAY. All rights reserved.
//

import UIKit
import Eureka
import ImageRow
import EasyPeasy
import PostalAddressRow
import Firebase


class OpenSettingProfileViewController: FormViewController {
    //var textDate: UITextField
    
   // @IBOutlet weak var cancelButton: UIBarButtonItem!
   // @IBOutlet weak var doneButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
           form +++ ImageRow() {
                $0.title = "Choose Photo For Your Profile"
                $0.sourceTypes = [.PhotoLibrary, .SavedPhotosAlbum]
                $0.value = #imageLiteral(resourceName: "user.png")
                $0.cell.height = { 102 }
                $0.clearAction = .no
        }
                .cellUpdate { cell, row in

                    cell.accessoryView?.layer.cornerRadius = 34
                    cell.accessoryView?.frame = CGRect(x: 0, y: 0, width: 68, height: 68)
        }
        
        
        
        
        
            form +++ Section()
            <<< NameRow("First Name") {
                $0.placeholder = "First Name"
        }
            <<< NameRow("Last Name") {
                $0.placeholder = "Last Name"
        }
            <<< NameRow("Company") {
                $0.placeholder = "Company"
        }
        
        

        
        
        
        form +++ MultivaluedSection(multivaluedOptions: [.Insert, .Delete]) {
            $0.addButtonProvider = { section in
                return ButtonRow() {
                    $0.title = "add phone"
                }
                    .cellUpdate { cell, row in
                       // cell.textLabel?.font = .systemFont(ofSize: 18)
                        cell.textLabel?.textColor = .black
                        cell.textLabel?.textAlignment = .left
                }
            }
            
            $0.multivaluedRowToInsertAt = { index in
                return PhoneRow("Phone number") {
                    $0.value = "+"
                    $0.placeholder = "Phone"
                }
    
            }
        }
        
        
        
        form +++ MultivaluedSection(multivaluedOptions: [.Insert, .Delete]) {
            $0.addButtonProvider = { section in
                return ButtonRow() {
                    $0.title = "add email"
                }
                
                    .cellUpdate { cell, row in
                        cell.textLabel?.textColor = .black
                        cell.textLabel?.textAlignment = .left
                }
            }
            
            $0.multivaluedRowToInsertAt = { index in
                return EmailRow("Email") {
                    $0.value = "".appending("@gmail.com")
                    $0.placeholder = "Email"
                }
            }
        
        }

        form +++ MultivaluedSection(multivaluedOptions: [.Insert, .Delete]) {
            $0.addButtonProvider = { section in
                return ButtonRow() {
                    $0.title = "add url"
                    }
                
                    .cellUpdate { cell, row in
                        cell.textLabel?.textColor = .black
                        cell.textLabel?.textAlignment = .left
                }
            }
            
            $0.multivaluedRowToInsertAt = { index in
                return AccountRow("URL") {
                    $0.value = "facebook.com/"
                    $0.placeholder = "URL"
                }
            }
            
        }
        
        form +++ MultivaluedSection(multivaluedOptions: [.Insert, .Delete]) {
            $0.addButtonProvider = { section in
                return ButtonRow() {
                    $0.title = "add address"
                    }
                
                    .cellUpdate { cell, row in
                        cell.textLabel?.textColor = .black
                        cell.textLabel?.textAlignment = .left
                }
            }
            
            $0.multivaluedRowToInsertAt = { index in
                return PostalAddressRow("Address") {
                    $0.streetPlaceholder = "Street"
                    $0.statePlaceholder = "State"
                    $0.cityPlaceholder = "City"
                    $0.countryPlaceholder = "Country"
                    $0.postalCodePlaceholder = "Zip code"
                }
            }
        }
        
        form +++ MultivaluedSection(multivaluedOptions: [.Insert, .Delete]) {
            $0.addButtonProvider = { section in
                return ButtonRow() {
                    $0.title = "add birthday"

                }
                    .cellUpdate { cell, row in
                        cell.textLabel?.textColor = .black
                        cell.textLabel?.textAlignment = .left
                }
            }
            
            $0.multivaluedRowToInsertAt = { index in
                return DateRow("Birthday").cellSetup({ (dateCell, dateRow) in
                    dateRow.value = NSDate() as Date
                    
                })
            }
        }
        
        form +++ MultivaluedSection(multivaluedOptions: [.Insert, .Delete]) {
            $0.addButtonProvider = { section in
                return ButtonRow() {
                    $0.title = "add social profile"
                }
                
                    .cellUpdate { cell, row in
                        cell.textLabel?.textColor = .black
                        cell.textLabel?.textAlignment = .left
                }
            }
            
            $0.multivaluedRowToInsertAt = { index in
                return  AccountRow("Social Profile") {
                    //$0.value = "instagram.com/" how to change value after clicked
                    $0.value = "instagram.com/"
                    $0.placeholder = "Social profile"
                }
            }
        }
        
        form +++ MultivaluedSection(multivaluedOptions: [.Insert, .Delete]) {
            $0.addButtonProvider = { section in
               return ButtonRow() {
                    $0.title = "add instant message"
                }
                    .cellUpdate { cell, row in
                        cell.textLabel?.textColor = .black
                        cell.textLabel?.textAlignment = .left
                }
            }
            $0.multivaluedRowToInsertAt = { insert in
                 return AccountRow("Account") {
                    $0.title = "Skype"
                    $0.placeholder = "Instant message"
                }
            }
        }
        
        
        
        form +++ Section()
            <<< SwitchRow("switchRowTag") {
                $0.title = "Family"
        }
              +++  MultivaluedSection(multivaluedOptions: [.Insert, .Delete]) {
                
                
                $0.hidden = Condition.function(["switchRowTag"], { form in
                    return !((form.rowBy(tag: "switchRowTag") as? SwitchRow)?.value ?? false)
                })
                
                $0.addButtonProvider = {section in
                    return ButtonRow() {
                        $0.title = "add your relatives"
                    }
                        .cellUpdate { cell, row in
                            cell.textLabel?.textColor = .black
                            cell.textLabel?.textAlignment = .left
                    }
                }
                    $0.multivaluedRowToInsertAt = { insert in
                        return TextRow("Relatives") {
                            $0.title = "Mother"
                            $0.placeholder = "Name"
                            }
                    }
            }
    
//        form +++ Section()
//            <<< SwitchRow("switchRowTag"){
//                $0.title = "Show message"
//            }
//            <<< LabelRow(){
//
//                $0.hidden = Condition.function(["switchRowTag"], { form in
//                    return !((form.rowBy(tag: "switchRowTag") as? SwitchRow)?.value ?? false)
//                })
//                $0.title = "Switch is on!"
//            }
     
    
        form +++ Section()
            <<< TextAreaRow("Notes") { row in
                row.value = "I am "
                row.placeholder = "Notes"
        }
    
    }
    
    
    
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    
        let dict = form.values(includeHidden: true)
        
    
        if let firstName = dict["First Name"] as? String
        {
            print(firstName)
            
            let privateFirstName = Database.database().reference().child("Private").child("Frist Name")
            
            privateFirstName.setValue(firstName)
        }
        
        
        
        
        
        
        if let lastName = dict["Last Name"] as? String
        {
            print(lastName)
            
            let privateLastName = Database.database().reference().child("Private").child("Last Name")
            
            privateLastName.setValue(lastName)
        }
        
        
        
        
        
        
        if let company = dict["Company"] as? String
        {
            print(company)
            
            let privateCompany = Database.database().reference().child("Private").child("Company")
            
            privateCompany.setValue(company)
        }
        
        
        
        
        
        
        if let phoneNumber = dict["Phone number"] as? String
        {
            print(phoneNumber)
            
            let privatePhoneNumber = Database.database().reference().child("Private").child("Phone Number")
            
            privatePhoneNumber.setValue(phoneNumber)
        }
        
        
        
        
        
        if let email = dict["Email"] as? String
        {
            print(email)
            
            let privateEmail = Database.database().reference().child("Private").child("Email")
            
            privateEmail.setValue(email)
        }
        
        
        
        
        
        if let url = dict["URL"] as? String
        {
            print(url)
            
            let privateUrl = Database.database().reference().child("Private").child("URL")
            
            privateUrl.setValue(url)
        }
        
        if let address = dict["Address"] as? String
        {
            print(address)
            
            //let privateFirstName = Database.database().reference().child("Private").child("Address")
        
         //   privateFirstName.setValue(address)
        }
        
       // print((dict["Address"]!!))
        
        if let birthday = dict["Birthday"] as? String
        {
            print(birthday)
            
            //let privateFirstName = Database.database().reference().child("Private").child("Birthday")
            
           // privateFirstName.setValue(birthday)
        }
        
      //  print(dict["Birthday"]!!)
        
        if let socialProfile = dict["Social profile"] as? String
        {
            print(socialProfile)
            let privateSocialProfiles = Database.database().reference().child("Private").child("Social Profile")
            
            privateSocialProfiles.setValue(socialProfile)
        }
        
        
        if let account = dict["Account"] as? String
        {
            print(account)
            let privateAccount = Database.database().reference().child("Private").child("Account")
            
            privateAccount.setValue(account)
        }
        
        
        
        if let relatives = dict["Relatives"] as? String
        {
            print(relatives)
            let privateRelatives = Database.database().reference().child("Private").child("Relatives")
            
            privateRelatives.setValue(relatives)
        }
        
        if let notes = dict["Notes"] as? String
        {
            print(notes)
            let privateNotes = Database.database().reference().child("Private").child("Notes")
            
            privateNotes.setValue(notes)
        }
        
        
    
        
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}


