//
//  URLManager.swift
//  PlayoHackerNews
//
//  Created by Priya Srivastava on 12/09/21.
//

import Foundation

class URLManager {
    
    static let sharedInstance = URLManager()
    
    private let BASEURL = Bundle.main.infoDictionary?["MY_API_BASE_URL_ENDPOINT"] as? String ?? "https://hn.algolia.com/"

    enum APIType: String {
        case searchText = "api/v1/search"
    }
    
    public func getApiURLForType(apiType : APIType) -> String{
        return BASEURL + apiType.rawValue
    }
}
