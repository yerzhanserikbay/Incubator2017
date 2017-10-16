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
import CoreData

class SetPublicProfileViewController: FormViewController {
    var userName = UILabel(frame: CGRect.zero)
    var userLastName = UILabel(frame: CGRect.zero)
    var userCompany = UILabel(frame: CGRect.zero)
    
    var container: UIView = {
        var v = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 116+64 ))
        v.backgroundColor = UIColor(red: 251/255, green: 250/255, blue: 255/255, alpha: 1.0)
        return v
    }()
    
    var firstName: String? = "" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var lastName: String? = "" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var company: String? = "" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    
    var phoneNumber1: String? = "" {
        didSet{
            self.tableView.reloadData()
        }
    }
    var phoneNumber2: String? = "" {
        didSet{
            self.tableView.reloadData()
        }
    }
    var phoneNumber3: String? = "" {
        didSet{
            self.tableView.reloadData()
        }
    }
    var phoneNumber4: String? = "" {
        didSet{
            self.tableView.reloadData()
        }
    }
    var phoneNumber5: String? = "" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    
    
    var email1: String? = "" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var email2: String? = "" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var email3: String? = "" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var email4: String? = "" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var email5: String? = "" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    
    var url1: String? = "" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var url2: String? = "" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var url3: String? = "" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var url4: String? = "" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var url5: String? = "" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    
    
    var street1: String? = "" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var state1: String? = "" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var city1: String? = "" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var country1: String? = "" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var postalCode1: String? = "" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    
    
    
    var street2: String? = "" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var state2: String? = "" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var city2: String? = "" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var country2: String? = "" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var postalCode2: String? = "" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var street3: String? = "" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    
    
    var state3: String? = "" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var city3: String? = "" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var country3: String? = "" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var postalCode3: String? = "" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    
    
    
    var birthday: String? {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    
    
    var socialProfile1: String? = "&" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var socialProfile2: String? = "&" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var socialProfile3: String? = "&" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var socialProfile4: String? = "&" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var socialProfile5: String? = "&" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    
    
    
    
    var instantMessage1: String? = "&" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var instantMessage2: String? = "&" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var instantMessage3: String? = "&" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var instantMessage4: String? = "&" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var instantMessage5: String? = "&" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    
    
    var relatives1: String? = "&" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var relatives2: String? = "&" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var relatives3: String? = "&" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var relatives4: String? = "&" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var relatives5: String? = "&" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    
    var notes: String? = "" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        getUsers()
        self.form.allRows.forEach { $0.updateCell() }
        self.tableView?.reloadData()
        UIApplication.shared.isStatusBarHidden = false
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        deleteUser()
        self.tableView?.backgroundColor = UIColor.white
        self.tableView.contentInset = UIEdgeInsetsMake(-23,0,0,0)
        navigationController?.navigationBar.barTintColor = UIColor(red: 35/255, green: 31/255, blue: 32/255, alpha: 1.0)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = UIColor.white
        getUsers()
        
        
        form +++
            Section(header: "Personal Information", footer: "")
            <<< TextRow() {
                $0.tag = "firstName"
                $0.title = "First name"
                $0.placeholder = "None"
                $0.disabled = true
                } .cellUpdate { cell, row in
                    row.value = self.firstName
            }
            
            <<< TextRow() {
                $0.tag = "lastName"
                $0.title = "Last name"
                $0.placeholder = "None"
                $0.disabled = true
                } .cellUpdate { cell, row in
                    row.value = self.lastName
            }
            
            <<< TextRow() {
                $0.tag = "company"
                $0.title = "Company"
                $0.placeholder = "None"
                $0.disabled = true
                } .cellUpdate { cell, row in
                    row.value = self.company
        }
        
        form +++ MultivaluedSection(multivaluedOptions: [], header: "Contact Numbers") {
            $0.addButtonProvider = { section in
                return ButtonRow("Button") {
                    $0.title = "add phone"
                    }
                    .cellUpdate { cell, row in
                        cell.textLabel?.textColor = .black
                        cell.textLabel?.textAlignment = .left
                }
            }
            
            $0.multivaluedRowToInsertAt = { index in
                return PhoneRow("tag_\(index + 1)") {
                    $0.placeholder = "Phone"
                }
            }
            
            $0 <<< PhoneRow() {
                $0.tag = "tag_1"
                $0.title = "Phone"
                $0.placeholder = "None"
                $0.disabled = true
                } .cellUpdate { cell, row in
                    row.value = self.phoneNumber1
                    row.cell.update()
            }
            
            if phoneNumber2 != "" {
                $0 <<< PhoneRow() {
                    $0.tag = "tag_2"
                    $0.title = "Phone"
                    $0.disabled = true
                    } .cellUpdate { cell, row in
                        row.value = self.phoneNumber2
                        row.cell.update()
                }
            }
            
            if phoneNumber3 != "" {
                $0 <<< PhoneRow() {
                    $0.tag = "tag_3"
                    $0.title = "Phone"
                    $0.disabled = true
                    } .cellUpdate { cell, row in
                        row.value = self.phoneNumber3
                        row.cell.update()
                }
            }
            
            if phoneNumber4 != "" {
                $0 <<< PhoneRow() {
                    $0.tag = "tag_4"
                    $0.title = "Phone"
                    $0.disabled = true
                    } .cellUpdate { cell, row in
                        row.value = self.phoneNumber4
                        row.cell.update()
                }
            }
            
            if phoneNumber5 != "" {
                $0 <<< PhoneRow() {
                    $0.tag = "tag_5"
                    $0.title = "Phone"
                    $0.disabled = true
                    } .cellUpdate { cell, row in
                        row.value = self.phoneNumber5
                        row.cell.update()
                }
            }
        }
        
        
        form +++ MultivaluedSection(multivaluedOptions: [], header: "Email") {
            $0.addButtonProvider = { section in
                return ButtonRow("EmailButton") {
                    $0.title = "add email"
                    }
                    .cellUpdate { cell, row in
                        cell.textLabel?.textColor = .black
                        cell.textLabel?.textAlignment = .left
                }
            }
            
            $0.multivaluedRowToInsertAt = { index in
                return TextRow("Email_\(index + 1)") {
                    $0.placeholder = "Email"
                }
            }
            
            $0 <<< TextRow() {
                $0.tag = "Email_1"
                $0.title = "Email"
                $0.disabled = true
                $0.placeholder = "None"
                } .cellUpdate { cell, row in
                    row.value = self.email1
                    row.cell.update()
            }
            
            if email2 != "" {
                $0 <<< TextRow() {
                    $0.tag = "Email_2"
                    $0.title = "Email"
                    $0.disabled = true
                    } .cellUpdate { cell, row in
                        row.value = self.email2
                        row.cell.update()
                }
            }
            
            if email3 != "" {
                $0 <<< TextRow() {
                    $0.tag = "Email_3"
                    $0.title = "Email"
                    $0.disabled = true
                    } .cellUpdate { cell, row in
                        row.value = self.email3
                        row.cell.update()
                }
            }
            
            if email4 != "" {
                $0 <<< TextRow() {
                    $0.tag = "Email_4"
                    $0.title = "Email"
                    $0.disabled = true
                    } .cellUpdate { cell, row in
                        row.value = self.email4
                        row.cell.update()
                }
            }
            
            if email5 != "" {
                $0 <<< TextRow() {
                    $0.tag = "Email_5"
                    $0.title = "Email"
                    $0.disabled = true
                    } .cellUpdate { cell, row in
                        row.value = self.email5
                        row.cell.update()
                }
            }
        }
        
        
        form +++ MultivaluedSection(multivaluedOptions: [], header: "URL") {
            $0.addButtonProvider = { section in
                return ButtonRow("UrlButton") {
                    $0.title = "add url"
                    }
                    .cellUpdate { cell, row in
                        cell.textLabel?.textColor = .black
                        cell.textLabel?.textAlignment = .left
                }
            }
            
            $0.multivaluedRowToInsertAt = { index in
                return TextRow("URL_\(index + 1)") {
                    $0.placeholder = "URL"
                }
            }
            
            $0 <<< TextRow() {
                $0.tag = "Url_1"
                $0.disabled = true
                $0.title = "URL"
                $0.placeholder = "None"
                } .cellUpdate { cell, row in
                    row.value = self.url1
                    row.cell.update()
            }
            
            if url2 != "" {
                $0 <<< TextRow() {
                    $0.tag = "Url_2"
                    $0.title = "URL"
                    $0.disabled = true
                    } .cellSetup { cell, row in
                        row.value = self.url2
                        row.cell.update()
                }
            }
            
            if url3 != "" {
                $0 <<< TextRow() {
                    $0.tag = "Url_3"
                    $0.title = "URL"
                    $0.disabled = true
                    } .cellUpdate { cell, row in
                        row.value = self.url3
                        row.cell.update()
                }
            }
            
            if url4 != "" {
                $0 <<< TextRow() {
                    $0.tag = "Url_4"
                    $0.title = "URL"
                    $0.disabled = true
                    } .cellUpdate { cell, row in
                        row.value = self.url4
                        row.cell.update()
                }
            }
            
            if url5 != "" {
                $0 <<< TextRow() {
                    $0.tag = "Url_5"
                    $0.title = "URL"
                    $0.disabled = true
                    } .cellUpdate { cell, row in
                        row.value = self.url5
                        row.cell.update()
                }
            }
        }
        
        form +++ MultivaluedSection(multivaluedOptions: [], header: "Address") {
            $0.addButtonProvider = { section in
                return ButtonRow("AddressButton") {
                    $0.title = "add address"
                    }
                    
                    .cellUpdate { cell, row in
                        cell.textLabel?.textColor = .black
                        cell.textLabel?.textAlignment = .left
                }
            }
            
            $0.multivaluedRowToInsertAt = { index in
                return PostalAddressRow("Address_\(index + 1)") {
                    $0.value = PostalAddress()
                    $0.streetPlaceholder = "Street"
                    $0.statePlaceholder = "State"
                    $0.cityPlaceholder = "City"
                    $0.countryPlaceholder = "Country"
                    $0.postalCodePlaceholder = "Zip code"
                }
            }
            
            $0 <<< PostalAddressRow() {
                $0.tag = "Address_1"
                $0.value = PostalAddress()
                $0.streetPlaceholder = "Street"
                $0.statePlaceholder = "State"
                $0.cityPlaceholder = "City"
                $0.countryPlaceholder = "Country"
                $0.postalCodePlaceholder = "Zip code"
                $0.disabled = true
                
                } .cellUpdate { cell, row in
                    row.value?.street = self.street1
                    row.value?.state = self.state1
                    row.value?.city = self.city1
                    row.value?.country = self.country1
                    row.value?.postalCode = self.postalCode1
                    row.cell.update()
            }
            
            
            if street2 != "" {
                $0 <<< PostalAddressRow() {
                    $0.tag = "Address_2"
                    $0.value = PostalAddress()
                    $0.streetPlaceholder = "Street"
                    $0.statePlaceholder = "State"
                    $0.cityPlaceholder = "City"
                    $0.countryPlaceholder = "Country"
                    $0.postalCodePlaceholder = "Zip code"
                    $0.disabled = true
                    
                    } .cellUpdate { cell, row in
                        row.value?.street = self.street2
                        row.value?.state = self.state2
                        row.value?.city = self.city2
                        row.value?.country = self.country2
                        row.value?.postalCode = self.postalCode2
                        row.cell.update()
                }
            }
            if street3 != "" {
                $0 <<< PostalAddressRow() {
                    $0.tag = "Address_3"
                    $0.value = PostalAddress()
                    $0.streetPlaceholder = "Street"
                    $0.statePlaceholder = "State"
                    $0.cityPlaceholder = "City"
                    $0.countryPlaceholder = "Country"
                    $0.postalCodePlaceholder = "Zip code"
                    $0.disabled = true
                    
                    } .cellUpdate { cell, row in
                        row.value?.street = self.street3
                        row.value?.state = self.state3
                        row.value?.city = self.city3
                        row.value?.country = self.country3
                        row.value?.postalCode = self.postalCode3
                        row.cell.update()
                }
            }
        }
        
        form +++ Section("Birthday")
            <<< TextRow("Birthday") {
                $0.title = "Your birthday"
                $0.placeholder = "None"
                $0.disabled = true
                } .cellUpdate { cell, row in
                    row.value = self.birthday
                    row.cell.update()
        }
        
        
        form +++ MultivaluedSection(multivaluedOptions: [], header: "Social Profiles") {
            $0.addButtonProvider = { section in
                return ButtonRow("socialButton") {
                    $0.title = "add social profile"
                    }
                    
                    .cellUpdate { cell, row in
                        cell.textLabel?.textColor = .black
                        cell.textLabel?.textAlignment = .left
                }
            }
            
            $0.multivaluedRowToInsertAt = { index in
                return  TextRow("Social Profile_\(index + 1)") {
                    $0.title = "Social profile"
                }
            }
            let social = self.instantMessage1 ?? ""
            let social1 = socialProfile1?.components(separatedBy: "&")
            let social2 = socialProfile2?.components(separatedBy: "&")
            let social3 = socialProfile3?.components(separatedBy: "&")
            let social4 = socialProfile4?.components(separatedBy: "&")
            let social5 = socialProfile5?.components(separatedBy: "&")
            
            
            $0 <<< TextRow() {
                $0.placeholder = "None"
                $0.disabled = true
                } .cellUpdate { cell, row in
                    if social != "&" {
                        row.title = social1?[0]
                        row.value = social1?[1]
                        row.cell.update()
                    }
            }
            
            if socialProfile2 != "&" {
                $0 <<< TextRow() {
                    $0.disabled = true
                    } .cellUpdate { cell, row in
                        row.title = social2?[0]
                        row.value = social2?[1]
                        row.cell.update()
                }
            }
            
            
            if socialProfile3 != "&" {
                $0 <<< TextRow() {
                    $0.disabled = true
                    } .cellUpdate { cell, row in
                        row.title = social3?[0]
                        row.value = social3?[1]
                        row.cell.update()
                }
            }
            
            
            if socialProfile4 != "&" {
                $0 <<< TextRow() {
                    $0.disabled = true
                    } .cellUpdate { cell, row in
                        row.value = social4?[0]
                        row.value = social4?[1]
                        row.cell.update()
                }
            }
            
            
            if socialProfile5 != "&" {
                $0 <<< TextRow() {
                    $0.disabled = true
                    } .cellUpdate { cell, row in
                        row.title = social5?[0]
                        row.value = social5?[1]
                        row.cell.update()
                }
            }
        }
        
        
        form +++ MultivaluedSection(multivaluedOptions: [], header: "Instant Message") {
            $0.addButtonProvider = { section in
                return ButtonRow("AccountButton") {
                    $0.title = "add instant message"
                    }
                    .cellUpdate { cell, row in
                        cell.textLabel?.textColor = .black
                        cell.textLabel?.textAlignment = .left
                        
                }
            }
            $0.multivaluedRowToInsertAt = { index in
                return TextRow("Account_\(index + 1)") {
                    $0.placeholder = "Instant message"
                }
            }
            
            let account = self.instantMessage1 ?? ""
            let account1 = instantMessage1?.components(separatedBy: "&")
            let account2 = instantMessage2?.components(separatedBy: "&")
            let account3 = instantMessage3?.components(separatedBy: "&")
            let account4 = instantMessage4?.components(separatedBy: "&")
            let account5 = instantMessage5?.components(separatedBy: "&")
            
            $0 <<< AccountRow() {
                $0.disabled = true
                $0.placeholder = "None"
                } .cellUpdate { cell, row in
                    if account != "&" {
                        row.title = account1?[0]
                        row.value = account1?[1]
                    }
                    row.cell.update()
            }
            
            if instantMessage2 != "&" {
                $0 <<< TextRow() {
                    $0.disabled = true
                    } .cellUpdate { cell, row in
                        row.title = account2?[0]
                        row.value = account2?[1]
                        row.cell.update()
                }
            }
            
            if instantMessage3 != "&" {
                $0 <<< TextRow() {
                    $0.disabled = true
                    } .cellUpdate { cell, row in
                        row.title = account3?[0]
                        row.value = account3?[1]
                        row.cell.update()
                }
            }
            
            if instantMessage4 != "&" {
                $0 <<< TextRow() {
                    $0.disabled = true
                    } .cellUpdate { cell, row in
                        row.title = account4?[0]
                        row.value = account4?[1]
                        row.cell.update()
                }
            }
            
            if instantMessage5 != "&" {
                $0 <<< TextRow() {
                    $0.disabled = true
                    } .cellUpdate { cell, row in
                        row.title = account5?[0]
                        row.value = account5?[1]
                        row.cell.update()
                }
            }
        }
        
        
        let familyNonOpt1 = relatives1 ?? ""
        let familyNonOpt2 = relatives2 ?? ""
        let familyNonOpt3 = relatives3 ?? ""
        let familyNonOpt4 = relatives4 ?? ""
        let familyNonOpt5 = relatives5 ?? ""
        
        form  +++  MultivaluedSection(multivaluedOptions: [], header: "Family") {
            
            $0.addButtonProvider = {section in
                return ButtonRow("RelativesButton") {
                    $0.title = "add your relatives"
                    }
                    .cellUpdate { cell, row in
                        cell.textLabel?.textColor = .black
                        cell.textLabel?.textAlignment = .left
                }
            }
            
            $0.multivaluedRowToInsertAt = { index in
                return TextRow("Relatives_\(index + 1)") {
                    $0.placeholder = "Name"
                }
            }
            
            
            let family1 = relatives1?.components(separatedBy: "&")
            let family2 = relatives2?.components(separatedBy: "&")
            let family3 = relatives3?.components(separatedBy: "&")
            let family4 = relatives4?.components(separatedBy: "&")
            let family5 = relatives5?.components(separatedBy: "&")
            
            if familyNonOpt1 != "&" {
                $0 <<< TextRow() {
                    $0.disabled = true
                    } .cellUpdate { cell, row in
                        row.title = family1?[0]
                        row.value = family1?[1]
                        row.cell.update()
                }
            } else {
                $0 <<< TextRow() {
                    $0.placeholder = "None"
                    $0.disabled = true
                }
                
            }
            
            if familyNonOpt2 != "&" {
                $0 <<< TextRow() {
                    $0.disabled = true
                    } .cellUpdate { cell, row in
                        row.title = family2?[0]
                        row.value = family2?[1]
                        row.cell.update()
                }
            }
            
            
            if familyNonOpt3 != "&" {
                $0 <<< TextRow() {
                    $0.disabled = true
                    } .cellUpdate { cell, row in
                        row.title = family3?[0]
                        row.value = family3?[1]
                        row.cell.update()
                }
            }
            
            if familyNonOpt4 != "&" {
                $0 <<< TextRow() {
                    $0.disabled = true
                    } .cellUpdate { cell, row in
                        row.title = family4?[0]
                        row.value = family4?[1]
                        row.cell.update()
                }
            }
            
            if familyNonOpt5 != "&" {
                $0 <<< TextRow() {
                    $0.disabled = true
                    } .cellUpdate { cell, row in
                        row.title = family5?[0]
                        row.value = family5?[1]
                        row.cell.update()
                }
            }
            
        }
        form +++ Section("Notes")
            <<< TextAreaRow("Notes") { row in
                row.title = "Notes"
                row.placeholder = "none"
                row.disabled = true
                } .cellUpdate { cell, row in
                    row.value = self.notes
                    row.cell.update()
        }
    }
    
    
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func getUsers () {
        //create a fetch request, telling it about the entity
        let fetchRequest: NSFetchRequest<Public> = Public.fetchRequest()
        
        do {
            //go get the results
            let array_users = try getContext().fetch(fetchRequest)
            
            //I like to check the size of the returned results!
            print ("num of users = \(array_users.count)")
            
            //You need to convert to NSManagedObject to use 'for' loops
            for user in array_users as [NSManagedObject] {
                //get the Key Value pairs (although there may be a better way to do that...
                
                if firstName != nil {
                    firstName = user.value(forKey: "firstName") as? String
                    self.userName.text  = firstName
                }
                
                if lastName != nil {
                    lastName = user.value(forKey: "lastName") as? String
                    self.userLastName.text = lastName
                }
                
                if company != nil {
                    company = user.value(forKey: "company") as? String
                    self.userCompany.text = company
                }

                
                
                phoneNumber1 = user.value(forKey: "phoneNumber1") as? String
                if phoneNumber1 != nil {
                    self.form.rowBy(tag: "tag_1")?.updateCell()
                }
                
                phoneNumber2 = user.value(forKey: "phoneNumber2") as? String
                if phoneNumber2 != nil {
                    self.form.rowBy(tag: "tag_2")?.updateCell()
                }
                
                phoneNumber3 = user.value(forKey: "phoneNumber3") as? String
                if phoneNumber3 != nil {
                    self.form.rowBy(tag: "tag_3")?.updateCell()
                }
                
                phoneNumber4 = user.value(forKey: "phoneNumber4") as? String
                if phoneNumber4 != nil {
                    self.form.rowBy(tag: "tag_4")?.updateCell()
                }
                
                phoneNumber5 = user.value(forKey: "phoneNumber5") as? String
                if phoneNumber5 != nil {
                    self.form.rowBy(tag: "tag_5")?.updateCell()
                }
                
                
                email1 = user.value(forKey: "email1") as? String
                if email1 != nil {
                    self.form.rowBy(tag: "Email_1")?.updateCell()
                }
                
                email2 = user.value(forKey: "email2") as? String
                if email2 != nil {
                    self.form.rowBy(tag: "Email_2")?.updateCell()
                }
                
                
                email3 = user.value(forKey: "email3") as? String
                if email3 != nil {
                    self.form.rowBy(tag: "Email_3")?.updateCell()
                }
                
                
                email4 = user.value(forKey: "email4") as? String
                if email4 != nil {
                    self.form.rowBy(tag: "Email_4")?.updateCell()
                }
                
                
                email5 = user.value(forKey: "email5") as? String
                if email5 != nil {
                    self.form.rowBy(tag: "Email_5")?.updateCell()
                }
                
                
                url1 = user.value(forKey: "url1") as? String
                if url1 != nil {
                    self.form.rowBy(tag: "Url_1")?.updateCell()
                }
                
                url2 = user.value(forKey: "url2") as? String
                if url2 != nil {
                    self.form.rowBy(tag: "Url_2")?.updateCell()
                }
                
                url3 = user.value(forKey: "url3") as? String
                if url3 != nil {
                    self.form.rowBy(tag: "Url_3")?.updateCell()
                }
                
                url4 = user.value(forKey: "url4") as? String
                if url4 != nil {
                    self.form.rowBy(tag: "Url_4")?.updateCell()
                }
                
                url5 = user.value(forKey: "url5") as? String
                if url5 != nil {
                    self.form.rowBy(tag: "Url_5")?.updateCell()
                }
                
                
                
                if street1 != nil {
                    street1 = user.value(forKey: "street1") as? String
                    self.form.rowBy(tag: "Address_1")?.updateCell()
                }
                
                if state1 != nil {
                    state1 = user.value(forKey: "state1") as? String
                    self.form.rowBy(tag: "Address_1")?.updateCell()
                }
                
                if city1 != nil {
                    city1 = user.value(forKey: "city1") as? String
                    self.form.rowBy(tag: "Address_1")?.updateCell()
                }
                
                
                if postalCode1 != nil {
                    postalCode1 = user.value(forKey: "postalCode1") as? String
                    self.form.rowBy(tag: "Address_1")?.updateCell()
                }
                
                if country1 != nil {
                    country1 = user.value(forKey: "country1") as? String
                    self.form.rowBy(tag: "Address_1")?.updateCell()
                }
                
                
                
                if street2 != nil {
                    street2 = user.value(forKey: "street2") as? String
                    self.form.rowBy(tag: "Street_2")?.updateCell()
                }
                
                if state2 != nil {
                    state2 = user.value(forKey: "state2") as? String
                    self.form.rowBy(tag: "State_2")?.updateCell()
                }
                
                if city2 != nil {
                    city2 = user.value(forKey: "city2") as? String
                    self.form.rowBy(tag: "City_2")?.updateCell()
                }
                
                
                if postalCode2 != nil {
                    postalCode2 = user.value(forKey: "postalCode2") as? String
                    self.form.rowBy(tag: "PostalCode_2")?.updateCell()
                }
                
                if country2 != nil {
                    country2 = user.value(forKey: "country2") as? String
                    self.form.rowBy(tag: "Country_2")?.updateCell()
                }
                
                
                
                if street3 != nil {
                    street3 = user.value(forKey: "street3") as? String
                    self.form.rowBy(tag: "Street_3")?.updateCell()
                }
                
                if state3 != nil {
                    state3 = user.value(forKey: "state3") as? String
                    self.form.rowBy(tag: "State_3")?.updateCell()
                }
                
                if city3 != nil {
                    city3 = user.value(forKey: "city3") as? String
                    self.form.rowBy(tag: "City_3")?.updateCell()
                }
                
                
                if postalCode3 != nil {
                    postalCode3 = user.value(forKey: "postalCode3") as? String
                    self.form.rowBy(tag: "Postal_3")?.updateCell()
                }
                
                if country3 != nil {
                    country3 = user.value(forKey: "country3") as? String
                    self.form.rowBy(tag: "Country_3")?.updateCell()
                }
                
                
                
                birthday = user.value(forKey: "birthday") as? String
                if birthday != nil {
                    self.form.rowBy(tag: "Birthday")?.updateCell()
                }
                
                socialProfile1 = user.value(forKey: "socialProfile1") as? String
                if socialProfile1 != nil {
                    self.form.rowBy(tag: "Social Profile_1")?.updateCell()
                }
                socialProfile2 = user.value(forKey: "socialProfile2") as? String
                if socialProfile2 != nil {
                    self.form.rowBy(tag: "Social Profile_2")?.updateCell()
                }
                socialProfile3 = user.value(forKey: "socialProfile3") as? String
                if socialProfile3 != nil {
                    self.form.rowBy(tag: "Social Profile_3")?.updateCell()
                }
                socialProfile4 = user.value(forKey: "socialProfile4") as? String
                if socialProfile4 != nil {
                    self.form.rowBy(tag: "Social Profile_4")?.updateCell()
                }
                socialProfile5 = user.value(forKey: "socialProfile5") as? String
                if socialProfile5 != nil {
                    self.form.rowBy(tag: "Social Profile_5")?.updateCell()
                }
                
                instantMessage1 = user.value(forKey: "account1") as? String
                if instantMessage1 != nil {
                    self.form.rowBy(tag: "Instant Message_1")?.updateCell()
                }
                instantMessage2 = user.value(forKey: "account2") as? String
                if instantMessage2 != nil {
                    self.form.rowBy(tag: "Instant Message_2")?.updateCell()
                }
                instantMessage3 = user.value(forKey: "account3") as? String
                if instantMessage3 != nil {
                    self.form.rowBy(tag: "Instant Message_3")?.updateCell()
                }
                instantMessage4 = user.value(forKey: "account4") as? String
                if instantMessage4 != nil {
                    self.form.rowBy(tag: "Instant Message_5")?.updateCell()
                }
                instantMessage5 = user.value(forKey: "account5") as? String
                if instantMessage5 != nil {
                    self.form.rowBy(tag: "Instant Message_5")?.updateCell()
                }
                
                
                
                relatives1 = user.value(forKey: "relatives1") as? String
                if relatives1 != nil {
                    self.form.rowBy(tag: "Relatives_1")?.updateCell()
                }
                
                relatives2 = user.value(forKey: "relatives2") as? String
                if relatives2 != nil {
                    self.form.rowBy(tag: "Relatives_1")?.updateCell()
                }
                
                relatives3 = user.value(forKey: "relatives3") as? String
                if relatives3 != nil {
                    self.form.rowBy(tag: "Relatives_1")?.updateCell()
                }
                
                relatives4 = user.value(forKey: "relatives4") as? String
                if relatives4 != nil {
                    self.form.rowBy(tag: "Relatives_1")?.updateCell()
                }
                
                relatives5 = user.value(forKey: "relatives5") as? String
                if relatives5 != nil {
                    self.form.rowBy(tag: "Relatives_1")?.updateCell()
                }
                
                
                
                notes = (user.value(forKey: "notes") as? String)
                if notes != nil {
                    self.form.rowBy(tag: "Notes")?.updateCell()
                }
                
            }
        } catch {
            print("Error with request: \(error)")
        }
    }
    
    func deleteUser () {
        
        let context = getContext()
        
        //create a fetch request, telling it about the entity
        let fetchRequest: NSFetchRequest<Private> = Private.fetchRequest()
        
        do {
            //go get the results
            let array_users = try getContext().fetch(fetchRequest)
            
            //You need to convert to NSManagedObject to use 'for' loops
            for user in array_users as [NSManagedObject] {
                //get the Key Value pairs (although there may be a better way to do that...
                context.delete(user)
            }
            //save the context
            
            do {
                try context.save()
                print("saved!")
            } catch let error as NSError  {
                print("Could not save \(error), \(error.userInfo)")
            } catch {
                
            }
            
        } catch {
            print("Error with request: \(error)")
        }
    }

}
