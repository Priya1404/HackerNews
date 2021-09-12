//
//  SearchWorker.swift
//  PlayoHackerNews
//
//  Created by Priya Srivastava on 12/09/21.
//

import Foundation

class SearchWorker {
    
    func searchForNews(withText text: String, success: @escaping (SearchResultsResponse) -> Void, failure: @escaping (Error) -> Void) {
        let apiEndPoint = URLManager.sharedInstance.getApiURLForType(apiType: .searchText)
        guard var urlComponents = URLComponents(string: apiEndPoint) else {
            return
        }
        urlComponents.queryItems = [URLQueryItem(name: "query", value: text)]
        guard let urlString = urlComponents.url?.absoluteString else {
            return
        }
        NetworkManager.sharedInstance.request(url: urlString, success: success, failure: failure)
    }
}
