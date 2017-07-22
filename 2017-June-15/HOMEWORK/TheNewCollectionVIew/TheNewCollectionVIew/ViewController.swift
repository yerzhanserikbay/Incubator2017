//
//  ViewController.swift
//  TheNewCollectionVIew
//
//  Created by YERZHAN SERIKBAY on 6/19/17.
//  Copyright © 2017 YERZHAN SERIKBAY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var imageViewPreview: UIImageView!
    
    var currentPhoto: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.imageViewPreview.image = currentPhoto
    }

}

