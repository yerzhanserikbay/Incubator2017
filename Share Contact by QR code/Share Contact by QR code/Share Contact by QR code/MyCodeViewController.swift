//
//  MyCodeViewController.swift
//  Share Contact by QR code
//
//  Created by YERZHAN SERIKBAY on 7/10/17.
//  Copyright © 2017 YERZHAN SERIKBAY. All rights reserved.
//

import UIKit
import QRCode
import NVActivityIndicatorView
import CoreData
import TwicketSegmentedControl
import CoreImage

class MyCodeViewController: UIViewController, NVActivityIndicatorViewable, TwicketSegmentedControlDelegate {
    
    class Barcode {
        
        class func fromString(string : String) -> UIImage {
            let data = string.data(using: .ascii)
            let filter = CIFilter(name: "CICode128BarcodeGenerator")
            filter?.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            
            if let output = filter?.outputImage?.applying(transform) {
                return UIImage(ciImage: output)
            }
            return UIImage(ciImage: (filter?.outputImage)!)
        }
    }
    
    
    
    
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
    
    var firstNamePublic: String? = ""
    var lastNamePublic: String? = ""
    var companyPublic: String? = ""
    
    var phoneNumber1Public: String? = ""
    var phoneNumber2Public: String? = ""
    var phoneNumber3Public: String? = ""
    var phoneNumber4Public: String? = ""
    var phoneNumber5Public: String? = ""
    
    
    var email1Public: String? = ""
    var email2Public: String? = ""
    var email3Public: String? = ""
    var email4Public: String? = ""
    var email5Public: String? = ""
    
    var url1Public: String? = ""
    var url2Public: String? = ""
    var url3Public: String? = ""
    var url4Public: String? = ""
    var url5Public: String? = ""
    
    var street1Public: String? = ""
    var state1Public: String? = ""
    var city1Public: String? = ""
    var country1Public: String? = ""
    var postalCode1Public: String? = ""
    
    var street2Public: String? = ""
    var state2Public: String? = ""
    var city2Public: String? = ""
    var country2Public: String? = ""
    var postalCode2Public: String? = ""
    
    var street3Public: String? = ""
    var state3Public: String? = ""
    var city3Public: String? = ""
    var country3Public: String? = ""
    var postalCode3Public: String? = ""
    
    var birthdayPublic: String? = ""
    
    var socialProfile1Public: String? = ""
    var socialProfile2Public: String? = ""
    var socialProfile3Public: String? = ""
    var socialProfile4Public: String? = ""
    var socialProfile5Public: String? = ""
    
    var instantMessage1Public: String? = ""
    var instantMessage2Public: String? = ""
    var instantMessage3Public: String? = ""
    var instantMessage4Public: String? = ""
    var instantMessage5Public: String? = ""
    
    var relatives1Public: String? = ""
    var relatives2Public: String? = ""
    var relatives3Public: String? = ""
    var relatives4Public: String? = ""
    var relatives5Public: String? = ""
    
    var notesPublic: String? = ""
    
    var id = ""
    
    @IBOutlet weak var imgqrCode: UIImageView!
    @IBOutlet weak var idImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        idImage.isHidden = true
        getUsersID()
        getUsersPublic()
        getUsers()
        genMyID()
        genCodePrivate()
        
        
        let titles = ["Private", "Public", "MyID"]
        let frame = CGRect(x: 5, y: 500, width: view.frame.width - 10, height: 40)
        
        let segmentedControl = TwicketSegmentedControl(frame: frame)
        segmentedControl.setSegmentItems(titles)
        segmentedControl.delegate = self as TwicketSegmentedControlDelegate
        view.addSubview(segmentedControl)
        
