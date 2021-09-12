//
//  ResultsViewModel.swift
//  PlayoHackerNews
//
//  Created by Priya Srivastava on 12/09/21.
//

import Foundation

class ResultsViewModel {
    
    var dataSource : SearchResultsResponse?
    var searchText: String?
    let apiWorker = SearchWorker()
    
    func getNumberOfResults() -> Int {
        return dataSource?.hits.count ?? 0
    }
    
    func getResultLabel(atIndex index: Int) -> String {
        return dataSource?.hits[index].title ?? ""
    }
    
    func getResultUrl(forIndex index: Int) -> String {
        return dataSource?.hits[index].url ?? ""
    }
    
    func initiateSearchCall(text: String, completion: @escaping (_ failureEncountered: Bool) -> Void) {
        var failureEncountered: Bool?
        searchText = text
        apiWorker.searchForNews(withText: text) { [weak self] (successResponse) in
            guard let self = self else {
                return
            }
            self.dataSource = successResponse
            failureEncountered = false
            if let failureEncountered = failureEncountered {
                completion(failureEncountered)
            }
        } failure: {(error) in
            print(error)
            failureEncountered = true
            if let failureEncountered = failureEncountered {
                completion(failureEncountered)
            }
        }
        
    }
}
