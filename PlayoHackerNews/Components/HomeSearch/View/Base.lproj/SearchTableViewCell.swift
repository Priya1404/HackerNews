//
//  SearchTableViewCell.swift
//  PlayoHackerNews
//
//  Created by Priya Srivastava on 12/09/21.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var searchTitleLabel: UILabel!
    @IBOutlet weak var authorNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func update(searchTitle: String, authorName: String) {
        searchTitleLabel.text = "Article: \(searchTitle)"
        authorNameLabel.text = "Author: \(authorName)"
    }
}