        let firstItem = UIApplicationShortcutItem(type: "share", localizedTitle: "Scan")
        UIApplication.shared.shortcutItems = [firstItem]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getUsersID()
    }
   
    func didSelect(_ segmentIndex: Int) {
        if segmentIndex == 0 {
            genCodePrivate()
            imgqrCode.isHidden = false
            idImage.isHidden = true
        } else if segmentIndex == 1 {
            genCodePublic()
            imgqrCode.isHidden = false
            idImage.isHidden = true
        } else if segmentIndex == 2 {
            genMyID()
            imgqrCode.isHidden = true
            idImage.isHidden = false
        }
    }
    
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
        
        qrCodePrivate?.size = self.imgqrCode.bounds.size
        qrCodePrivate?.errorCorrection = .High
        qrCodePrivate?.size = CGSize(width: 375, height: 375)
        imgqrCode.image = qrCodePrivate?.image
        
      
    }
    
    func genCodePublic() {
        let firstNameNonOpt = firstNamePublic ?? ""
        let lastNameNonOpt = lastNamePublic ?? ""
        let companyNonOpt = companyPublic ?? ""
        
        let phoneNumber1NonOpt = phoneNumber1Public ?? ""
        let phoneNumber2NonOpt = phoneNumber2Public ?? ""
        let phoneNumber3NonOpt = phoneNumber3Public ?? ""
        let phoneNumber4NonOpt = phoneNumber4Public ?? ""
        let phoneNumber5NonOpt = phoneNumber5Public ?? ""
        
        let email1NonOpt = email1Public ?? ""
        let email2NonOpt = email2Public ?? ""
        let email3NonOpt = email3Public ?? ""
        let email4NonOpt = email4Public ?? ""
        let email5NonOpt = email5Public ?? ""
        
        let url1NonOpt = url1Public ?? ""
        let url2NonOpt = url2Public ?? ""
        let url3NonOpt = url3Public ?? ""
        let url4NonOpt = url4Public ?? ""
        let url5NonOpt = url5Public ?? ""
        
        let street1NonOpt = street1Public ?? ""
        let street2NonOpt = street2Public ?? ""
        let street3NonOpt = street3Public ?? ""
        
        let state1NonOpt = state1Public ?? ""
        let state2NonOpt = state2Public ?? ""
        let state3NonOpt = state3Public ?? ""
        
        let city1NonOpt = city1Public ?? ""
        let city2NonOpt = city2Public ?? ""
        let city3NonOpt = city3Public ?? ""
        
        let country1NonOpt = country1Public ?? ""
        let country2NonOpt = country2Public ?? ""
        let country3NonOpt = country3Public ?? ""
        
        let postalCode1NonOpt = postalCode1Public ?? ""
        let postalCode2NonOpt = postalCode2Public ?? ""
        let postalCode3NonOpt = postalCode3Public ?? ""
        
        let birthdayNonOpt = birthdayPublic ?? ""
        
        let socialProfile1NonOpt = socialProfile1Public ?? ""
        let socialProfile2NonOpt = socialProfile2Public ?? ""
        let socialProfile3NonOpt = socialProfile3Public ?? ""
        let socialProfile4NonOpt = socialProfile4Public ?? ""
        let socialProfile5NonOpt = socialProfile5Public ?? ""
        
        let instantMessage1NonOpt = instantMessage1Public ?? ""
        let instantMessage2NonOpt = instantMessage2Public ?? ""
        let instantMessage3NonOpt = instantMessage3Public ?? ""
        let instantMessage4NonOpt = instantMessage4Public ?? ""
        let instantMessage5NonOpt = instantMessage5Public ?? ""
        
        let relatives1NonOpt = relatives1Public ?? ""
        let relatives2NonOpt = relatives2Public ?? ""
        let relatives3NonOpt = relatives3Public ?? ""
        let relatives4NonOpt = relatives4Public ?? ""
        let relatives5NonOpt = relatives5Public ?? ""
        
        let notesNonOpt = notesPublic ?? ""
        
        var qrCodePublic = QRCode("\(firstNameNonOpt)*\(lastNameNonOpt)*\(companyNonOpt)*\(phoneNumber1NonOpt)*\(phoneNumber2NonOpt)*\(phoneNumber3NonOpt)*\(phoneNumber4NonOpt)*\(phoneNumber5NonOpt)*\(email1NonOpt)*\(email2NonOpt)*\(email3NonOpt)*\(email4NonOpt)*\(email5NonOpt)*\(url1NonOpt)*\(url2NonOpt)*\(url3NonOpt)*\(url4NonOpt)*\(url5NonOpt)*\(street1NonOpt)*\(street2NonOpt)*\(street3NonOpt)*\(state1NonOpt)*\(state2NonOpt)*\(state3NonOpt)*\(city1NonOpt)*\(city2NonOpt)*\(city3NonOpt)*\(country1NonOpt)*\(country2NonOpt)*\(country3NonOpt)*\(postalCode1NonOpt)*\(postalCode2NonOpt)*\(postalCode3NonOpt)*\(birthdayNonOpt)*\(socialProfile1NonOpt)*\(socialProfile2NonOpt)*\(socialProfile3NonOpt)*\(socialProfile4NonOpt)*\(socialProfile5NonOpt)*\(instantMessage1NonOpt)*\(instantMessage2NonOpt)*\(instantMessage3NonOpt)*\(instantMessage4NonOpt)*\(instantMessage5NonOpt)*\(relatives1NonOpt)*\(relatives2NonOpt)*\(relatives3NonOpt)*\(relatives4NonOpt)*\(relatives5NonOpt)*\(notesNonOpt)")
        qrCodePublic?.size = self.imgqrCode.bounds.size
        qrCodePublic?.errorCorrection = .High
        qrCodePublic?.size = CGSize(width: 375, height: 375)
        self.imgqrCode.image = qrCodePublic?.image
    }
    
    func genMyID() {
        let img  = Barcode.fromString(string: id)
        
        let imageView = UIImageView(image: img)
        imageView.frame = CGRect(x: 0, y: 0, width: 375, height: 50)
        self.idImage.image = imageView.image
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
    
    func getUsersPublic () {
        
        let fetchRequest: NSFetchRequest<Public> = Public.fetchRequest()
        
        do {
            
            let array_users = try getContext().fetch(fetchRequest)
            
            for user in array_users as [NSManagedObject] {
                
                firstName = user.value(forKey: "firstName") as? String ?? ""
                
                lastName = user.value(forKey: "lastName") as? String ?? ""
                
                
                if companyPublic != nil {
                    companyPublic = user.value(forKey: "company") as? String
                }
                
                if phoneNumber1Public != nil {
                    phoneNumber1Public = user.value(forKey: "phoneNumber1") as? String
                }
                
                if phoneNumber2Public != nil {
                    phoneNumber2Public = user.value(forKey: "phoneNumber2") as? String
                }
                
                if phoneNumber3Public != nil {
                    phoneNumber3Public = user.value(forKey: "phoneNumber3") as? String
                }
                
                if phoneNumber4Public != nil {
                    phoneNumber4Public = user.value(forKey: "phoneNumber4") as? String
                }
                
                if phoneNumber5Public != nil {
                    phoneNumber5Public = user.value(forKey: "phoneNumber5") as? String
                }
                
                if email1Public != nil {
                    email1Public = user.value(forKey: "email1") as? String
                }
                if email2Public != nil {
                    email2Public = user.value(forKey: "email2") as? String
                }
                if email3Public != nil {
                    email3Public = user.value(forKey: "email3") as? String
                }
                if email4Public != nil {
                    email4Public = user.value(forKey: "email4") as? String
                }
                if email5Public != nil {
                    email5Public = user.value(forKey: "email5") as? String
                }
                
                
                if url1Public != nil {
                    url1Public = user.value(forKey: "url1") as? String
                }
                if url2Public != nil {
                    url2Public = user.value(forKey: "url2") as? String
                }
                if url3Public != nil {
                    url3Public = user.value(forKey: "url3") as? String
                }
                if url4Public != nil {
                    url4Public = user.value(forKey: "url4") as? String
                }
                if url5Public != nil {
                    url5Public = user.value(forKey: "url5") as? String
                }
                
                if street1Public != nil {
                    street1Public = user.value(forKey: "street1") as? String
                }
                
                if state1Public != nil {
                    state1Public = user.value(forKey: "state1") as? String
                }
                
                if city1Public != nil {
                    city1Public = user.value(forKey: "city1") as? String
                }
                
                if postalCode1Public != nil {
                    postalCode1Public = user.value(forKey: "postalCode1") as? String
                }
                
                if country1Public != nil {
                    country1Public = user.value(forKey: "country1") as? String
                }
                
                if street2Public != nil {
                    street2Public = user.value(forKey: "street2") as? String
                }
                
                if state2Public != nil {
                    state2Public = user.value(forKey: "state2") as? String
                }
                
                if city2Public != nil {
                    city2Public = user.value(forKey: "city2") as? String
                }
                
                if postalCode2Public != nil {
                    postalCode2Public = user.value(forKey: "postalCode2") as? String
                }
                
                if country2Public != nil {
                    country2Public = user.value(forKey: "country2") as? String
                }
                
                if street3Public != nil {
                    street3Public = user.value(forKey: "street3") as? String
                }
                
                if state3Public != nil {
                    state3Public = user.value(forKey: "state3") as? String
                }
                
                if city3Public != nil {
                    city3Public = user.value(forKey: "city3") as? String
                }
                
                if postalCode3Public != nil {
                    postalCode3Public = user.value(forKey: "postalCode3") as? String
                }
                
                if country3Public != nil {
                    country3Public = user.value(forKey: "country3") as? String
                }
                
                if birthdayPublic != nil {
                    birthdayPublic = user.value(forKey: "birthday") as? String
                }
                
                if socialProfile1Public != nil {
                    socialProfile1Public = user.value(forKey: "socialProfile1") as? String
                }
                if socialProfile2Public != nil {
                    socialProfile2Public = user.value(forKey: "socialProfile2") as? String
                }
                if socialProfile3Public != nil {
                    socialProfile3Public = user.value(forKey: "socialProfile3") as? String
                }
                if socialProfile4Public != nil {
                    socialProfile4Public = user.value(forKey: "socialProfile4") as? String
                }
                if socialProfile5Public != nil {
                    socialProfile5Public = user.value(forKey: "socialProfile5") as? String
                }
                
                
                if instantMessage1Public != nil {
                    instantMessage1Public = user.value(forKey: "account1") as? String
                }
                if instantMessage2Public != nil {
                    instantMessage2Public = user.value(forKey: "account2") as? String
                }
                if instantMessage3Public != nil {
                    instantMessage3Public = user.value(forKey: "account3") as? String
                }
                if instantMessage4Public != nil {
                    instantMessage4Public = user.value(forKey: "account4") as? String
                }
                if instantMessage5Public != nil {
                    instantMessage5Public = user.value(forKey: "account5") as? String
                }
                
                if relatives1Public != nil {
                    relatives1Public = user.value(forKey: "relatives1") as? String
                }
                if relatives2Public != nil {
                    relatives2Public = user.value(forKey: "relatives2") as? String
                }
                if relatives3Public != nil {
                    relatives3Public = user.value(forKey: "relatives3") as? String
                }
                if relatives4Public != nil {
                    relatives4Public = user.value(forKey: "relatives4") as? String
                }
                if relatives5Public != nil {
                    relatives5Public = user.value(forKey: "relatives5") as? String
                }
                
                
                if notesPublic != nil {
                    notesPublic = user.value(forKey: "notes") as? String
                }
            }
        } catch {
            print("Error with request: \(error)")
        }
    }
    func getUsersID () {
        
        let fetchRequest: NSFetchRequest<ID> = ID.fetchRequest()
        
        do {
            
            let array_users = try getContext().fetch(fetchRequest)
            
            for user in array_users as [NSManagedObject] {
                
                id = user.value(forKey: "id") as? String ?? ""
                
            }
        } catch {
            print("Error with request: \(error)")
        }
    }

}

