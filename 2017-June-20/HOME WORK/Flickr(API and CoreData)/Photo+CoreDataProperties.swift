//
//  Photo+CoreDataProperties.swift
//  Flickr(API and CoreData)
//
//  Created by YERZHAN SERIKBAY on 6/22/17.
//  Copyright © 2017 YERZHAN SERIKBAY. All rights reserved.
//

import Foundation
import CoreData


extension Photo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Photo> {
        return NSFetchRequest<Photo>(entityName: "Photo")
    }

    @NSManaged public var author: String?
    @NSManaged public var mediaURL: String?
    @NSManaged public var tags: String?

}
