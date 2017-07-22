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


class OpenSettingProfileViewController: FormViewController {
    
    
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
            <<< NameRow() {
                $0.tag = "First Name"
                $0.placeholder = "First Name"
        }
            <<< NameRow() {
                $0.tag = "Last Name"
                $0.placeholder = "Last Name"
        }
            <<< NameRow() {
                $0.tag = "Company"
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
                return PhoneRow() {
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
                return EmailRow() {
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
                return URLRow() {
                    $0.placeholder = "URL"
                }
            }
            
        }
        
        form +++ MultivaluedSection(multivaluedOptions: [.Insert, .Delete]) {
            $0.addButtonProvider = { section in
                return ButtonRow() {
                    $0.title = "add adress"
                    }
                
                    .cellUpdate { cell, row in
                        cell.textLabel?.textColor = .black
                        cell.textLabel?.textAlignment = .left
                }
            }
            
            $0.multivaluedRowToInsertAt = { index in
                return PostalAddressRow() {
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
                return DateTimeRow().cellSetup({ (dateCell, dateTimeRow) in
                    
                    //dateTimeRow.tag = "Birthday"
                    
                    dateTimeRow.dateFormatter?.dateStyle = .short
                    dateTimeRow.dateFormatter?.timeStyle = .none
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
                return  AccountRow() {
                    //$0.value = "instagram.com/" how to change value after clicked
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
                 return AccountRow() {
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
                        return TextRow() {
                            $0.title = "Baby"
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
            <<< TextAreaRow("MyRowTag") { row in
                row.placeholder = "Notes"
        }
    
    }
    
    
    
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    
        let dict = form.values(includeHidden: true)
        
        print("FirstName:\((dict["First Name"]!)!)")
        print("LastName:\((dict["Last Name"]!)!)")
        print("Company:\((dict["Company"]!)!)")
        print("Birthday:\((dict["Birthday"]!)!)")
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}


