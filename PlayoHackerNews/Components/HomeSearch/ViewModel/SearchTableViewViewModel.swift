//
//  SearchTableViewViewModel.swift
//  PlayoHackerNews
//
//  Created by Priya Srivastava on 12/09/21.
//

import Foundation

class SearchTableViewViewModel {
    //MARK:- Pageconstant struct
    fileprivate struct PageConstants {
        static let title = "Article: %@"
        static let authorName = "Author: %@"
    }
    
    //MARK:- Getter Methods
    func getArticleName(articleName: String) -> String {
        return String(format: PageConstants.title, articleName)
    }
    
    func getAuthorName(authorName: String) -> String {
        return String(format: PageConstants.authorName, authorName)
    }
}
