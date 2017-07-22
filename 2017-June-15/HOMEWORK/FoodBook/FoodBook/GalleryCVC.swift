//
//  GalleryCVC.swift
//  FoodBook
//
//  Created by YERZHAN SERIKBAY on 6/19/17.
//  Copyright © 2017 YERZHAN SERIKBAY. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class GalleryCVC: UICollectionViewController {
    var allPhotos: [String]!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        allPhotos = ["5760","5772","5799","5847","5935","5951","6231","6241","6242","6244","6268","6286","6288","6290","6335","6352","6392","6424","6434","6436","6438","6458","6462","6465","6499","6534","6593","6621","6939"]
        
        self.title = "My Gallery"

    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return allPhotos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MyCell
    
        let imageName = allPhotos[indexPath.item]
        cell.imageView.image = UIImage(named: imageName)
    
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goPhoto"
        {
            let cell: MyCell = sender as! MyCell
            let image = cell.imageView.image
            let previewVC: PreviewVC = segue.destination as! PreviewVC
            previewVC.currentPhoto = image
        }
    }

}
