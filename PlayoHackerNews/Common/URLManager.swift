//
//  URLManager.swift
//  PlayoHackerNews
//
//  Created by Priya Srivastava on 12/09/21.
//

import Foundation

class URLManager {
    
    static let sharedInstance = URLManager()
    
    //MARK:- Base url for app
    private let BASEURL = Bundle.main.infoDictionary?["MY_API_BASE_URL_ENDPOINT"] as? String ?? "https://hn.algolia.com/"

    enum APIType: String {
        case searchText = "api/v1/search"
    }
    
    /// function to return the complete url
    ///
    /// - Parameters:
    ///   - apiType: enum for type of API
    /// - Returns: return the complete url
    public func getApiURLForType(apiType : APIType) -> String{
        return BASEURL + apiType.rawValue
    }
}
