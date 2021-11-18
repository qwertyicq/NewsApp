//
//  NetworkLayer.swift
//  NewsApp
//
//  Created by Nikolay T on 17.11.2021.
//

import Foundation
import Alamofire
import ObjectMapper

class APIManager {
    static let shared = APIManager()
    
    let API_URL: String = "https://newsapi.org/v2/top-headlines?country=ru&from=2021-11-17&apiKey=7bb94fc0595647539e9fe359fef6496b"
    
    private init() {
        
    }
    
    func fetchArticlesFromApi(complition: @escaping (NewsApiResponse?) -> Void) {
        AF.request(API_URL).responseString { response in
            switch response.result {
            case .success(let responseData):
                complition(NewsApiResponse(JSONString: responseData))
            case .failure(let error):
                print(error)
            }
        }
    }
}
