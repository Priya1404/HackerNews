//
//  ViewController.swift
//  PlayoHackerNews
//
//  Created by Priya Srivastava on 12/09/21.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let searchController = UISearchController(searchResultsController: nil)

    var resultsViewModel = ResultsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setUpSearchController()
        setUpTableView()
    }
    
    func setUpUI() {
        title = HNConstants.Titles.searchTitle
    }

    func setUpTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func setUpSearchController() {
        searchController.delegate = self
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
    }
    
    func updateSearchResults(searchText: String, paginate: Bool = false) {
        resultsViewModel.initiateSearchCall(text: searchText) { [weak self] (isFailed) in
            guard let self = self else {
                return
            }
            DispatchQueue.main.async {
                if !isFailed {
                    self.tableView.reloadData()
                }
            }
        }
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultsViewModel.getNumberOfResults()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SearchTableViewCell.self), for: indexPath) as? SearchTableViewCell {
            cell.textLabel?.text = resultsViewModel.getResultLabel(atIndex: indexPath.row)
        }
        return UITableViewCell()
    }
    
    
}

extension SearchViewController: UISearchControllerDelegate {}

extension SearchViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        if text != "" {
            updateSearchResults(searchText: text)
        }
    }
}
