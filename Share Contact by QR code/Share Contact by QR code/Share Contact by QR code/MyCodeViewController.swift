//
//  MyCodeViewController.swift
//  Share Contact by QR code
//
//  Created by YERZHAN SERIKBAY on 7/10/17.
//  Copyright © 2017 YERZHAN SERIKBAY. All rights reserved.
//

import UIKit
import QRCode
import FirebaseAuth
import FirebaseDatabase
import Firebase
import NVActivityIndicatorView
import CoreData



class MyCodeViewController: UIViewController, NVActivityIndicatorViewable {
    
    var qrcodeText: UITextView!
    
    var firstName: String? = ""
    var lastName: String? = ""
    var company: String? = ""
    
    var phoneNumber1: String? = ""
    var phoneNumber2: String? = ""
    var phoneNumber3: String? = ""
    var phoneNumber4: String? = ""
    var phoneNumber5: String? = ""
    
    
    var email1: String? = ""
    var email2: String? = ""
    var email3: String? = ""
    var email4: String? = ""
    var email5: String? = ""
    
    var url1: String? = ""
    var url2: String? = ""
    var url3: String? = ""
    var url4: String? = ""
    var url5: String? = ""
    
    var street1: String? = ""
    var state1: String? = ""
    var city1: String? = ""
    var country1: String? = ""
    var postalCode1: String? = ""
    
    var street2: String? = ""
    var state2: String? = ""
    var city2: String? = ""
    var country2: String? = ""
    var postalCode2: String? = ""
    
    var street3: String? = ""
    var state3: String? = ""
    var city3: String? = ""
    var country3: String? = ""
    var postalCode3: String? = ""
    
    var birthday: String? = ""
    
    var socialProfile1: String? = ""
    var socialProfile2: String? = ""
    var socialProfile3: String? = ""
    var socialProfile4: String? = ""
    var socialProfile5: String? = ""
    
    var instantMessage1: String? = ""
    var instantMessage2: String? = ""
    var instantMessage3: String? = ""
    var instantMessage4: String? = ""
    var instantMessage5: String? = ""
    
    var relatives1: String? = ""
    var relatives2: String? = ""
    var relatives3: String? = ""
    var relatives4: String? = ""
    var relatives5: String? = ""
    
    var notes: String? = ""
    
    var firstNamePublic: String = " "
    var lastNamePublic: String = " "
    var companyPublic: String = " "
    var phoneNumberPublic: String = " "
    var emailPublic: String = " "
    var urlPublic: String = " "
    var addressPublic: [String] = [" "]
    var birthdayPublic: String = " "
    var socialProfilePublic: String = " "
    var instantMessagePublic: String = " "
    var relativesPublic: String = " "
    var notesPublic: String = " "
    
    var firstNameSocial: String = " "
    var lastNameSocial: String = " "
    var companySocial: String = " "
    var phoneNumberSocial: String = " "
    var emailSocial: String = " "
    var urlSocial: String = " "
    var addressSocial: [String] = [" "]
    var birthdaySocial: String = " "
    var socialProfileSocial: String = " "
    var instantMessageSocial: String = " "
    var relativesSocial: String = " "
    var notesSocial: String = " "
    
    
    //let firstRun = UserDefaults.standard.bool(forKey: "firstRun") as Bool
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var imgqrCode: UIImageView!
    @IBOutlet weak var warringLabel: UILabel!
  
    
    override func viewWillAppear(_ animated: Bool) {
        getUsers()
        genCodePrivate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = #imageLiteral(resourceName: "user.png")
        
        let imageData:NSData = UIImageJPEGRepresentation(image, 0.8)! as NSData
        
        UserDefaults.standard.set(imageData, forKey: "savedImage")
        
        
        getUsers()
        genCodePrivate()
        
        let firstItem = UIApplicationShortcutItem(type: "share", localizedTitle: "Scan")
        UIApplication.shared.shortcutItems = [firstItem]
        
        Auth.auth().signInAnonymously(completion: { (user, error) in
            if error != nil {
                print(error!)
                return
            }
            print("User logged anonymously wth uid: " + user!.uid)
           // self.startAnimating()
//            if !self.firstRun {
//                self.stopAnimating()
//                self.warringLabel.text = "Set Your Profiles"
//                UserDefaults.standard.set(true, forKey: "firstRun")
//            }
            //self.warringLabel.isHidden = true
           // self.privateProfileData()
            //self.publicProfileData()
          //  self.socialProfileData()
            self.segmentedControl.selectedSegmentIndex = .allZeros
        })
    }
    
