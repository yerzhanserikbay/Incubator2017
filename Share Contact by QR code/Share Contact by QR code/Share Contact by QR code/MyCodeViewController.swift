//
//  MyCodeViewController.swift
//  Share Contact by QR code
//
//  Created by YERZHAN SERIKBAY on 7/10/17.
//  Copyright © 2017 YERZHAN SERIKBAY. All rights reserved.
//

import UIKit

class MyCodeViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var QRCodeImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentedControl.selectedSegmentIndex = 0
        QRCodeImage.image = #imageLiteral(resourceName: "Private.png")
        
        
    }
    
    @IBAction func codeChanged(_ sender: Any) {
        
        switch segmentedControl.selectedSegmentIndex
        {
        case 0 :
            QRCodeImage.image = #imageLiteral(resourceName: "Private.png");
        case 1:
            QRCodeImage.image = #imageLiteral(resourceName: "Public.png");
            
        case 2:
            QRCodeImage.image = #imageLiteral(resourceName: "Social.png");
        default:
            break
        }
    }
    
}
