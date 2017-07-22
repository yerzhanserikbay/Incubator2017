//
//  Book.swift
//  URLSessionApp
//
//  Created by Galym Kulyn on 20.06.2017.
//  Copyright © 2017 galymco. All rights reserved.
//

import Foundation

class Book {
    var title: String?
    var authors: [String]?
    var smallThumbnail: String?
    
    init(title: String?, authors: [String]?, thumbnail: String?) {
        self.title = title
        self.authors = authors
        self.smallThumbnail = thumbnail
    }
}
