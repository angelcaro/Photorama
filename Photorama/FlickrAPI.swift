//
//  FlickrAPI.swift
//  Photorama
//
//  Created by Angel Caro on 4/27/16.
//  Copyright © 2016 AngelCaro. All rights reserved.
//

import Foundation

enum Method: String {
    case RecentPhotos = "flickr.photos.getRecent"
}

struct FlickrAPI {
    
    private let baseURLString = "https://api.flickr.com/services/rest"
    private let APIKey = "e8198c23921dae2d130d64c0fc9d675d"
    
    private func flickrURL(method: Method, parameters: [String: String]?) -> NSURL {
        
        let components = NSURLComponents(string: baseURLString)!
        
        var queryItems = [NSURLQueryItem]()
        
        let baseParams = [
            "method": method.rawValue,
            "format": "json",
            "nojsoncallback": "1",
            "api_key": APIKey
        ]
        
        for (key, value) in baseParams {
            let item = NSURLQueryItem(name: key, value: value)
            queryItems.append(item)
        }
        
        if let additionalParams = parameters {
            for (key, value) in additionalParams {
                let item = NSURLQueryItem(name: key, value: value)
                queryItems.append(item)
            }
        }
        components.queryItems = queryItems
        
        return components.URL!
    }
    
    func recentPhotosURL() -> NSURL {
        return flickrURL(.RecentPhotos, parameters: ["extras": "url_h,date_taken"])
    }
    
}

