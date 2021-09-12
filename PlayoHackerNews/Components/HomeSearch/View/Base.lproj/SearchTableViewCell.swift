//
//  SearchTableViewCell.swift
//  PlayoHackerNews
//
//  Created by Priya Srivastava on 12/09/21.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    //MARK:- IBOutlets
    @IBOutlet weak var searchTitleLabel: UILabel!
    @IBOutlet weak var authorNameLabel: UILabel!
    
    let viewModel = SearchTableViewViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    /// Updates the SearchTableViewCell labels
    ///
    /// - Parameters:
    ///   - searchTitle: Result title
    ///   - authorName: Author Name
    func update(searchTitle: String, authorName: String) {
        searchTitleLabel.text = viewModel.getArticleName(articleName: searchTitle)
        authorNameLabel.text = viewModel.getAuthorName(authorName: authorName)
    }
}
