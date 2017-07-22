//
//  Feed.swift
//  AppleRate
//
//  Created by YERZHAN SERIKBAY on 6/28/17.
//  Copyright © 2017 YERZHAN SERIKBAY. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

enum Category: String {
    case musics = "http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/topsongs/limit=25/json"
    case albums = "http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/topalbums/limit=25/json"
    case apps = "http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/toppaidapplications/limit=25/json"
    case movies = "http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/topMovies/limit=25/json"
}

struct Feed {
    var id: String?
    var name: String?
    var imageLink: String?
    var title: String?
    var artist: String?
    
    init?(map: Map) {
        
    }
    
    static func fetchFeed(category: Category, callback: @escaping ([Feed]?, Error?) -> Void ){
        Alamofire.request(category.rawValue).responseJSON { response in
            guard let json = response.result.value as? [String: Any],
            let feed = json["feed"] as? [String: Any],
            let entries = feed["entry"] else {
                callback(nil, response.result.error)
                return
            }
            let feeds = Mapper<Feed>().mapArray(JSONObject: entries)
            
            callback(feeds, nil)
            
        }
    }
}

extension Feed: Mappable {
    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["im:name.label"]
        imageLink <- map["im:image.0.label"]
        title <- map["im:title.label"]
        artist <- map["im:artist.label"]
    }
}
