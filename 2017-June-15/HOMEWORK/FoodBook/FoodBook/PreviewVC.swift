//
//  PreviewVC.swift
//  FoodBook
//
//  Created by YERZHAN SERIKBAY on 6/19/17.
//  Copyright © 2017 YERZHAN SERIKBAY. All rights reserved.
//

import UIKit

class PreviewVC: UIViewController {
    
    @IBOutlet private weak var imageViewPreview: UIImageView!
    var currentPhoto: UIImage!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.imageViewPreview.image = currentPhoto
    }
}
