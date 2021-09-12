//
//  SearchTableViewCell.swift
//  PlayoHackerNews
//
//  Created by Priya Srivastava on 12/09/21.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var searchResultsTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func update(searchTitle: String) {
        searchResultsTitle.text = searchTitle
    }
}
