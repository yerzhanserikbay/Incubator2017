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
    var delegate: Communicatable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = "Apple"
        imageView.image = #imageLiteral(resourceName: "apple")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        delegate?.get(message: messageLabel.text, image: imageView.image)
    }
   
    @IBAction func goBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        performSegue(withIdentifier: "thirdSegue", sender: self)
    }
}