    @IBAction func codeChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            genCodePrivate()
        case 1:
            genCodePublic()
        case 2:
            genCodeSocial()
        default:
            break
        }
    }
    
    
   
//    func privateProfileData() {
//        
//        //self.startAnimating()
//        User.fetchUser { (user, error) in
//            if error == nil {
//                guard let user = user else { return }
//                
//                if let number = user.phoneNumber {
//                    self.phoneNumber = number
//                }
//                
//                if let firstName = user.firstName {
//                    self.firstName = firstName
//                }
//                
//                if let lastName = user.lastName {
//                    self.lastName = lastName
//                }
//                
//                if let company = user.company {
//                    self.company = company
//                }
//                
//                if let email = user.email {
//                    self.email = email
//                }
//                
//                if let url = user.url {
//                    self.url = url
//                }
//                
//                //     if let address = user.address {
//                //       self.address = address
//                //     self.form.rowBy(tag: "Address")?.updateCell()
//                // }
//                //     if let birthday = user.birthday {
//                //       self.birthday = birthday
//                //     self.form.rowBy(tag: "Birthday")?.updateCell()
//                // }
//                
//                if let socialProfile = user.socialProfile {
//                    self.socialProfile = socialProfile
//                }
//                
//                if let instantMessage = user.instantMessage {
//                    self.instantMessage = instantMessage
//                }
//                
//                if let relatives = user.relatives {
//                    self.relatives = relatives
//                }
//                
//                if let notes = user.notes {
//                    self.notes = notes
//                }
//            }
//        }
//    }
    func genCodePrivate() {
        let firstNameNonOpt = firstName ?? ""
        let lastNameNonOpt = lastName ?? ""
        let companyNonOpt = company ?? ""
        
        let phoneNumber1NonOpt = phoneNumber1 ?? ""
        let phoneNumber2NonOpt = phoneNumber2 ?? ""
        let phoneNumber3NonOpt = phoneNumber3 ?? ""
        let phoneNumber4NonOpt = phoneNumber4 ?? ""
        let phoneNumber5NonOpt = phoneNumber5 ?? ""
        
        let email1NonOpt = email1 ?? ""
        let email2NonOpt = email2 ?? ""
        let email3NonOpt = email3 ?? ""
        let email4NonOpt = email4 ?? ""
        let email5NonOpt = email5 ?? ""
        
        let url1NonOpt = url1 ?? ""
        let url2NonOpt = url2 ?? ""
        let url3NonOpt = url3 ?? ""
        let url4NonOpt = url4 ?? ""
        let url5NonOpt = url5 ?? ""
        
        let street1NonOpt = street1 ?? ""
        let street2NonOpt = street2 ?? ""
        let street3NonOpt = street3 ?? ""
        
        let state1NonOpt = state1 ?? ""
        let state2NonOpt = state2 ?? ""
        let state3NonOpt = state3 ?? ""
        
        let city1NonOpt = city1 ?? ""
        let city2NonOpt = city2 ?? ""
        let city3NonOpt = city3 ?? ""
        
        let country1NonOpt = country1 ?? ""
        let country2NonOpt = country2 ?? ""
        let country3NonOpt = country3 ?? ""
        
        let postalCode1NonOpt = postalCode1 ?? ""
        let postalCode2NonOpt = postalCode2 ?? ""
        let postalCode3NonOpt = postalCode3 ?? ""
        
        let birthdayNonOpt = birthday ?? ""
        
        let socialProfile1NonOpt = socialProfile1 ?? ""
        let socialProfile2NonOpt = socialProfile2 ?? ""
        let socialProfile3NonOpt = socialProfile3 ?? ""
        let socialProfile4NonOpt = socialProfile4 ?? ""
        let socialProfile5NonOpt = socialProfile5 ?? ""
        
        let instantMessage1NonOpt = instantMessage1 ?? ""
        let instantMessage2NonOpt = instantMessage2 ?? ""
        let instantMessage3NonOpt = instantMessage3 ?? ""
        let instantMessage4NonOpt = instantMessage4 ?? ""
        let instantMessage5NonOpt = instantMessage5 ?? ""
        
        let relatives1NonOpt = relatives1 ?? ""
        let relatives2NonOpt = relatives2 ?? ""
        let relatives3NonOpt = relatives3 ?? ""
        let relatives4NonOpt = relatives4 ?? ""
        let relatives5NonOpt = relatives5 ?? ""
        
        let notesNonOpt = notes ?? ""
       
        var qrCodePrivate = QRCode("\(firstNameNonOpt)*\(lastNameNonOpt)*\(companyNonOpt)*\(phoneNumber1NonOpt)*\(phoneNumber2NonOpt)*\(phoneNumber3NonOpt)*\(phoneNumber4NonOpt)*\(phoneNumber5NonOpt)*\(email1NonOpt)*\(email2NonOpt)*\(email3NonOpt)*\(email4NonOpt)*\(email5NonOpt)*\(url1NonOpt)*\(url2NonOpt)*\(url3NonOpt)*\(url4NonOpt)*\(url5NonOpt)*\(street1NonOpt)*\(street2NonOpt)*\(street3NonOpt)*\(state1NonOpt)*\(state2NonOpt)*\(state3NonOpt)*\(city1NonOpt)*\(city2NonOpt)*\(city3NonOpt)*\(country1NonOpt)*\(country2NonOpt)*\(country3NonOpt)*\(postalCode1NonOpt)*\(postalCode2NonOpt)*\(postalCode3NonOpt)*\(birthdayNonOpt)*\(socialProfile1NonOpt)*\(socialProfile2NonOpt)*\(socialProfile3NonOpt)*\(socialProfile4NonOpt)*\(socialProfile5NonOpt)*\(instantMessage1NonOpt)*\(instantMessage2NonOpt)*\(instantMessage3NonOpt)*\(instantMessage4NonOpt)*\(instantMessage5NonOpt)*\(relatives1NonOpt)*\(relatives2NonOpt)*\(relatives3NonOpt)*\(relatives4NonOpt)*\(relatives5NonOpt)*\(notesNonOpt)")
      //  print(firstName)
        qrCodePrivate?.size = self.imgqrCode.bounds.size
        qrCodePrivate?.errorCorrection = .High
        qrCodePrivate?.size = CGSize(width: 297, height: 297)
        imgqrCode.image = qrCodePrivate?.image
        
      
    }
