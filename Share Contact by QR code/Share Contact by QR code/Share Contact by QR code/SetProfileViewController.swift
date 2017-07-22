//
//  SetProfileViewController.swift
//  Share Contact by QR code
//
//  Created by YERZHAN SERIKBAY on 7/13/17.
//  Copyright © 2017 YERZHAN SERIKBAY. All rights reserved.
//

import UIKit
import EasyPeasy
import Eureka



class SetProfileViewController: FormViewController {

    
    var container: UIView = {
        var v = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 205 ))
        v.backgroundColor = UIColor(red: 251/255, green: 250/255, blue: 255/255, alpha: 1.0)
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        form +++ Section()
            form +++ Section()
                form +++ Section()
                    form +++ Section()
                        
        form +++ Section("Contact Numbers")
                        <<< PhoneRow() {
                            $0.title = "Phone Number"
                            $0.value = "+7 707 771 01 02"
                            $0.disabled = true
                        }
                        <<< PhoneRow() {
                            $0.title = "Home Number"
                            $0.value = "+7 7272 77 77 77"
                            $0.disabled = true
                        }
                        <<< PhoneRow() {
                            $0.title = "Work Number"
                            $0.value = "+7 7271 77 01 02"
                            $0.disabled = true
                        }
        
        form +++ Section("Social Media")
                        <<< URLRow() {
                            $0.title = "Vk.com"
                            $0.value = URL(string: "http://vk.com/yerzhanserikbay")
                            $0.disabled = true
                        }
                        <<< URLRow() {
                            $0.title = "Instagram.com"
                            $0.value = URL(string: "http://instagram.com/yerzhanserikbay")
                            $0.disabled = true
                        }
                        <<< URLRow() {
                            $0.title = "Facebook"
                            $0.value = URL(string: "http://facebook.com/yerzhanserikbay")
                            $0.disabled = true
                        }
                        <<< URLRow() {
                            $0.title = "Twitter"
                            $0.value = URL(string: "http://twitter.com/yerzhanserikbay")
                            $0.disabled = true
                        }
        
        
        
        
        
        self.view.backgroundColor = .white
        self.view.addSubview(self.container)
        
        
        let userImage = UIImageView(frame: CGRect(x: 145, y: 70, width: 86, height: 86))
        userImage.backgroundColor = .white
        userImage.layer.cornerRadius = 43
        userImage.clipsToBounds = true
        userImage.image = #imageLiteral(resourceName: "user.png") // 2. Photo
        self.container.addSubview(userImage)
        
        let userName = UILabel(frame: CGRect.zero)
        userName.text = "Serikbay Yerzhan" // 1. Name and Surname
        userName.textColor = .black
        userName.sizeToFit()
        userName.font = userName.font.withSize(28)
        self.container.addSubview(userName)

        userName <- [
            CenterX(0),
            Top(165)
        ]
    }
}

