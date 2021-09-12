//
//  ResultsViewModel.swift
//  PlayoHackerNews
//
//  Created by Priya Srivastava on 12/09/21.
//

import Foundation

class ResultsViewModel {
    
    var dataSource = [NewsResults]()
    var searchText: String?
    let apiWorker = SearchWorker()
    var isPaginating = false
    var pageNumber = 0
    
    func getNumberOfResults() -> Int {
        return dataSource.count
    }
    
    func getResultLabel(atIndex index: Int) -> (String, String) {
        return (dataSource[index].title ?? "", dataSource[index].author ?? "")
    }
    
    func getResultUrl(forIndex index: Int) -> String {
        return dataSource[index].url ?? ""
    }
    
    func initiateSearchCall(text: String, paginate: Bool, completion: @escaping (_ failureEncountered: Bool) -> Void) {
        var failureEncountered: Bool?
        searchText = text
        if paginate {
            isPaginating = true
            pageNumber += 1
        }
        apiWorker.searchForNews(withText: text, pageNumber: pageNumber) { [weak self] (successResponse) in
            guard let self = self else {
                return
            }
            if let searchValue = successResponse.hits, searchValue.count > 0 {
                self.dataSource.append(contentsOf: searchValue)
                if paginate {
                    self.isPaginating = false
                }
            }
            failureEncountered = false
            if let failureEncountered = failureEncountered {
                completion(failureEncountered)
            }
        } failure: { [weak self] (error) in
            guard let self = self else {
                return
            }
            if paginate {
                self.isPaginating = false
            }
            print(error)
            failureEncountered = true
            if let failureEncountered = failureEncountered {
                completion(failureEncountered)
            }
        }
        
    }
}
