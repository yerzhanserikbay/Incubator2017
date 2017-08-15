//
//  OpenPrivateSettingProfileViewController.swift
//  Share Contact by QR code
//
//  Created by YERZHAN SERIKBAY on 7/15/17.
//  Copyright © 2017 YERZHAN SERIKBAY. All rights reserved.
//

import UIKit
import Eureka
import ImageRow
import EasyPeasy
import CoreData
import PhoneNumberKit
import PostalAddressRow

public protocol SectionDelegate: class {
    func rowsHaveBeenAdded(_ rows: [BaseRow], at: IndexSet)
    func rowsHaveBeenRemoved(_ rows: [BaseRow], at: IndexSet)
    func rowsHaveBeenReplaced(oldRows: [BaseRow], newRows: [BaseRow], at: IndexSet)
}

class OpenPrivateSettingProfileViewController: FormViewController, SectionDelegate {
    
    func rowsHaveBeenReplaced(oldRows: [BaseRow], newRows: [BaseRow], at: IndexSet) {
        print("rowsHaveBeenReplaced", oldRows)
    }

    func rowsHaveBeenRemoved(_ rows: [BaseRow], at: IndexSet) {
        print("rowsHaveBeenRemoved", rows)

    }

    func rowsHaveBeenAdded(_ rows: [BaseRow], at: IndexSet) {
        print("rowsHaveBeenAdded", rows)
    }

    
    var firstName: String? = "" {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var currentCellsNumber = 1 {
        didSet {
            print(currentCellsNumber)
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
    
    
    
    
    var birthday: String? = "" {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView?.backgroundColor = UIColor.white
        getUsers()
        
           form +++ ImageRow() {
            $0.tag = "Avatar"
            $0.title = "Choose Photo For Your Profile"
            $0.sourceTypes = [.PhotoLibrary, .SavedPhotosAlbum]
            $0.value = #imageLiteral(resourceName: "user.png")
            $0.cell.height = { 102 }
            $0.clearAction = .no
            $0.disabled = true
            }
            .cellUpdate { cell, row in
                cell.accessoryView?.layer.cornerRadius = 34
                cell.accessoryView?.frame = CGRect(x: 0, y: 0, width: 68, height: 68)
        }
        
        form +++ Section()
            <<< NameRow("First Name") {
                $0.placeholder = "First Name"
                $0.cell.textField.keyboardType = .default
                $0.value = self.firstName
                } .cellSetup { cell, row in
                    row.value = self.firstName
                    row.cell.update()
            }
            
            <<< NameRow("Last Name") {
                $0.placeholder = "Last Name"
                $0.cell.textField.keyboardType = .default
                $0.value = self.lastName
                } .cellSetup { cell, row in
                    row.value = self.lastName
                    row.cell.update()
                    
            }
            <<< NameRow("Company") {
                $0.placeholder = "Company"
                $0.cell.textField.keyboardType = .default
                $0.value = self.company
                } .cellSetup { cell, row in
                    row.value = self.company
                    row.cell.update()
                    
        }
        
        let phone1 = phoneNumber1 ?? ""
        let phone2 = phoneNumber2 ?? ""
        let phone3 = phoneNumber3 ?? ""
        let phone4 = phoneNumber4 ?? ""
        let phone5 = phoneNumber5 ?? ""
        var hiddenPhone = false
        form +++ MultivaluedSection(multivaluedOptions: [.Reorder, .Insert, .Delete]) {
            $0.addButtonProvider = { section in
                return ButtonRow("PhoneButton") {
                    $0.title = "add phone"
                    }
                    .cellUpdate { cell, row in
                        // cell.textLabel?.font = .systemFont(ofSize: 18)
                        cell.textLabel?.textColor = .black
                        cell.textLabel?.textAlignment = .left
                        if hiddenPhone == true {
                            cell.isHidden = true
                        }
                    }
            }
            
            $0.multivaluedRowToInsertAt = { index in
                return PhoneRow("tag_\(index + 1)") {
                    $0.placeholder = "Phone"
                    
                    if index == 0 {
                        $0.tag = "tag_1"
                    }
                    if index == 1 {
                        $0.tag = "tag_2"
                    }
                    if index == 2 {
                        $0.tag = "tag_3"
                    }
                    if index == 3 {
                        $0.tag = "tag_4"
                    }
                    if index == 4 {
                        hiddenPhone = true
                        $0.tag = "tag_5"
                        self.form.rowBy(tag: "PhoneButton")?.updateCell()
                    }
                    } .cellSetup { cell, row in
                        cell.textField.removeFromSuperview()
                        
                        let tf = PhoneNumberTextField()
                        tf.translatesAutoresizingMaskIntoConstraints = false
                        cell.textField = tf
                        cell.contentView.addSubview(tf)
                        
                    } .onCellHighlightChanged({ (phoneCell, phoneRow) in
                        phoneRow.value = phoneCell.textField.text
                    })
            }
            
            
            
            if phone1 != "" {
                $0 <<< PhoneRow() {
                    $0.tag = "tag_1"
                    $0.value = self.phoneNumber1
                    }
            }
            
            if phone2 != "" {
                $0 <<< PhoneRow() {
                    $0.tag = "tag_2"
                    $0.value = self.phoneNumber2
                    }
            }
            
            if phone3 != "" {
                $0 <<< PhoneRow() {
                    $0.tag = "tag_3"
                    $0.value = self.phoneNumber3
                    $0.cell.update()
                    }
            }
            
            if phone4 != "" {
                $0 <<< PhoneRow() {
                    $0.tag = "tag_4"
                    $0.value = self.phoneNumber4
                    $0.cell.update()
                    }
            }
            
            if phone5 != "" {
                $0 <<< PhoneRow() {
                    $0.tag = "tag_5"
                    $0.value = self.phoneNumber5
                    $0.cell.update()
                    }
            }
        }
        
        
        var hiddenEmail = false
        form +++ MultivaluedSection(multivaluedOptions: [.Reorder, .Insert, .Delete]) {
            $0.addButtonProvider = { section in
                return ButtonRow("EmailButton") {
                    $0.title = "add email"
                    }
                    .cellUpdate { cell, row in
                        cell.textLabel?.textColor = .black
                        cell.textLabel?.textAlignment = .left
                        if hiddenEmail == true {
                            cell.isHidden = true
                        }
                }
            }
            
            
            $0.multivaluedRowToInsertAt = { index in
                return EmailRow("Email_\(index + 1)") {
                    $0.placeholder = "Email"
                    $0.cell.textField.keyboardType = .emailAddress
                    if index == 4 {
                        hiddenEmail = true
                        $0.placeholder = "Email"
                        self.form.rowBy(tag: "EmailButton")?.updateCell()
                    }
                }
            }
            
            if email1 != "" {
                $0 <<< EmailRow() {
                    $0.tag = "Email_1"
                    } .cellSetup { cell, row in
                        row.value = self.email1
                        row.cell.update()
                }
            }
            
            if email2 != "" {
                $0 <<< EmailRow() {
                    $0.tag = "Email_2"
                    } .cellSetup { cell, row in
                        row.value = self.email2
                        row.cell.update()
                }
            }
            
            if email3 != "" {
                $0 <<< EmailRow() {
                    $0.tag = "Email_3"
                    } .cellSetup { cell, row in
                        row.value = self.email3
                        row.cell.update()
                }
            }
            
            if email4 != "" {
                $0 <<< EmailRow() {
                    $0.tag = "Email_4"
                    } .cellSetup { cell, row in
                        row.value = self.email4
                        row.cell.update()
                }
            }
            
            if email5 != "" {
                $0 <<< EmailRow() {
                    $0.tag = "Email_5"
                    } .cellSetup { cell, row in
                        row.value = self.email5
                        row.cell.update()
                }
            }
        }
        var hiddenUrl = false
        form +++ MultivaluedSection(multivaluedOptions: [.Reorder, .Insert, .Delete]) {
            $0.addButtonProvider = { section in
                return ButtonRow("UrlButton") {
                    $0.title = "add url"
                    }
                    .cellUpdate { cell, row in
                        cell.textLabel?.textColor = .black
                        cell.textLabel?.textAlignment = .left
                        if hiddenUrl == true {
                            cell.isHidden = true
                        }
                }
            }
            
            $0.multivaluedRowToInsertAt = { index in
                return TextRow("URL_\(index + 1)") {
                    $0.placeholder = "URL"
                    $0.cell.textField.keyboardType = .URL
                    $0.cell.textField.autocapitalizationType = .none
                    $0.cell.textField.autocorrectionType = .no
                    if index == 4 {
                        hiddenUrl = true
                        $0.placeholder = "URL"
                        self.form.rowBy(tag: "UrlButton")?.updateCell()
                    }
                }
            }
            
            if url1 != "" {
                $0 <<< TextRow() {
                    $0.tag = "URL_1"
                    $0.value = self.url1
                    $0.placeholder = "URL"
                    $0.cell.textField.keyboardType = .URL
                    $0.cell.textField.autocapitalizationType = .none
                    $0.cell.textField.autocorrectionType = .no
                }
            }
            
            if url2 != "" {
                $0 <<< TextRow() {
                    $0.tag = "URL_2"
                    $0.value = self.url2
                    $0.placeholder = "URL"
                    $0.cell.textField.keyboardType = .URL
                    $0.cell.textField.autocapitalizationType = .none
                    $0.cell.textField.autocorrectionType = .no
                }
            }
            
            if url3 != "" {
                $0 <<< TextRow() {
                    $0.tag = "URL_3"
                    $0.value = self.url3
                    $0.placeholder = "URL"
                    $0.cell.textField.keyboardType = .URL
                    $0.cell.textField.autocapitalizationType = .none
                    $0.cell.textField.autocorrectionType = .no
                }
            }
            
            if url4 != "" {
                $0 <<< TextRow() {
                    $0.tag = "URL_4"
                    $0.value = self.url4
                    $0.placeholder = "URL"
                    $0.cell.textField.keyboardType = .URL
                    $0.cell.textField.autocapitalizationType = .none
                    $0.cell.textField.autocorrectionType = .no
                }
            }
            
            if url5 != "" {
                $0 <<< TextRow() {
                    $0.tag = "URL_5"
                    $0.placeholder = "URL"
                    $0.value = self.url5
                    hiddenUrl = true
                    $0.cell.textField.keyboardType = .URL
                    $0.cell.textField.autocapitalizationType = .none
                    $0.cell.textField.autocorrectionType = .no
                    self.form.rowBy(tag: "UrlButton")?.updateCell()
                }
            }
        }
        
        var hiddenAddress = false
        form +++ MultivaluedSection(multivaluedOptions: [.Reorder, .Insert, .Delete]) {
            $0.addButtonProvider = { section in
                return ButtonRow("AddressButton") {
                    $0.title = "add address"
                    }
                    .cellUpdate { cell, row in
                        cell.textLabel?.textColor = .black
                        cell.textLabel?.textAlignment = .left
                        if hiddenAddress == true {
                            cell.isHidden = true
                        }
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
                    if index == 2 {
                        hiddenAddress = true
                        self.form.rowBy(tag: "AddressButton")?.updateCell()
                    }
                }
            }
            
            
            if street1 != "" {
                $0 <<< PostalAddressRow() {
                    $0.tag = "Address_1"
                    $0.value = PostalAddress()
                    } .cellSetup { cell, row in
                        row.value?.street = self.street1
                        row.value?.state = self.state1
                        row.value?.city = self.city1
                        row.value?.country = self.country1
                        row.value?.postalCode = self.postalCode1
                        row.cell.update()
                        
                        row.streetPlaceholder = "Street"
                        row.statePlaceholder = "State"
                        row.cityPlaceholder = "City"
                        row.countryPlaceholder = "Country"
                        row.postalCodePlaceholder = "Zip code"
                }
            }
            
            if street2 != "" {
                $0 <<< PostalAddressRow() {
                    $0.tag = "Address_2"
                    $0.value = PostalAddress()
                    } .cellSetup { cell, row in
                        row.value?.street = self.street2
                        row.value?.state = self.state2
                        row.value?.city = self.city2
                        row.value?.country = self.country2
                        row.value?.postalCode = self.postalCode2
                        row.cell.update()
                        
                        row.streetPlaceholder = "Street"
                        row.statePlaceholder = "State"
                        row.cityPlaceholder = "City"
                        row.countryPlaceholder = "Country"
                        row.postalCodePlaceholder = "Zip code"
                }
            }
            
            if street3 != ""  {
                $0 <<< PostalAddressRow() {
                    $0.tag = "Address_3"
                    $0.value = PostalAddress()
                    } .cellSetup { cell, row in
                        row.value?.street = self.street3
                        row.value?.state = self.state3
                        row.value?.city = self.city3
                        row.value?.country = self.country3
                        row.value?.postalCode = self.postalCode3
                        row.cell.update()
                        
                        row.streetPlaceholder = "Street"
                        row.statePlaceholder = "State"
                        row.cityPlaceholder = "City"
                        row.countryPlaceholder = "Country"
                        row.postalCodePlaceholder = "Zip code"
                }
            }
        }
        
        var hiddenBirthday = false
        form +++ MultivaluedSection(multivaluedOptions: [.Insert, .Delete]) {
            $0.addButtonProvider = { section in
                return ButtonRow("BirthdayButton") {
                    $0.title = "add birthday"
                    
                    }
                    .cellUpdate { cell, row in
                        cell.textLabel?.textColor = .black
                        cell.textLabel?.textAlignment = .left
                        if hiddenBirthday == true {
                            cell.isHidden = true
                        }
                    } .cellSetup({ (cell, row) in
                        cell.height = ({return 0})
                    })

            }
            
            $0.multivaluedRowToInsertAt = { index in
                return DateRow("Birthday").cellSetup({ (dateCell, dateRow) in
                    dateRow.value = NSDate() as Date
                    dateRow.title = "Your birthday:"
                    if index == 0 {
                        hiddenBirthday = true
                        self.form.rowBy(tag: "BirthdayButton")?.updateCell()
                    }
                })
            }
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = DateFormatter.Style.long
            let date = dateFormatter.date(from: self.birthday!)
            
            if birthday != "" {
                $0 <<< DateRow() {
                    $0.tag = "Birthday"
                    $0.title = "Your birthday:"
                    $0.value = date
                    hiddenBirthday = true
                    self.form.rowBy(tag: "BirthdayButton")?.updateCell()
                }
            }
        }
        
        var tag = "tag"
        func actionSheetSocial() {
            
            let actionSheetController = UIAlertController(title: "Social Profiles", message: "Please, select type of your profile", preferredStyle: .actionSheet)
            
            let cancelActionButton = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in
                print("Cancel")
            }
            actionSheetController.addAction(cancelActionButton)
            
            let facebookActionButton = UIAlertAction(title: "Facebook", style: .default) { action -> Void in
                self.form.rowBy(tag: tag)?.title = "Facebook"
                self.form.rowBy(tag: tag)?.reload()
            }
            actionSheetController.addAction(facebookActionButton)
            
            let twitterActionButton = UIAlertAction(title: "Twitter", style: .default) { action -> Void in
                self.form.rowBy(tag: tag)?.title = "Twitter"
                self.form.rowBy(tag: tag)?.reload()
            }
            actionSheetController.addAction(twitterActionButton)
            
            let vkActionButton = UIAlertAction(title: "VKontakte", style: .default) { action -> Void in
                self.form.rowBy(tag: tag)?.title = "VKontakte"
                self.form.rowBy(tag: tag)?.reload()
            }
            actionSheetController.addAction(vkActionButton)
            
            let odnolassnikiActionButton = UIAlertAction(title: "Odnolassniki", style: .default) { action -> Void in
                self.form.rowBy(tag: tag)?.title = "Odnolassniki"
                self.form.rowBy(tag: tag)?.reload()
            }
            actionSheetController.addAction(odnolassnikiActionButton)
            
            let instaActionButton = UIAlertAction(title: "Instagram", style: .default) { action -> Void in
                self.form.rowBy(tag: tag)?.title = "Instagram"
                self.form.rowBy(tag: tag)?.reload()
            }
            actionSheetController.addAction(instaActionButton)
            
            
            self.present(actionSheetController, animated: true, completion: nil)
        }
        var hiddenSocial = false
        form +++ MultivaluedSection(multivaluedOptions: [.Reorder, .Insert, .Delete]) {
            $0.addButtonProvider = { section in
                return ButtonRow("socialButton") {
                    $0.title = "add social profile"
                    }
                    
                    .cellUpdate { cell, row in
                        cell.textLabel?.textColor = .black
                        cell.textLabel?.textAlignment = .left
                        if hiddenSocial == true {
                            cell.isHidden = true
                        }
                }
            }
            $0.multivaluedRowToInsertAt = { index in
                return  TextRow("Social Profile_\(index + 1)") {
                    
                    $0.cell.textField.keyboardType = .twitter
                    $0.placeholder = "Social profile"
                    $0.cell.textField.autocorrectionType = .no
                    $0.cell.textField.autocapitalizationType = .none
                    
                    if index == 0 {
                        $0.title = "Select"
                        tag = "Social Profile_1"
                    }
                    if index == 1 {
                        $0.title = "Select"
                        tag = "Social Profile_2"
                    }
                    if index == 2 {
                        $0.title = "Select"
                        tag = "Social Profile_3"
                    }
                    if index == 3 {
                        $0.title = "Select"
                        tag = "Social Profile_4"
                    }
                    if index == 4 {
                        $0.title = "Select"
                        tag = "Social Profile_5"
                        hiddenSocial = true
                        self.form.rowBy(tag: "socialButton")?.updateCell()
                    }
                    } .onCellSelection { cell, row in
                        tag = row.tag!
                        actionSheetSocial()
                }
            }
            
            let social1 = socialProfile1?.components(separatedBy: "&")
            
            if socialProfile1 != "&" {
                $0 <<< TextRow() {
                    $0.title = social1?[0]
                    $0.value = social1?[1]
                    $0.tag = "Social Profile_1"
                    $0.cell.textField.autocorrectionType = .no
                    $0.cell.textField.autocapitalizationType = .none
                    $0.cell.textField.keyboardType = .twitter
                    } .onCellSelection { cell, row in
                        tag = row.tag!
                        actionSheetSocial()
                }
            }
            
            let social2 = socialProfile2?.components(separatedBy: "&")
            if socialProfile2 != "&" {
                $0 <<< TextRow() {
                    $0.title = social2?[0]
                    $0.value = social2?[1]
                    $0.tag = "Social Profile_2"
                    $0.cell.textField.autocorrectionType = .no
                    $0.cell.textField.autocapitalizationType = .none
                    $0.cell.textField.keyboardType = .twitter
                    } .onCellSelection { cell, row in
                        tag = row.tag!
                        actionSheetSocial()
                }
            }
            
            let social3 = socialProfile3?.components(separatedBy: "&")
            if socialProfile3 != "&" {
                $0 <<< TextRow() {
                    $0.title = social3?[0]
                    $0.value = social3?[1]
                    $0.tag = "Social Profile_3"
                    $0.cell.textField.autocorrectionType = .no
                    $0.cell.textField.autocapitalizationType = .none
                    $0.cell.textField.keyboardType = .twitter
                    } .onCellSelection { cell, row in
                        tag = row.tag!
                        actionSheetSocial()
                }
            }
            let social4 = socialProfile4?.components(separatedBy: "&")
            if socialProfile4 != "&" {
                $0 <<< TextRow() {
                    $0.title = social4?[0]
                    $0.value = social4?[1]
                    $0.tag = "Social Profile_4"
                    $0.cell.textField.autocorrectionType = .no
                    $0.cell.textField.autocapitalizationType = .none
                    $0.cell.textField.keyboardType = .twitter
                    } .onCellSelection { cell, row in
                        tag = row.tag!
                        actionSheetSocial()
                }
            }
            
            let social5 = socialProfile5?.components(separatedBy: "&")
            if socialProfile5 != "&" {
                $0 <<< TextRow() {
                    $0.title = social5?[0]
                    $0.value = social5?[1]
                    $0.tag = "Social Profile_5"
                    $0.cell.textField.autocorrectionType = .no
                    $0.cell.textField.autocapitalizationType = .none
                    $0.cell.textField.keyboardType = .twitter
                    } .onCellSelection { cell, row in
                        tag = row.tag!
                        actionSheetSocial()
                }
            }
        }
        
    
        var tagMe = "tag"
        func actionSheetMessage() {
            
            let actionSheetController = UIAlertController(title: "Instant message accounts", message: "Please, select type of your account", preferredStyle: .actionSheet)
            
            let cancelActionButton = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in
                print("Cancel")
            }
            actionSheetController.addAction(cancelActionButton)
            
            
            let facebookActionButton = UIAlertAction(title: "Whatsapp", style: .default) { action -> Void in
                self.form.rowBy(tag: tagMe)?.title = "Whatsapp"
                self.form.rowBy(tag: tagMe)?.reload()
                
            }
            actionSheetController.addAction(facebookActionButton)
            
            let twitterActionButton = UIAlertAction(title: "Telegram", style: .default) { action -> Void in
                self.form.rowBy(tag: tagMe)?.title = "Telegram"
                self.form.rowBy(tag: tagMe)?.reload()
            }
            actionSheetController.addAction(twitterActionButton)
            
            let vkActionButton = UIAlertAction(title: "Skype", style: .default) { action -> Void in
                self.form.rowBy(tag: tagMe)?.title = "Skype"
                self.form.rowBy(tag: tagMe)?.reload()
            }
            actionSheetController.addAction(vkActionButton)
            
            let odnolassnikiActionButton = UIAlertAction(title: "Viber", style: .default) { action -> Void in
                self.form.rowBy(tag: tagMe)?.title = "Viber"
                self.form.rowBy(tag: tagMe)?.reload()
            }
            actionSheetController.addAction(odnolassnikiActionButton)
            
            let instaActionButton = UIAlertAction(title: "Wechat", style: .default) { action -> Void in
                self.form.rowBy(tag: tagMe)?.title = "Wechat"
                self.form.rowBy(tag: tagMe)?.reload()
            }
            actionSheetController.addAction(instaActionButton)
            
            
            self.present(actionSheetController, animated: true, completion: nil)
        }
        
        var hiddenAccount = false
        form +++ MultivaluedSection(multivaluedOptions: [.Reorder, .Insert, .Delete]) {
            $0.addButtonProvider = { section in
                return ButtonRow("accountButton") {
                    $0.title = "add instant message"
                    }
                    .cellUpdate { cell, row in
                        cell.textLabel?.textColor = .black
                        cell.textLabel?.textAlignment = .left
                        if hiddenAccount == true {
                            cell.isHidden = true
                        }
                }
            }
            $0.multivaluedRowToInsertAt = { index in
                return TextRow("Account_\(index + 1)") {
                    $0.title = "Select"
                    $0.cell.textField.keyboardType = .default
                    $0.cell.textField.autocorrectionType = .no
                    $0.cell.textField.autocapitalizationType = .none
                    $0.placeholder = "Instant message"
                    if index == 0 {
                        $0.title = "Select"
                        tagMe = "Account_1"
                    }
                    
                    if index == 1 {
                        $0.title = "Select"
                        tagMe = "Account_2"
                    }
                    
                    if index == 2 {
                        $0.title = "Select"
                        tagMe = "Account_3"
                    }
                    
                    if index == 3 {
                        $0.title = "Select"
                        tagMe = "Account_4"
                    }
                    
                    if index == 4 {
                        $0.title = "Select"
                        tagMe = "Account_5"
                        hiddenAccount = true
                        self.form.rowBy(tag: "accountButton")?.updateCell()
                    }
                    } .onCellSelection { cell, row in
                        tagMe = row.tag!
                        actionSheetMessage()
                }
            }
            
            let account1 = instantMessage1?.components(separatedBy: "&")
            if instantMessage1 != "&" {
                $0 <<< TextRow() {
                    $0.title = account1?[0]
                    $0.value = account1?[1]
                    $0.tag = "Account_1"
                    $0.cell.textField.keyboardType = .default
                    $0.cell.textField.autocorrectionType = .no
                    $0.cell.textField.autocapitalizationType = .none
                    } .onCellSelection { cell, row in
                        tagMe = row.tag!
                        actionSheetMessage()
                }
            }
            let account2 = instantMessage2?.components(separatedBy: "&")
            if instantMessage2 != "&" {
                $0 <<< TextRow() {
                    $0.title = account2?[0]
                    $0.value = account2?[1]
                    $0.tag = "Account_2"
                    $0.cell.textField.keyboardType = .default
                    $0.cell.textField.autocorrectionType = .no
                    $0.cell.textField.autocapitalizationType = .none
                    } .onCellSelection { cell, row in
                        tagMe = row.tag!
                        actionSheetMessage()
                }
            }
            let account3 = instantMessage3?.components(separatedBy: "&")
            if instantMessage3 != "&" {
                $0 <<< TextRow() {
                    $0.title = account3?[0]
                    $0.value = account3?[1]
                    $0.tag = "Account_3"
                    $0.cell.textField.keyboardType = .default
                    $0.cell.textField.autocorrectionType = .no
                    $0.cell.textField.autocapitalizationType = .none
                    } .onCellSelection { cell, row in
                        tagMe = row.tag!
                        actionSheetMessage()
                }
            }
            let account4 = instantMessage4?.components(separatedBy: "&")
            if instantMessage4 != "&" {
                $0 <<< TextRow() {
                    $0.title = account4?[0]
                    $0.value = account4?[1]
                    $0.tag = "Account_4"
                    $0.cell.textField.keyboardType = .default
                    $0.cell.textField.autocorrectionType = .no
                    $0.cell.textField.autocapitalizationType = .none
                    } .onCellSelection { cell, row in
                        tagMe = row.tag!
                        actionSheetMessage()
                }
            }
            let account5 = instantMessage5?.components(separatedBy: "&")
            if instantMessage5 != "&" {
                $0 <<< TextRow() {
                    $0.title = account5?[0]
                    $0.value = account5?[1]
                    $0.tag = "Account_5"
                    $0.cell.textField.keyboardType = .default
                    $0.cell.textField.autocorrectionType = .no
                    $0.cell.textField.autocapitalizationType = .none
                    } .onCellSelection { cell, row in
                        tagMe = row.tag!
                        actionSheetMessage()
                }
            }
        }
        
        let familyNonOpt1 = relatives1 ?? ""
        let familyNonOpt2 = relatives2 ?? ""
        let familyNonOpt3 = relatives3 ?? ""
        let familyNonOpt4 = relatives4 ?? ""
        let familyNonOpt5 = relatives5 ?? ""
        
        var tagFam = "tag"
        func actionSheetFamily() {
            
            let actionSheetController = UIAlertController(title: "Family", message: "Please, select status of your family member", preferredStyle: .actionSheet)
            
            let cancelActionButton = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in
                print("Cancel")
            }
            actionSheetController.addAction(cancelActionButton)
            
            let facebookActionButton = UIAlertAction(title: "Father", style: .default) { action -> Void in
                self.form.rowBy(tag: tagFam)?.title = "Father"
                self.form.rowBy(tag: tagFam)?.reload()
                
            }
            actionSheetController.addAction(facebookActionButton)
            
            let twitterActionButton = UIAlertAction(title: "Mother", style: .default) { action -> Void in
                self.form.rowBy(tag: tagFam)?.title = "Mother"
                self.form.rowBy(tag: tagFam)?.reload()
            }
            actionSheetController.addAction(twitterActionButton)
            
            let grandfaActionButton = UIAlertAction(title: "Grandfather", style: .default) { action -> Void in
                self.form.rowBy(tag: tagFam)?.title = "Grandfather"
                self.form.rowBy(tag: tagFam)?.reload()
            }
            actionSheetController.addAction(grandfaActionButton)
            
            let grandmoActionButton = UIAlertAction(title: "Grandmother", style: .default) { action -> Void in
                self.form.rowBy(tag: tagFam)?.title = "Grandmother"
                self.form.rowBy(tag: tagFam)?.reload()
            }
            actionSheetController.addAction(grandmoActionButton)
            
            let vkActionButton = UIAlertAction(title: "Brother", style: .default) { action -> Void in
                self.form.rowBy(tag: tagFam)?.title = "Brother"
                self.form.rowBy(tag: tagFam)?.reload()
            }
            actionSheetController.addAction(vkActionButton)
            
            let odnolassnikiActionButton = UIAlertAction(title: "Sister", style: .default) { action -> Void in
                self.form.rowBy(tag: tagFam)?.title = "Sister"
                self.form.rowBy(tag: tagFam)?.reload()
            }
            actionSheetController.addAction(odnolassnikiActionButton)
            
            let instaActionButton = UIAlertAction(title: "Unlce", style: .default) { action -> Void in
                self.form.rowBy(tag: tagFam)?.title = "Unlce"
                self.form.rowBy(tag: tagFam)?.reload()
            }
            actionSheetController.addAction(instaActionButton)
            
            let auntActionButton = UIAlertAction(title: "Aunt", style: .default) { action -> Void in
                self.form.rowBy(tag: tagFam)?.title = "Aunt"
                self.form.rowBy(tag: tagFam)?.reload()
            }
            actionSheetController.addAction(auntActionButton)
            
            self.present(actionSheetController, animated: true, completion: nil)
        }
        
        
        
        var hiddenFamily = false
        form +++ Section()
            <<< SwitchRow("switchRowTag") {
                $0.title = "Family"
                $0.value = true
                if relatives1 == "" {
                    $0.value = false
                }
            }
            +++  MultivaluedSection(multivaluedOptions: [.Reorder, .Insert, .Delete]) {
                
                $0.hidden = Condition.function(["switchRowTag"], { form in
                    return !((form.rowBy(tag: "switchRowTag") as? SwitchRow)?.value ?? false)
                })
                $0.addButtonProvider = {section in
                    return ButtonRow("RelativesButton") {
                        $0.title = "add your relatives"
                        }
                        .cellUpdate { cell, row in
                            cell.textLabel?.textColor = .black
                            cell.textLabel?.textAlignment = .left
                            if hiddenFamily == true {
                                cell.isHidden = true
                            }
                    } 
                }
                
                $0.multivaluedRowToInsertAt = { index in
                    return TextRow("Relatives_\(index + 1)") {
                        $0.title = "Select"
                        $0.cell.textField.keyboardType = .default
                        $0.placeholder = "Family member"
                        $0.cell.textField.autocorrectionType = .no
                        $0.cell.textField.autocapitalizationType = .sentences
                        //rowsHaveBeenRemoved([TextRow()], at: [IndexSet])
                        if index == 4 {
                            hiddenFamily = true
                            self.form.rowBy(tag: "RelativesButton")?.updateCell()
                        }
                        } .onCellSelection { cell, row in
                            tagFam = row.tag!
                            actionSheetFamily()
                    }
                }
                
                let family1 = relatives1?.components(separatedBy: "&") ?? [""]
                print(familyNonOpt1)
                if familyNonOpt1 != "&" {
                    $0 <<< TextRow() {
                        $0.title = family1[0]
                        $0.value = family1[1]
                        $0.tag = "Relatives_1"
                        $0.cell.textField.keyboardType = .default
                        $0.cell.textField.autocorrectionType = .no
                        $0.cell.textField.autocapitalizationType = .sentences
                        } .onCellSelection { cell, row in
                            tagFam = row.tag!
                            actionSheetFamily()
                    }
                }
                
                
                let family2 = relatives2?.components(separatedBy: "&") ?? [""]
                if familyNonOpt2 != "&" {
                    $0 <<< TextRow() {
                        $0.title = family2[0]
                        $0.value = family2[1]
                        $0.tag = "Relatives_2"
                        $0.cell.textField.keyboardType = .default
                        $0.cell.textField.autocorrectionType = .no
                        $0.cell.textField.autocapitalizationType = .sentences
                        } .onCellSelection { cell, row in
                            tagFam = row.tag!
                            actionSheetFamily()
                    }
                }
                
                let family3 = relatives3?.components(separatedBy: "&") ?? [""]
                if familyNonOpt3 != "&" {
                    $0 <<< TextRow() {
                        $0.title = family3[0]
                        $0.value = family3[1]
                        $0.tag = "Relatives_3"
                        $0.cell.textField.keyboardType = .default
                        $0.cell.textField.autocorrectionType = .no
                        $0.cell.textField.autocapitalizationType = .sentences
                        
                        } .onCellSelection { cell, row in
                            tagFam = row.tag!
                            actionSheetFamily()
                    }
                }
                
                let family4 = relatives4?.components(separatedBy: "&") ?? [""]
                if familyNonOpt4 != "&" {
                    $0 <<< TextRow() {
                        $0.title = family4[0]
                        $0.value = family4[1]
                        $0.tag = "Relatives_4"
                        $0.cell.textField.keyboardType = .default
                        $0.cell.textField.autocorrectionType = .no
                        $0.cell.textField.autocapitalizationType = .sentences
                        } .onCellSelection { cell, row in
                            tagFam = row.tag!
                            actionSheetFamily()
                    }
                }
                
                let family5 = relatives5?.components(separatedBy: "&") ?? [""]
                if familyNonOpt5 != "&" {
                    $0 <<< TextRow() {
                        $0.title = family5[0]
                        $0.value = family5[1]
                        $0.tag = "Relatives_5"
                        $0.cell.textField.keyboardType = .default
                        $0.cell.textField.autocorrectionType = .no
                        $0.cell.textField.autocapitalizationType = .sentences
                        } .onCellSelection { cell, row in
                            tagFam = row.tag!
                            actionSheetFamily()
                    }
                }
                
        }
        
        
        form +++ Section()
            <<< TextAreaRow("Notes") { row in
                row.placeholder = "Notes"
                } .cellSetup { cell, row in
                    row.value = self.notes
                    row.cell.update()
        }
    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
        var dict = form.values(includeHidden: true)
        
        let date = Date()
        let addressEx = PostalAddress()
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.long
        let birthday = dict["Birthday"] as? Date ?? date
        let birthdayComponentsString = formatter.string(from: birthday)
        
        let firstName = dict["First Name"] as? String ?? ""
        let lastName = dict["Last Name"] as? String ?? ""
        let company = dict["Company"] as? String ?? ""
        
        
        let phoneNumber1 = dict["tag_1"] as? String ?? ""
        let phoneNumber2 = dict["tag_2"] as? String ?? ""
        let phoneNumber3 = dict["tag_3"] as? String ?? ""
        let phoneNumber4 = dict["tag_4"] as? String ?? ""
        let phoneNumber5 = dict["tag_5"] as? String ?? ""
        
        
        let email1 = dict["Email_1"] as? String ?? ""
        let email2 = dict["Email_2"] as? String ?? ""
        let email3 = dict["Email_3"] as? String ?? ""
        let email4 = dict["Email_4"] as? String ?? ""
        let email5 = dict["Email_5"] as? String ?? ""
        
        
        let url1 = dict["URL_1"] as? String ?? ""
        let url2 = dict["URL_2"] as? String ?? ""
        let url3 = dict["URL_3"] as? String ?? ""
        let url4 = dict["URL_4"] as? String ?? ""
        let url5 = dict["URL_5"] as? String ?? ""
        
        let type1 = self.form.rowBy(tag: "Social Profile_1")?.title ?? ""
        let socialProfileOne = dict["Social Profile_1"] as? String ?? ""
        let socialProfile1 = "\(type1)&\(socialProfileOne)"
        
        let type2 = self.form.rowBy(tag: "Social Profile_2")?.title ?? ""
        let socialProfileTwo = dict["Social Profile_2"] as? String ?? ""
        let socialProfile2 = "\(type2)&\(socialProfileTwo)"
        
        let type3 = self.form.rowBy(tag: "Social Profile_3")?.title ?? ""
        let socialProfileThree = dict["Social Profile_3"] as? String ?? ""
        let socialProfile3 = "\(type3)&\(socialProfileThree)"
        
        let type4 = self.form.rowBy(tag: "Social Profile_4")?.title ?? ""
        let socialProfileFour = dict["Social Profile_4"] as? String ?? ""
        let socialProfile4 = "\(type4)&\(socialProfileFour)"
        
        let type5 = self.form.rowBy(tag: "Social Profile_5")?.title ?? ""
        let socialProfileFive = dict["Social Profile_5"] as? String ?? ""
        let socialProfile5 = "\(type5)&\(socialProfileFive)"
        
        
        let accountType1 = self.form.rowBy(tag: "Account_1")?.title ?? ""
        let accountOne = dict["Account_1"] as? String ?? ""
        let account1 = "\(accountType1)&\(accountOne)"
        
        let accountType2 = self.form.rowBy(tag: "Account_2")?.title ?? ""
        let accountTwo = dict["Account_2"] as? String ?? ""
        let account2 = "\(accountType2)&\(accountTwo)"
        
        let accountType3 = self.form.rowBy(tag: "Account_3")?.title ?? ""
        let accountThree = dict["Account_3"] as? String ?? ""
        let account3 = "\(accountType3)&\(accountThree)"
        
        let accountType4 = self.form.rowBy(tag: "Account_4")?.title ?? ""
        let accountFour = dict["Account_4"] as? String ?? ""
        let account4 = "\(accountType4)&\(accountFour)"
        
        let accountType5 = self.form.rowBy(tag: "Account_5")?.title ?? ""
        let accountFive = dict["Account_5"] as? String ?? ""
        let account5 = "\(accountType5)&\(accountFive)"
        
        
        
        let familyType1 = self.form.rowBy(tag: "Relatives_1")?.title ?? ""
        let familyOne = dict["Relatives_1"] as? String ?? ""
        let relatives1 = "\(familyType1)&\(familyOne)"
        
        let familyType2 = self.form.rowBy(tag: "Relatives_2")?.title ?? ""
        let familyTwo = dict["Relatives_2"] as? String ?? ""
        let relatives2 = "\(familyType2)&\(familyTwo)"
        
        let familyType3 = self.form.rowBy(tag: "Relatives_3")?.title ?? ""
        let familyThree = dict["Relatives_3"] as? String ?? ""
        let relatives3 = "\(familyType3)&\(familyThree)"
        
        let familyType4 = self.form.rowBy(tag: "Relatives_4")?.title ?? ""
        let familyFour = dict["Relatives_4"] as? String ?? ""
        let relatives4 = "\(familyType4)&\(familyFour)"
        
        let familyType5 = self.form.rowBy(tag: "Relatives_5")?.title ?? ""
        let familyFive = dict["Relatives_5"] as? String ?? ""
        let relatives5 = "\(familyType5)&\(familyFive)"
        
        let notes = dict["Notes"] as? String ?? ""
        
        let address1 = dict["Address_1"] as? PostalAddress ?? addressEx
        let address2 = dict["Address_2"] as? PostalAddress ?? addressEx
        let address3 = dict["Address_3"] as? PostalAddress ?? addressEx
        
        let street1 = address1.street ?? ""
        let state1 = address1.state ?? ""
        let city1 = address1.city ?? ""
        let country1 = address1.country ?? ""
        let postalCode1 = address1.postalCode ?? ""
        
        let street2 = address2.street ?? ""
        let state2 = address2.state ?? ""
        let city2 = address2.city ?? ""
        let country2 = address2.country ?? ""
        let postalCode2 = address1.postalCode ?? ""
        
        let street3 = address3.street ?? ""
        let state3 = address3.state ?? ""
        let city3 = address3.city ?? ""
        let country3 = address3.country ?? ""
        let postalCode3 = address3.postalCode ?? ""
        
        
        deleteUser()
        
        storeUser(
            firstName: "\(String(describing: firstName))",
            lastName: "\(String(describing: lastName))",
            company: "\(String(describing: company))",
            
            phoneNumber1: "\(String(describing: phoneNumber1))",
            phoneNumber2: "\(String(describing: phoneNumber2))",
            phoneNumber3: "\(String(describing: phoneNumber3))",
            phoneNumber4: "\(String(describing: phoneNumber4))",
            phoneNumber5: "\(String(describing: phoneNumber5))",
            
            
            email1: "\(String(describing: email1))",
            email2: "\(String(describing: email2))",
            email3: "\(String(describing: email3))",
            email4: "\(String(describing: email4))",
            email5: "\(String(describing: email5))",
            
            url1: "\(String(describing: url1))",
            url2: "\(String(describing: url2))",
            url3: "\(String(describing: url3))",
            url4: "\(String(describing: url4))",
            url5: "\(String(describing: url5))",
            
            street1: "\(String(describing: street1))",
            state1: "\(String(describing: state1))",
            city1: "\(String(describing: city1))",
            country1: "\(String(describing: country1))",
            postalCode1: "\(String(describing: postalCode1))",
            
            street2: "\(String(describing: street2))",
            state2: "\(String(describing: state2))",
            city2: "\(String(describing: city2))",
            country2: "\(String(describing: country2))",
            postalCode2: "\(String(describing: postalCode2))",
            
            street3: "\(String(describing: street3))",
            state3: "\(String(describing: state3))",
            city3: "\(String(describing: city3))",
            country3: "\(String(describing: country3))",
            postalCode3: "\(String(describing: postalCode3))",
            
            birthday: "\(String(describing: birthdayComponentsString))",
            
            socialProfile1: "\(String(describing: socialProfile1))",
            socialProfile2: "\(String(describing: socialProfile2))",
            socialProfile3: "\(String(describing: socialProfile3))",
            socialProfile4: "\(String(describing: socialProfile4))",
            socialProfile5: "\(String(describing: socialProfile5))",
            
            account1: "\(String(describing: account1))",
            account2: "\(String(describing: account2))",
            account3: "\(String(describing: account3))",
            account4: "\(String(describing: account4))",
            account5: "\(String(describing: account5))",
            
            relatives1: "\(String(describing: relatives1))",
            relatives2: "\(String(describing: relatives2))",
            relatives3: "\(String(describing: relatives3))",
            relatives4: "\(String(describing: relatives4))",
            relatives5: "\(String(describing: relatives5))",
            
            notes: "\(String(describing: notes))")
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func storeUser (firstName: String,
                    lastName: String,
                    company: String,
                    
                    phoneNumber1: String,
                    phoneNumber2: String,
                    phoneNumber3: String,
                    phoneNumber4: String,
                    phoneNumber5: String,
                    
                    email1: String,
                    email2: String,
                    email3: String,
                    email4: String,
                    email5: String,
                    
                    url1: String,
                    url2: String,
                    url3: String,
                    url4: String,
                    url5: String,
                    
                    street1: String,
                    state1: String,
                    city1: String,
                    country1: String,
                    postalCode1: String,
                    
                    street2: String,
                    state2: String,
                    city2: String,
                    country2: String,
                    postalCode2: String,
                    
                    street3: String,
                    state3: String,
                    city3: String,
                    country3: String,
                    postalCode3: String,
                    
                    
                    birthday: String,
                    
                    socialProfile1: String,
                    socialProfile2: String,
                    socialProfile3: String,
                    socialProfile4: String,
                    socialProfile5: String,
                    
                    account1: String,
                    account2: String,
                    account3: String,
                    account4: String,
                    account5: String,
                    
                    relatives1: String,
                    relatives2: String,
                    relatives3: String,
                    relatives4: String,
                    relatives5: String,
                    
                    notes: String) {
        
        let context = getContext()
        
        let entity =  NSEntityDescription.entity(forEntityName: "Private", in: context)
        
        let user = NSManagedObject(entity: entity!, insertInto: context)
        
        user.setValue(firstName, forKey: "firstName")
        user.setValue(lastName, forKey: "lastName")
        user.setValue(company, forKey: "company")
        
        user.setValue(phoneNumber1, forKey: "phoneNumber1")
        user.setValue(phoneNumber2, forKey: "phoneNumber2")
        user.setValue(phoneNumber3, forKey: "phoneNumber3")
        user.setValue(phoneNumber4, forKey: "phoneNumber4")
        user.setValue(phoneNumber5, forKey: "phoneNumber5")
        
        user.setValue(email1, forKey: "email1")
        user.setValue(email2, forKey: "email2")
        user.setValue(email3, forKey: "email3")
        user.setValue(email4, forKey: "email4")
        user.setValue(email5, forKey: "email5")
        
        user.setValue(url1, forKey: "url1")
        user.setValue(url2, forKey: "url2")
        user.setValue(url3, forKey: "url3")
        user.setValue(url4, forKey: "url4")
        user.setValue(url5, forKey: "url5")
        
        user.setValue(street1, forKey: "street1")
        user.setValue(state1, forKey: "state1")
        user.setValue(city1, forKey: "city1")
        user.setValue(country1, forKey: "country1")
        user.setValue(postalCode1, forKey: "postalCode1")
        
        user.setValue(street2, forKey: "street2")
        user.setValue(state2, forKey: "state2")
        user.setValue(city2, forKey: "city2")
        user.setValue(country2, forKey: "country2")
        user.setValue(postalCode2, forKey: "postalCode2")
        
        user.setValue(street3, forKey: "street3")
        user.setValue(state3, forKey: "state3")
        user.setValue(city3, forKey: "city3")
        user.setValue(country3, forKey: "country3")
        user.setValue(postalCode3, forKey: "postalCode3")
        
        
        user.setValue(birthday, forKey: "birthday")
        
        user.setValue(socialProfile1, forKey: "socialProfile1")
        user.setValue(socialProfile2, forKey: "socialProfile2")
        user.setValue(socialProfile3, forKey: "socialProfile3")
        user.setValue(socialProfile4, forKey: "socialProfile4")
        user.setValue(socialProfile5, forKey: "socialProfile5")
        
        user.setValue(account1, forKey: "account1")
        user.setValue(account2, forKey: "account2")
        user.setValue(account3, forKey: "account3")
        user.setValue(account4, forKey: "account4")
        user.setValue(account5, forKey: "account5")
        
        user.setValue(relatives1, forKey: "relatives1")
        user.setValue(relatives2, forKey: "relatives2")
        user.setValue(relatives3, forKey: "relatives3")
        user.setValue(relatives4, forKey: "relatives4")
        user.setValue(relatives5, forKey: "relatives5")
        
        user.setValue(notes, forKey: "notes")
        
        //save the object
        do {
            try context.save()
            print("saved!")
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        } catch {
            
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
    
    func getUsers () {
        //create a fetch request, telling it about the entity
        let fetchRequest: NSFetchRequest<Private> = Private.fetchRequest()
        
        do {
            //go get the results
            let array_users = try getContext().fetch(fetchRequest)
            
            //I like to check the size of the returned results!
            print ("num of users = \(array_users.count)")
            
            //You need to convert to NSManagedObject to use 'for' loops
            for user in array_users as [NSManagedObject] {
                //get the Key Value pairs (although there may be a better way to do that...
                
                firstName = user.value(forKey: "firstName") as? String
                if firstName != nil {
                    self.form.rowBy(tag: "First Name")?.updateCell()
                }
                
                lastName = user.value(forKey: "lastName") as? String
                if lastName != nil {
                    self.form.rowBy(tag: "Last Name")?.updateCell()
                }
                
                company = user.value(forKey: "company") as? String
                if company != nil {
                    self.form.rowBy(tag: "Company")?.updateCell()
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
                url2 = user.value(forKey: "url2") as? String
                url3 = user.value(forKey: "url3") as? String
                url4 = user.value(forKey: "url4") as? String
                url5 = user.value(forKey: "url5") as? String
                
                street1 = user.value(forKey: "street1") as? String
                if street1 != "" {
                    self.form.rowBy(tag: "Address_1")?.updateCell()
                }
                
                state1 = user.value(forKey: "state1") as? String
                if state1 != "" {
                    self.form.rowBy(tag: "Address_1")?.updateCell()
                }
                
                city1 = user.value(forKey: "city1") as? String
                if city1 != "" {
                    self.form.rowBy(tag: "Address_1")?.updateCell()
                }
                
                
                postalCode1 = user.value(forKey: "postalCode1") as? String
                if postalCode1 != "" {
                    self.form.rowBy(tag: "Address_1")?.updateCell()
                }
                
                country1 = user.value(forKey: "country1") as? String
                if country1 != "" {
                    self.form.rowBy(tag: "Address_1")?.updateCell()
                }
                
                
                
                street2 = user.value(forKey: "street2") as? String
                if street2 != "" {
                    self.form.rowBy(tag: "Address_2")?.updateCell()
                }
                
                state2 = user.value(forKey: "state2") as? String
                if state2 != "" {
                    self.form.rowBy(tag: "Address_2")?.updateCell()
                }
                
                city2 = user.value(forKey: "city2") as? String
                if city2 != "" {
                    self.form.rowBy(tag: "Address_2")?.updateCell()
                }
                
                
                postalCode2 = user.value(forKey: "postalCode2") as? String
                if postalCode2 != "" {
                    self.form.rowBy(tag: "Address_2")?.updateCell()
                }
                
                country2 = user.value(forKey: "country2") as? String
                if country2 != "" {
                    self.form.rowBy(tag: "Address_2")?.updateCell()
                }
                
                
                
                street3 = user.value(forKey: "street3") as? String
                if street3 != "" {
                    self.form.rowBy(tag: "Address_3")?.updateCell()
                }
                
                state3 = user.value(forKey: "state3") as? String
                if state3 != "" {
                    self.form.rowBy(tag: "Address_3")?.updateCell()
                }
                
                city3 = user.value(forKey: "city3") as? String
                if city3 != "" {
                    self.form.rowBy(tag: "Address_3")?.updateCell()
                }
                
                
                postalCode3 = user.value(forKey: "postalCode3") as? String
                if postalCode3 != Optional("") {
                    self.form.rowBy(tag: "Address_3")?.updateCell()
                }
                
                country3 = user.value(forKey: "country3") as? String
                if country3 != "" {
                    self.form.rowBy(tag: "Address_3")?.updateCell()
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
                
                
                notes = user.value(forKey: "notes") as? String
                if notes != nil {
                    self.form.rowBy(tag: "Notes")?.updateCell()
                }
            }
        } catch {
            print("Error with request: \(error)")
        }
    }
}
