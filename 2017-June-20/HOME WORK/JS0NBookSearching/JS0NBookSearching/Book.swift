//
//  Book.swift
//  JS0NBookSearching
//
//  Created by YERZHAN SERIKBAY on 6/20/17.
//  Copyright © 2017 YERZHAN SERIKBAY. All rights reserved.
//

import Foundation

class Book {
    var title: String?
    var authors: [String]?
    var smallThumbnail: String?
  
    
    init(title: String?, authors: [String]?, smallThumbnail: String?) {
        self.title = title
        self.authors = authors
        self.smallThumbnail = smallThumbnail
    }
}

//class MoreInfoBook {
//    var title: String?
//    var authors: [String]?
//    var smallThumbnail: String?
//    var page: String?
//    var year: String?
//    var source: String?
//    var price: String?
//    var currency: String?
//    
//    init(title: String?, authors: [String]?, smallThumbnail: String?, page: String?, year: String?, source: String?, price: String?, currency: String?) {
//        self.title = title
//        self.authors = authors
//        self.smallThumbnail = smallThumbnail
//        self.page = page
//        self.year = year
//        self.source = source
//        self.price = price
//        self.currency = currency
//    }
//
//}
