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

class MyCodeViewController: UIViewController, NVActivityIndicatorViewable {
    
    var qrcodeText: UITextView!
    var firstName: String = ""
    var lastName: String = ""
    var company: String = ""
    var phoneNumber: String = ""
    var email: String = ""
    var url: String = ""
    var address: String = ""
    var birthday: String = ""
    var socialProfile: String = ""
    var instantMessage: String = ""
    var relatives: String = ""
    var notes: String = ""
    
    var firstNamePublic: String = ""
    var lastNamePublic: String = ""
    var companyPublic: String = ""
    var phoneNumberPublic: String = ""
    var emailPublic: String = ""
    var urlPublic: String = ""
    var addressPublic: String = ""
    var birthdayPublic: String = ""
    var socialProfilePublic: String = ""
    var instantMessagePublic: String = ""
    var relativesPublic: String = ""
    var notesPublic: String = ""
    
    var firstNameSocial: String = ""
    var lastNameSocial: String = ""
    var companySocial: String = ""
    var phoneNumberSocial: String = ""
    var emailSocial: String = ""
    var urlSocial: String = ""
    var addressSocial: String = ""
    var birthdaySocial: String = ""
    var socialProfileSocial: String = ""
    var instantMessageSocial: String = ""
    var relativesSocial: String = ""
    var notesSocial: String = ""
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var imgqrCode: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentedControl.selectedSegmentIndex = 0
        privateProfileData()
        publicProfileData()
        socialProfileData()
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
    
