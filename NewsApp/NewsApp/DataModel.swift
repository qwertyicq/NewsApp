//
//  DataModel.swift
//  NewsApp
//
//  Created by Nikolay T on 15.11.2021.
//

import Foundation
import ObjectMapper

class NewsApiResponse: Mappable {
    
    var articlesArray = [News]()
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        articlesArray <- map["articles"]
    }
}

class News: Mappable {
    
    
    var author: String?
    var title: String?
    var description: String?
    var urlToNews: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        author <- map["author"]
        title <- map["title"]
        description <- map["description"]
        urlToNews <- map["url"]
        urlToImage <- map["urlToImage"]
        publishedAt <- map["publishedAt"]
        content <- map["content"]
    }
}