//    func publicProfileData() {
//        // self.startAnimating()
//        UserPublic.fetchUser { (user, error) in
//            if error == nil {
//                guard let user = user else { return }
//                
//                if let number = user.phoneNumber {
//                    self.phoneNumberPublic = number
//                }
//                
//                if let firstName = user.firstName {
//                    self.firstNamePublic = firstName
//                }
//                
//                if let lastName = user.lastName {
//                    self.lastNamePublic = lastName
//                }
//                
//                if let company = user.company {
//                    self.companyPublic = company
//                }
//                
//                if let email = user.email {
//                    self.emailPublic = email
//                }
//                
//                if let url = user.url {
//                    self.urlPublic = url
//                }
//                
//                //     if let address = user.address {
//                //       self.addressPublic = address
//                // }
//                //     if let birthday = user.birthday {
//                //       self.birthdayPublic = birthday
//                // }
//                
//                if let socialProfile = user.socialProfile {
//                    self.socialProfilePublic = socialProfile
//                }
//                
//                if let instantMessage = user.instantMessage {
//                    self.instantMessagePublic = instantMessage
//                }
//                
//                if let relatives = user.relatives {
//                    self.relativesPublic = relatives
//                }
//                
//                if let notes = user.notes {
//                    self.notesPublic = notes
//                }
//            }
//        }
//    }
    func genCodePublic() {
        var qrCodePublic = QRCode("\(self.firstNamePublic)*\(self.lastNamePublic)*\(self.companyPublic)*\(self.phoneNumberPublic)*\(self.emailPublic)*\(self.urlPublic)*\(self.addressPublic)*\(self.birthdayPublic)*\(self.socialProfilePublic)*\(self.instantMessagePublic)*\(self.relativesPublic)*\(self.notesPublic)")
        qrCodePublic?.size = self.imgqrCode.bounds.size
        qrCodePublic?.errorCorrection = .High
        qrCodePublic?.size = CGSize(width: 297, height: 297)
        self.imgqrCode.image = qrCodePublic?.image
    }
