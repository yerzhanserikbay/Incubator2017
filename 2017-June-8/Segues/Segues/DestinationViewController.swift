//
//  DestinationViewController.swift
//  Segues
//
//  Created by Galym Kulyn on 08.06.17.
//  Copyright © 2017 galymco. All rights reserved.
//

import UIKit

class DestinationViewController: UIViewController {
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    var message: String?
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = message
        imageView.image = image
    }

    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        performSegue(withIdentifier: "thirdSegue", sender: self)
    }
}
