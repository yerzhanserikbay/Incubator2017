//
//  ScanCodeViewController.swift
//  Share Contact by QR code
//
//  Created by YERZHAN SERIKBAY on 7/10/17.
//  Copyright © 2017 YERZHAN SERIKBAY. All rights reserved.
//

import UIKit
import AVFoundation
import Contacts
import ContactsUI
import AudioToolbox


class ScanCodeViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    var timer = 0
    
    var captureSession: AVCaptureSession?
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    var qrCodeFrameView: UIView?
    
    var firstName: String?
    var lastName: String?
    var company: String?
    
    var phoneNumber1: String?
    var phoneNumber2: String?
    var phoneNumber3: String?
    var phoneNumber4: String?
    var phoneNumber5: String?
    
    
    var email1: String?
    var email2: String?
    var email3: String?
    var email4: String?
    var email5: String?
    
    var url1: String?
    var url2: String?
    var url3: String?
    var url4: String?
    var url5: String?
    
    var street1: String?
    var state1: String?
    var city1: String?
    var country1: String?
    var postalCode1: String?
    
    var street2: String?
    var state2: String?
    var city2: String?
    var country2: String?
    var postalCode2: String?
    
    var street3: String?
    var state3: String?
    var city3: String?
    var country3: String?
    var postalCode3: String?
    
    var birthday: String?
    
    var socialProfile1: String?
    var socialProfile2: String?
    var socialProfile3: String?
    var socialProfile4: String?
    var socialProfile5: String?
    
    var instantMessage1: String?
    var instantMessage2: String?
    var instantMessage3: String?
    var instantMessage4: String?
    var instantMessage5: String?
    
    var relatives1: String?
    var relatives2: String?
    var relatives3: String?
    var relatives4: String?
    var relatives5: String?
    
    var notes: String?
    
    
    var is3DTouchAvailable: Bool {
        return view.traitCollection.forceTouchCapability == .available
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = UIColor(red: 35/255, green: 31/255, blue: 32/255, alpha: 1.0)
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        
     //   tabBarController?.tabBar.barTintColor = UIColor(red: 35/255, green: 31/255, blue: 32/255, alpha: 1.0)
        
        
        let cornerRadius: CGFloat = 15
        let maskLayer = CAShapeLayer()
        
        maskLayer.path = UIBezierPath(
            roundedRect: view.bounds,
            byRoundingCorners: [.topLeft, .topRight],
            cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)
            ).cgPath
        
        tabBarController?.tabBar.layer.mask = maskLayer
        
        let icon = UIApplicationShortcutIcon(type: .capturePhoto)
        let firstItem = UIApplicationShortcutItem(type: "Share", localizedTitle: "Scan", localizedSubtitle: "", icon: icon, userInfo: nil)
        UIApplication.shared.shortcutItems = [firstItem]
        capture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        timer = 0
        tabBarController?.tabBar.tintColor = UIColor(red: 187/255, green: 68/255, blue: 48/255, alpha: 1.0)
        print("hello")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        timer = 1
    }
    
    func capture() {
        let captureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice)
            captureSession = AVCaptureSession()
            captureSession?.addInput(input)
            
            let captureMetadataOutput = AVCaptureMetadataOutput()
            captureSession?.addOutput(captureMetadataOutput)
            captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            captureMetadataOutput.metadataObjectTypes = [AVMetadataObjectTypeQRCode]
            
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            videoPreviewLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
            videoPreviewLayer?.frame = view.layer.bounds
            view.layer.addSublayer(videoPreviewLayer!)
            
            captureSession?.startRunning()
            
            qrCodeFrameView = UIView()
            
            if let qrCodeFrameView = qrCodeFrameView {
                qrCodeFrameView.layer.borderColor = UIColor.blue.cgColor
                qrCodeFrameView.layer.borderWidth = 2
                view.addSubview(qrCodeFrameView)
                view.bringSubview(toFront: qrCodeFrameView)
            }
            
        } catch {
            print(error)
            return
        }
    }
    
    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
        
        if metadataObjects == nil || metadataObjects.count == 0 {
            qrCodeFrameView?.frame = CGRect.zero
            return
        }
        
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        
        if metadataObj.type == AVMetadataObjectTypeQRCode {
            
            let barCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObj)
            if barCodeObject?.bounds != nil {
                qrCodeFrameView?.frame = barCodeObject!.bounds
            }
            
            if metadataObj.stringValue != nil {
                
                if timer == 0 {
                    
                    let dataBase = metadataObj.stringValue
                    let dataBaseArr = dataBase?.components(separatedBy: "*")
                    print(dataBase!)
                    
                    if dataBaseArr?[0] !=  nil {
                        firstName = dataBaseArr![0]
                    }
                    
                    if dataBaseArr?[1] != nil {
                        lastName = dataBaseArr![1]
                    }
                    
                    if dataBaseArr?[2] != nil {
                        company = dataBaseArr![2]
                    }
                    
                    if dataBaseArr?[3] != nil {
                        phoneNumber1 = dataBaseArr![3]
                    }
                    
                    if dataBaseArr?[4] != nil {
                        phoneNumber2 = dataBaseArr![4]
                    }
                    
                    if dataBaseArr?[5] != nil {
                        phoneNumber3 = dataBaseArr![5]
                    }
                    
                    if dataBaseArr?[6] != nil {
                        phoneNumber4 = dataBaseArr![6]
                    }
                    
                    if dataBaseArr?[7] != nil {
                        phoneNumber5 = dataBaseArr![7]
                    }
                    
                    if dataBaseArr?[8] != nil {
                        email1 = dataBaseArr![8]
                    }
                    
                    if dataBaseArr?[9] != nil {
                        email2 = dataBaseArr![9]
                    }
                    
                    if dataBaseArr?[10] != nil {
                        email3 = dataBaseArr![10]
                    }
                    
                    if dataBaseArr?[11] != nil {
                        email4 = dataBaseArr![11]
                    }
                    
                    if dataBaseArr?[12] != nil {
                        email5 = dataBaseArr![12]
                    }
                    
                    if dataBaseArr?[13] != nil {
                        url1 = dataBaseArr![13]
                    }
                    
                    if dataBaseArr?[14] != nil {
                        url2 = dataBaseArr![14]
                    }
                    
                    if dataBaseArr?[15] != nil {
                        url3 = dataBaseArr![15]
                    }
                    
                    if dataBaseArr?[16] != nil {
                        url4 = dataBaseArr![16]
                    }
                    
                    if dataBaseArr?[17] != nil {
                        url5 = dataBaseArr![17]
                    }
                    
                    if dataBaseArr?[18] != nil {
                        street1 = dataBaseArr![18]
                    }
                    
                    if dataBaseArr?[19] != nil {
                        street2 = dataBaseArr![19]
                    }
                    
                    if dataBaseArr?[20] != nil {
                        street3 = dataBaseArr![20]
                    }
                    
                    if dataBaseArr?[21] != nil {
                        state1 = dataBaseArr![21]
                    }
                    
                    if dataBaseArr?[22] != nil {
                        state2 = dataBaseArr![22]
                    }
                    
                    if dataBaseArr?[23] != nil {
                        state3 = dataBaseArr![23]
                    }
                    
                    if dataBaseArr?[24] != nil {
                        city1 = dataBaseArr![24]
                    }
                    
                    if dataBaseArr?[25] != nil {
                        city2 = dataBaseArr![25]
                    }
                    
                    if dataBaseArr?[26] != nil {
                        city3 = dataBaseArr![26]
                    }
                    
                    if dataBaseArr?[27] != nil {
                        country1 = dataBaseArr![27]
                    }
                    
                    if dataBaseArr?[28] != nil {
                        country2 = dataBaseArr![28]
                    }
                    
                    if dataBaseArr?[29] != nil {
                        country3 = dataBaseArr![29]
                    }
                    
                    if dataBaseArr?[30] != nil {
                        postalCode1 = dataBaseArr![30]
                    }
                    
                    if dataBaseArr?[31] != nil {
                        postalCode2 = dataBaseArr![31]
                    }
                    
                    if dataBaseArr?[32] != nil {
                        postalCode3 = dataBaseArr![32]
                    }
                    
                    if dataBaseArr?[33] != nil {
                        birthday = dataBaseArr![33]
                    }
                    
                    if dataBaseArr?[34] != nil {
                        socialProfile1 = dataBaseArr![34]
                    }
                    
                    if dataBaseArr?[35] != nil {
                        socialProfile2 = dataBaseArr![35]
                    }
                    
                    if dataBaseArr?[36] != nil {
                        socialProfile3 = dataBaseArr![36]
                    }
                    
                    if dataBaseArr?[37] != nil {
                        socialProfile4 = dataBaseArr![37]
                    }
                    
                    if dataBaseArr?[38] != nil {
                        socialProfile5 = dataBaseArr![38]
                    }
                    
                    if dataBaseArr?[39] != nil {
                        instantMessage1 = dataBaseArr![39]
                    }
                    
                    if dataBaseArr?[40] != nil {
                        instantMessage2 = dataBaseArr![40]
                    }
                    
                    if dataBaseArr?[41] != nil {
                        instantMessage3 = dataBaseArr![41]
                    }
                    
                    if dataBaseArr?[42] != nil {
                        instantMessage4 = dataBaseArr![42]
                    }
                    
                    if dataBaseArr?[43] != nil {
                        instantMessage5 = dataBaseArr![43]
                    }
                    
                    if dataBaseArr?[44] != nil {
                        relatives1 = dataBaseArr![44]
                    }
                    
                    if dataBaseArr?[45] != nil {
                        relatives2 = dataBaseArr![45]
                    }
                    
                    if dataBaseArr?[46] != nil {
                        relatives3 = dataBaseArr![46]
                    }
                    
                    if dataBaseArr?[47] != nil {
                        relatives4 = dataBaseArr![47]
                    }
                    
                    if dataBaseArr?[48] != nil {
                        relatives5 = dataBaseArr![48]
                    }
                    
                    if dataBaseArr?[49] != nil {
                        notes = dataBaseArr![49]
                    }
                    AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
                    createNewContact()
                    timer = 1
                }
            }
        }
    }
    
    
    func createNewContact() {
        captureSession?.stopRunning()
        let newContact = CNMutableContact()
        newContact.givenName = "\(String(describing: firstName!))"
        newContact.familyName = "\(String(describing: lastName!))"
        newContact.organizationName = "\(String(describing: company!))"
        
        if phoneNumber1 != "" {
            newContact.phoneNumbers = [CNLabeledValue(
                label:CNLabelPhoneNumberiPhone,
                value:CNPhoneNumber(stringValue:"\(String(describing: phoneNumber1!))"))]
        }
        
        if phoneNumber2 != "" {
            newContact.phoneNumbers.append(CNLabeledValue(
                label:CNLabelPhoneNumberiPhone,
                value:CNPhoneNumber(stringValue:"\(String(describing: phoneNumber2!))")))
        }
        
        if phoneNumber3 != "" {
            newContact.phoneNumbers.append(CNLabeledValue(
                label:CNLabelPhoneNumberiPhone,
                value:CNPhoneNumber(stringValue:"\(String(describing: phoneNumber3!))")))
        }
        
        if phoneNumber4 != "" {
            newContact.phoneNumbers.append(CNLabeledValue(
                label:CNLabelPhoneNumberiPhone,
                value:CNPhoneNumber(stringValue:"\(String(describing: phoneNumber4!))")))
        }
        
        if phoneNumber5 != "" {
            newContact.phoneNumbers.append(CNLabeledValue(
                label:CNLabelPhoneNumberiPhone,
                value:CNPhoneNumber(stringValue:"\(String(describing: phoneNumber5!))")))
        }
        
        if email1 != "" {
            let workEmailEntry: String = "\(String(describing: email1!))"
            let workEmail = CNLabeledValue(label: CNLabelWork, value: workEmailEntry as NSString)
            newContact.emailAddresses = [workEmail]
        }
        
        if email2 != "" {
            let workEmailEntry: String = "\(String(describing: email2!))"
            let workEmail = CNLabeledValue(label: CNLabelWork, value: workEmailEntry as NSString)
            newContact.emailAddresses.append(workEmail)
        }
        
        if email3 != "" {
            let workEmailEntry: String = "\(String(describing: email3!))"
            let workEmail = CNLabeledValue(label: CNLabelWork, value: workEmailEntry as NSString)
            newContact.emailAddresses.append(workEmail)
        }
        
        if email4 != "" {
            let workEmailEntry: String = "\(String(describing: email4!))"
            let workEmail = CNLabeledValue(label: CNLabelWork, value: workEmailEntry as NSString)
            newContact.emailAddresses.append(workEmail)
        }
        
        if email5 != "" {
            let workEmailEntry: String = "\(String(describing: email5!))"
            let workEmail = CNLabeledValue(label: CNLabelWork, value: workEmailEntry as NSString)
            newContact.emailAddresses.append(workEmail)
        }
        
        
        if url1 != "" {
            let urlEntry: String = "\(String(describing: self.url1!))"
            let url = CNLabeledValue(label: CNLabelWork, value: urlEntry as NSString)
            newContact.urlAddresses = [url]
        }
        
        if url2 != "" {
            let urlEntry: String = "\(String(describing: self.url2!))"
            let url = CNLabeledValue(label: CNLabelWork, value: urlEntry as NSString)
            newContact.urlAddresses.append(url)
        }
        
        if url3 != "" {
            let urlEntry: String = "\(String(describing: self.url3!))"
            let url = CNLabeledValue(label: CNLabelWork, value: urlEntry as NSString)
            newContact.urlAddresses.append(url)
        }
        
        if url4 != "" {
            let urlEntry: String = "\(String(describing: self.url4!))"
            let url = CNLabeledValue(label: CNLabelWork, value: urlEntry as NSString)
            newContact.urlAddresses.append(url)
        }
        
        if url5 != "" {
            let urlEntry: String = "\(String(describing: self.url5!))"
            let url = CNLabeledValue(label: CNLabelWork, value: urlEntry as NSString)
            newContact.urlAddresses.append(url)
        }
        
        
        
        
        if street1 != "" {
            let homeAddress = CNMutablePostalAddress()
            homeAddress.street = "\(street1!)"
            homeAddress.city = "\(city1!)"
            homeAddress.state = "\(state1!)"
            homeAddress.postalCode = "\(postalCode1!)"
            newContact.postalAddresses = [CNLabeledValue(label:CNLabelHome, value:homeAddress)]
        }
        
        if street2 != "" {
            let homeAddress = CNMutablePostalAddress()
            homeAddress.street = "\(street2!)"
            homeAddress.city = "\(city2!)"
            homeAddress.state = "\(state2!)"
            homeAddress.postalCode = "\(postalCode2!)"
            newContact.postalAddresses.append(CNLabeledValue(label:CNLabelHome, value:homeAddress))
        }
        
        if street3 != "" {
            let homeAddress = CNMutablePostalAddress()
            homeAddress.street = "\(street3!)"
            homeAddress.city = "\(city3!)"
            homeAddress.state = "\(state3!)"
            homeAddress.postalCode = "\(postalCode3!)"
            newContact.postalAddresses.append(CNLabeledValue(label:CNLabelHome, value:homeAddress))
        }
        
        
        
        if birthday != "" {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMMM dd,yyyy" //Your date format
            dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0:00") //Current time zone
            let date = dateFormatter.date(from: birthday!) //according to date format your date string
            
            let dateThree = date
            let calendar = Calendar.current
            
            let day = calendar.component(.day, from: dateThree!)
            let month = calendar.component(.month, from: dateThree!)
            let year = calendar.component(.year, from: dateThree!)
            
            let myBirthday = NSDateComponents()
            myBirthday.day = day
            myBirthday.month = month
            myBirthday.year = year
            newContact.birthday = myBirthday as DateComponents
        }
        
        if socialProfile1 != "&" {
            let profileArr = socialProfile1?.components(separatedBy: "&")
            
            let socialProfile = CNLabeledValue(label: "", value: CNSocialProfile(urlString: "", username: "\(profileArr?[1] ?? "none")", userIdentifier: "something", service: "\(profileArr?[0] ?? "none")" ))
            newContact.socialProfiles = [socialProfile]
            
        }
        
        if socialProfile2 != "&" {
            let profileArr = socialProfile2?.components(separatedBy: "&")
            let socialProfile = CNLabeledValue(label: "", value: CNSocialProfile(urlString: "", username: "\(profileArr?[1] ?? "none")", userIdentifier: "something", service: "\(profileArr?[0] ?? "none")"))
            newContact.socialProfiles.append(socialProfile)
        }
        
        if socialProfile3 != "&" {
            let profileArr = socialProfile3?.components(separatedBy: "&")
            let socialProfile = CNLabeledValue(label: "", value: CNSocialProfile(urlString: "", username: "\(profileArr?[1] ?? "none")", userIdentifier: "something", service: "\(profileArr?[0] ?? "none")"))
            newContact.socialProfiles.append(socialProfile)
        }
        
        if socialProfile4 != "&" {
            let profileArr = socialProfile4?.components(separatedBy: "&")
            let socialProfile = CNLabeledValue(label: "", value: CNSocialProfile(urlString: "", username: "\(profileArr?[1] ?? "none")", userIdentifier: "something", service: "\(profileArr?[0] ?? "none")"))
            newContact.socialProfiles.append(socialProfile)
        }
        
        if socialProfile5 != "&" {
            let profileArr = socialProfile5?.components(separatedBy: "&")
            let socialProfile = CNLabeledValue(label: "", value: CNSocialProfile(urlString: "", username: "\(profileArr?[1] ?? "none")", userIdentifier: "something", service: "\(profileArr?[0] ?? "none")"))
            newContact.socialProfiles.append(socialProfile)
        }
        
        
        
        
        if instantMessage1 != "&" {
            let accountArr = instantMessage1?.components(separatedBy: "&")
            let account = CNLabeledValue(label: "", value: CNInstantMessageAddress(username: "\(accountArr?[1] ?? "")", service: "\(accountArr?[0] ?? "")"))
            newContact.instantMessageAddresses = [account]
        }
        
        if instantMessage2 != "&" {
            let accountArr = instantMessage2?.components(separatedBy: "&")
            let account = CNLabeledValue(label: "", value: CNInstantMessageAddress(username: "\(accountArr?[1] ?? "")", service: "\(accountArr?[0] ?? "")"))
            newContact.instantMessageAddresses.append(account)
        }
        
        if instantMessage3 != "&" {
            let accountArr = instantMessage3?.components(separatedBy: "&")
            let account = CNLabeledValue(label: "", value: CNInstantMessageAddress(username: "\(accountArr?[1] ?? "")", service: "\(accountArr?[0] ?? "")"))
            newContact.instantMessageAddresses.append(account)
        }
        
        if instantMessage4 != "&" {
            let accountArr = instantMessage4?.components(separatedBy: "&")
            let account = CNLabeledValue(label: "", value: CNInstantMessageAddress(username: "\(accountArr?[1] ?? "")", service: "\(accountArr?[0] ?? "")"))
            newContact.instantMessageAddresses.append(account)
        }
        
        if instantMessage5 != "&" {
            let accountArr = instantMessage5?.components(separatedBy: "&")
            let account = CNLabeledValue(label: "", value: CNInstantMessageAddress(username: "\(accountArr?[1] ?? "")", service: "\(accountArr?[0] ?? "")"))
            newContact.instantMessageAddresses.append(account)
        }
        
        
        
        if relatives1 != "&" {
            let familyArr = relatives1?.components(separatedBy: "&")
            let contactRelation = CNContactRelation(name: "\(familyArr?[1] ?? "")")
            let member = CNLabeledValue(label: "\(familyArr?[0] ?? "")", value: contactRelation)
            newContact.contactRelations = [member]
        }
        
        if relatives2 != "&" {
            let familyArr = relatives2?.components(separatedBy: "&")
            let contactRelation = CNContactRelation(name: "\(familyArr?[1] ?? "")")
            let member = CNLabeledValue(label: "\(familyArr?[0] ?? "")", value: contactRelation)
            newContact.contactRelations.append(member)
        }
        
        if relatives3 != "&" {
            let familyArr = relatives3?.components(separatedBy: "&")
            let contactRelation = CNContactRelation(name: "\(familyArr?[1] ?? "")")
            let member = CNLabeledValue(label: "\(familyArr?[0] ?? "")", value: contactRelation)
            newContact.contactRelations.append(member)
        }
        
        if relatives4 != "&" {
            let familyArr = relatives4?.components(separatedBy: "&")
            let contactRelation = CNContactRelation(name: "\(familyArr?[1] ?? "")")
            let member = CNLabeledValue(label: "\(familyArr?[0] ?? "")", value: contactRelation)
            newContact.contactRelations.append(member)
        }
        
        if relatives5 != "&" {
            let familyArr = relatives5?.components(separatedBy: "&")
            let contactRelation = CNContactRelation(name: "\(familyArr?[1] ?? "")")
            let member = CNLabeledValue(label: "\(familyArr?[0] ?? "")", value: contactRelation)
            newContact.contactRelations.append(member)
        }
        
        
        
        
        newContact.note = "\(String(describing: notes!))"
        
        let store = CNContactStore()
        
        let controller = CNContactViewController(forNewContact: newContact)
        controller.contactStore = store
        controller.delegate = self
    
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController!.pushViewController(controller, animated: true)
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 35/255, green: 31/255, blue: 32/255, alpha: 1.0)
        self.tabBarController?.tabBar.isHidden = true
        hideStatusBar(status: true)
        
        
    }
    
    func hideStatusBar( status: Bool) -> () {
        if status == true {
            UIApplication.shared.isStatusBarHidden = true
        } else {
            return UIApplication.shared.isStatusBarHidden = false
        }
    }
    
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        captureSession?.stopRunning()
    }
}

extension ScanCodeViewController: CNContactViewControllerDelegate{
    func contactViewController(_ viewController: CNContactViewController, didCompleteWith contact: CNContact?) {
        self.navigationController?.popViewController(animated: true)
        self.tabBarController?.tabBar.isHidden = false
        capture()
        timer = 0
        hideStatusBar(status: false)
    }
    
    func contactViewController(_ viewController: CNContactViewController, shouldPerformDefaultActionFor property: CNContactProperty) -> Bool {
        return true
    }
}


