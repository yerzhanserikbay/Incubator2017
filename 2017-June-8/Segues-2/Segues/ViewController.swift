 //
//  ViewController.swift
//  Segues
//
//  Created by Galym Kulyn on 08.06.17.
//  Copyright © 2017 galymco. All rights reserved.
//

import UIKit

protocol Communicatable {
    func get(message: String?, image: UIImage?)
}

class ViewController: UIViewController, Communicatable {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func goToNextController(_ sender: Any) {
        performSegue(withIdentifier: "destinationSegue", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "destinationSegue" {
            let vc = segue.destination as! DestinationViewController
            vc.message = textField.text
            vc.image = imageView.image
            vc.delegate = self
        }
    }

    func get(message: String?, image: UIImage?) {
        textField.text = message
        imageView.image = image
    }
}