    func privateProfileData() {
            self.startAnimating()
            User.fetchUser { (user, error) in
                if error == nil {
                    guard let user = user else { return }
                    
                    if let number = user.phoneNumber {
                        self.phoneNumber = number
                    }
                    
                    if let firstName = user.firstName {
                        self.firstName = firstName
                    }
                    
                    if let lastName = user.lastName {
                        self.lastName = lastName
                    }
                    
                    if let company = user.company {
                        self.company = company
                    }
                    
                    if let email = user.email {
                        self.email = email
                    }
                    
                    if let url = user.url {
                        self.url = url
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
                    }
                    
                    if let instantMessage = user.instantMessage {
                        self.instantMessage = instantMessage
                    }
                    
                    if let relatives = user.relatives {
                        self.relatives = relatives
                    }
                    
                    if let notes = user.notes {
                        self.notes = notes
                    }
                    var qrCodePrivate = QRCode("\(self.firstName) \(self.lastName) \(self.company) \(self.phoneNumber) \(self.email) \(self.url) \(self.socialProfile) \(self.instantMessage) \(self.relatives) \(self.notes)")
                    qrCodePrivate?.size = self.imgqrCode.bounds.size
                    qrCodePrivate?.errorCorrection = .High
                    qrCodePrivate?.size = CGSize(width: 297, height: 297)
                    self.imgqrCode.image = qrCodePrivate?.image
                    self.stopAnimating()
            }
        }
    }
    func genCodePrivate() {
        var qrCodePrivate = QRCode("\(firstName) \(lastName) \(company) \(phoneNumber) \(email) \(url) \(socialProfile) \(instantMessage) \(relatives) \(notes)")
        qrCodePrivate?.size = self.imgqrCode.bounds.size
        qrCodePrivate?.errorCorrection = .High
        qrCodePrivate?.size = CGSize(width: 297, height: 297)
        imgqrCode.image = qrCodePrivate?.image
    }
    func publicProfileData() {
        self.startAnimating()
        UserPublic.fetchUser { (user, error) in
            if error == nil {
                guard let user = user else { return }
                
                if let number = user.phoneNumber {
                    self.phoneNumberPublic = number
                }
                
                if let firstName = user.firstName {
                    self.firstNamePublic = firstName
                }
                
                if let lastName = user.lastName {
                    self.lastNamePublic = lastName
                }
                
                if let company = user.company {
                    self.companyPublic = company
                }
                
                if let email = user.email {
                    self.emailPublic = email
                }
                
                if let url = user.url {
                    self.urlPublic = url
                }
                
                //     if let address = user.address {
                //       self.addressPublic = address
                // }
                //     if let birthday = user.birthday {
                //       self.birthdayPublic = birthday
                // }
                
                if let socialProfile = user.socialProfile {
                    self.socialProfilePublic = socialProfile
                }
                
                if let instantMessage = user.instantMessage {
                    self.instantMessagePublic = instantMessage
                }
                
                if let relatives = user.relatives {
                    self.relativesPublic = relatives
                }
                
                if let notes = user.notes {
                    self.notesPublic = notes
                }
                
                var qrCodePublic = QRCode("\(self.firstNamePublic) \(self.lastNamePublic) \(self.companyPublic) \(self.phoneNumberPublic) \(self.emailPublic) \(self.urlPublic) \(self.socialProfilePublic) \(self.instantMessagePublic) \(self.relativesPublic) \(self.notesPublic)")
                qrCodePublic?.size = self.imgqrCode.bounds.size
                qrCodePublic?.errorCorrection = .High
                qrCodePublic?.size = CGSize(width: 297, height: 297)
                self.imgqrCode.image = qrCodePublic?.image
                self.startAnimating()
            }
        }
    }
    func genCodePublic() {
        var qrCodePublic = QRCode("\(self.firstNamePublic) \(self.lastNamePublic) \(self.companyPublic) \(self.phoneNumberPublic) \(self.emailPublic) \(self.urlPublic) \(self.socialProfilePublic) \(self.instantMessagePublic) \(self.relativesPublic) \(self.notesPublic)")
        qrCodePublic?.size = self.imgqrCode.bounds.size
        qrCodePublic?.errorCorrection = .High
        qrCodePublic?.size = CGSize(width: 297, height: 297)
        self.imgqrCode.image = qrCodePublic?.image
    }
    func socialProfileData() {
        self.startAnimating()
        UserSocial.fetchUser { (user, error) in
            if error == nil {
                guard let user = user else { return }
                
                if let number = user.phoneNumber {
                    self.phoneNumberSocial = number
                }
                
                if let firstName = user.firstName {
                    self.firstNameSocial = firstName
                }
                
                if let lastName = user.lastName {
                    self.lastNameSocial = lastName
                }
                
                if let company = user.company {
                    self.companySocial = company
                }
                
                if let email = user.email {
                    self.emailSocial = email
                }
                
                if let url = user.url {
                    self.urlSocial = url
                }
                
                //     if let address = user.address {
                //       self.addressSocial = address
                // }
                //     if let birthday = user.birthday {
                //       self.birthdaySocial = birthday
                // }
                
                if let socialProfile = user.socialProfile {
                    self.socialProfileSocial = socialProfile
                }
                
                if let instantMessage = user.instantMessage {
                    self.instantMessageSocial = instantMessage
                }
                
                if let relatives = user.relatives {
                    self.relativesSocial = relatives
                }
                
                if let notes = user.notes {
                    self.notesSocial = notes
                }
                var qrCodeSocial = QRCode("\(self.firstNameSocial) \(self.lastNameSocial) \(self.companySocial) \(self.phoneNumberSocial) \(self.emailSocial) \(self.urlSocial) \(self.socialProfileSocial) \(self.instantMessageSocial) \(self.relativesSocial) \(self.notesSocial)")
                qrCodeSocial?.size = self.imgqrCode.bounds.size
                qrCodeSocial?.errorCorrection = .High
                qrCodeSocial?.size = CGSize(width: 297, height: 297)
                self.imgqrCode.image = qrCodeSocial?.image
                self.stopAnimating()
            }
        }
    }
    func genCodeSocial() {
        var qrCodeSocial = QRCode("\(self.firstNameSocial) \(self.lastNameSocial) \(self.companySocial) \(self.phoneNumberSocial) \(self.emailSocial) \(self.urlSocial) \(self.socialProfileSocial) \(self.instantMessageSocial) \(self.relativesSocial) \(self.notesSocial)")
        qrCodeSocial?.size = self.imgqrCode.bounds.size
        qrCodeSocial?.errorCorrection = .High
        qrCodeSocial?.size = CGSize(width: 297, height: 297)
        self.imgqrCode.image = qrCodeSocial?.image
    }
}
//    func animation() {
//        let frame = CGRect(x: 23, y: 120, width: 330, height: 330)
//        
//        let activityIndicatorView = NVActivityIndicatorView(frame: frame,
//                                                            type: NVActivityIndicatorType(rawValue: 27)!)
//        
//        activityIndicatorView.color = UIColor(red: CGFloat(0 / 255.0), green: CGFloat(122 / 255.0), blue: CGFloat(255 / 255.0), alpha: 100)
//        
//        let animationTypeLabel = UILabel(frame: frame)
//        
//        activityIndicatorView.padding = 20
//        if 27 == NVActivityIndicatorType.orbit.rawValue {
//            activityIndicatorView.padding = 0
//        }
//        self.view.addSubview(activityIndicatorView)
//        self.view.addSubview(animationTypeLabel)
//        activityIndicatorView.startAnimating()
//    }

