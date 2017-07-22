//
//  ThirdViewController.swift
//  Segues
//
//  Created by Galym Kulyn on 08.06.17.
//  Copyright © 2017 galymco. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true, completion: nil)
    }
}
