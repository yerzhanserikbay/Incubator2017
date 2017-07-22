//
//  ViewController.swift
//  Segues
//
//  Created by Galym Kulyn on 08.06.17.
//  Copyright © 2017 galymco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = #imageLiteral(resourceName: "images")
    }
    
    @IBAction func goToNextController(_ sender: Any) {
        performSegue(withIdentifier: "destinationSegue", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "destinationSegue" {
            let vc = segue.destination as! DestinationViewController
            vc.message = textField.text
            vc.image = imageView.image
        }
    }

    
}