//    func socialProfileData() {
//        UserSocial.fetchUser { (user, error) in
//            if error == nil {
//                guard let user = user else { return }
//                
//                if let number = user.phoneNumber {
//                    self.phoneNumberSocial = number
//                }
//                
//                if let firstName = user.firstName {
//                    self.firstNameSocial = firstName
//                }
//                
//                if let lastName = user.lastName {
//                    self.lastNameSocial = lastName
//                }
//                
//                if let company = user.company {
//                    self.companySocial = company
//                }
//                
//                if let email = user.email {
//                    self.emailSocial = email
//                }
//                
//                if let url = user.url {
//                    self.urlSocial = url
//                }
//                
//                //     if let address = user.address {
//                //       self.addressSocial = address
//                // }
//                //     if let birthday = user.birthday {
//                //       self.birthdaySocial = birthday
//                // }
//                
//                if let socialProfile = user.socialProfile {
//                    self.socialProfileSocial = socialProfile
//                }
//                
//                if let instantMessage = user.instantMessage {
//                    self.instantMessageSocial = instantMessage
//                }
//                
//                if let relatives = user.relatives {
//                    self.relativesSocial = relatives
//                }
//                
//                if let notes = user.notes {
//                    self.notesSocial = notes
//                }
//                self.genCodePrivate()
//                self.segmentedControl.selectedSegmentIndex = 0
//                self.stopAnimating()
//            }
//        }
//    }
    func genCodeSocial() {
        var qrCodeSocial = QRCode("\(self.firstNameSocial)*\(self.lastNameSocial)*\(self.companySocial)*\(self.phoneNumberSocial)*\(self.emailSocial)*\(self.urlSocial)*\(self.addressSocial)*\(self.birthdaySocial)*\(self.socialProfileSocial)*\(self.instantMessageSocial)*\(self.relativesSocial)*\(self.notesSocial)")
        qrCodeSocial?.size = self.imgqrCode.bounds.size
        qrCodeSocial?.errorCorrection = .High
        qrCodeSocial?.size = CGSize(width: 297, height: 297)
        self.imgqrCode.image = qrCodeSocial?.image
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
    
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func getUsers () {
        
        let fetchRequest: NSFetchRequest<Private> = Private.fetchRequest()
        
        do {
            
            let array_users = try getContext().fetch(fetchRequest)
            
            for user in array_users as [NSManagedObject] {
                
                firstName = user.value(forKey: "firstName") as? String ?? ""
                
                lastName = user.value(forKey: "lastName") as? String ?? ""
                
            
                if company != nil {
                    company = user.value(forKey: "company") as? String
                }
                
                if phoneNumber1 != nil {
                    phoneNumber1 = user.value(forKey: "phoneNumber1") as? String
                }
                
                if phoneNumber2 != nil {
                    phoneNumber2 = user.value(forKey: "phoneNumber2") as? String
                }
                
                if phoneNumber3 != nil {
                    phoneNumber3 = user.value(forKey: "phoneNumber3") as? String
                }
                
                if phoneNumber4 != nil {
                    phoneNumber4 = user.value(forKey: "phoneNumber4") as? String
                }
                
                if phoneNumber5 != nil {
                    phoneNumber5 = user.value(forKey: "phoneNumber5") as? String
                }
                
                if email1 != nil {
                    email1 = user.value(forKey: "email1") as? String
                }
                if email2 != nil {
                    email2 = user.value(forKey: "email2") as? String
                }
                if email3 != nil {
                    email3 = user.value(forKey: "email3") as? String
                }
                if email4 != nil {
                    email4 = user.value(forKey: "email4") as? String
                }
                if email5 != nil {
                    email5 = user.value(forKey: "email5") as? String
                }
                
                
                if url1 != nil {
                    url1 = user.value(forKey: "url1") as? String
                }
                if url2 != nil {
                    url2 = user.value(forKey: "url2") as? String
                }
                if url3 != nil {
                    url3 = user.value(forKey: "url3") as? String
                }
                if url4 != nil {
                    url4 = user.value(forKey: "url4") as? String
                }
                if url5 != nil {
                    url5 = user.value(forKey: "url5") as? String
                }
                
                if street1 != nil {
                    street1 = user.value(forKey: "street1") as? String
                }
                
                if state1 != nil {
                    state1 = user.value(forKey: "state1") as? String
                }
                
                if city1 != nil {
                    city1 = user.value(forKey: "city1") as? String
                }
                
                if postalCode1 != nil {
                    postalCode1 = user.value(forKey: "postalCode1") as? String
                }
                
                if country1 != nil {
                    country1 = user.value(forKey: "country1") as? String
                }
                
                if street2 != nil {
                    street2 = user.value(forKey: "street2") as? String
                }
                
                if state2 != nil {
                    state2 = user.value(forKey: "state2") as? String
                }
                
                if city2 != nil {
                    city2 = user.value(forKey: "city2") as? String
                }
                
                if postalCode2 != nil {
                    postalCode2 = user.value(forKey: "postalCode2") as? String
                }
                
                if country2 != nil {
                    country2 = user.value(forKey: "country2") as? String
                }
                
                if street3 != nil {
                    street3 = user.value(forKey: "street3") as? String
                }
                
                if state3 != nil {
                    state3 = user.value(forKey: "state3") as? String
                }
                
                if city3 != nil {
                    city3 = user.value(forKey: "city3") as? String
                }
                
                if postalCode3 != nil {
                    postalCode3 = user.value(forKey: "postalCode3") as? String
                }
                
                if country3 != nil {
                    country3 = user.value(forKey: "country3") as? String
                }
                
                if birthday != nil {
                    birthday = user.value(forKey: "birthday") as? String
                }
                
                if socialProfile1 != nil {
                    socialProfile1 = user.value(forKey: "socialProfile1") as? String
                }
                if socialProfile2 != nil {
                    socialProfile2 = user.value(forKey: "socialProfile2") as? String
                }
                if socialProfile3 != nil {
                    socialProfile3 = user.value(forKey: "socialProfile3") as? String
                }
                if socialProfile4 != nil {
                    socialProfile4 = user.value(forKey: "socialProfile4") as? String
                }
                if socialProfile5 != nil {
                    socialProfile5 = user.value(forKey: "socialProfile5") as? String
                }
                
                
                if instantMessage1 != nil {
                    instantMessage1 = user.value(forKey: "account1") as? String
                }
                if instantMessage2 != nil {
                    instantMessage2 = user.value(forKey: "account2") as? String
                }
                if instantMessage3 != nil {
                    instantMessage3 = user.value(forKey: "account3") as? String
                }
                if instantMessage4 != nil {
                    instantMessage4 = user.value(forKey: "account4") as? String
                }
                if instantMessage5 != nil {
                    instantMessage5 = user.value(forKey: "account5") as? String
                }
                
                
                if relatives1 != nil {
                    relatives1 = user.value(forKey: "relatives1") as? String
                }
                if relatives2 != nil {
                    relatives2 = user.value(forKey: "relatives2") as? String
                }
                if relatives3 != nil {
                    relatives3 = user.value(forKey: "relatives3") as? String
                }
                if relatives4 != nil {
                    relatives4 = user.value(forKey: "relatives4") as? String
                }
                if relatives5 != nil {
                    relatives5 = user.value(forKey: "relatives5") as? String
                }
                
                
                if notes != nil {
                    notes = user.value(forKey: "notes") as? String
                }
            }
        } catch {
            print("Error with request: \(error)")
        }
    }
}


