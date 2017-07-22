//
//  PhotoCell.swift
//  Flickr(API and CoreData)
//
//  Created by YERZHAN SERIKBAY on 6/21/17.
//  Copyright © 2017 YERZHAN SERIKBAY. All rights reserved.
//

import UIKit


class PhotoCell: UITableViewCell {
    
    let photoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = .white
        iv.layer.masksToBounds = true
        return iv
    }()
    
    let authorLabel: UILabel = {
        let label = UILabel()
        //label.backgroundColor = UIColor.yellow
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let tagsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        //label.backgroundColor = UIColor.red
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dividerLiveView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        isUserInteractionEnabled = false
        
        addSubview(photoImageView)
        addSubview(authorLabel)
        addSubview(tagsLabel)
        addSubview(dividerLiveView)
        
        photoImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        photoImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        photoImageView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        photoImageView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        
        authorLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        authorLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -14).isActive = true
        authorLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 14).isActive = true
        authorLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor).isActive = true
        
        tagsLabel.heightAnchor.constraint(equalToConstant: 69).isActive = true
        tagsLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -14).isActive = true
        tagsLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 14).isActive = true
        tagsLabel.topAnchor.constraint(equalTo: dividerLiveView.bottomAnchor).isActive = true
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


