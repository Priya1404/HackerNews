//
//  ResultsViewModel.swift
//  PlayoHackerNews
//
//  Created by Priya Srivastava on 12/09/21.
//

import Foundation

class ResultsViewModel {
    
    var dataSource = [NewsResults]()
    
    func getNumberOfResults() -> Int {
        return dataSource.count
    }
    
    func getResultLabel(atIndex index: Int) -> String {
        return dataSource[index].title
    }
}
