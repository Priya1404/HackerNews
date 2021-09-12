//
//  ViewController.swift
//  PlayoHackerNews
//
//  Created by Priya Srivastava on 12/09/21.
//

import UIKit

class SearchViewController: UIViewController {

    //MARK:- IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK:- Properties
    let searchController = UISearchController(searchResultsController: nil)
    var resultsViewModel = ResultsViewModel()
    
    //MARK:- ViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setUpSearchController()
        setUpTableView()
    }
    
    //MARK:- Set up UI
    func setUpUI() {
        title = HNConstants.Titles.searchTitle
    }

    //MARK:- SetUpTableView
    func setUpTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isHidden = true
    }
    
    //MARK:- Set up SearchController
    func setUpSearchController() {
        searchController.delegate = self
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: HNConstants.Titles.clearResultsTitle, style: .done, target: self, action: #selector(clearSearchResults))
        navigationItem.rightBarButtonItem?.isEnabled = false
    }
    
    ///Clears the search results
    ///
    ///   - reset the data source to empty
    ///    - hide the empty tableView
    ///     -- reload to display the updated results
    @objc func clearSearchResults() {
        resultsViewModel.dataSource = []
        navigationItem.rightBarButtonItem?.isEnabled = false
        tableView.isHidden = true
        tableView.reloadData()
    }
    
    /// Updates the Search results list
    ///
    /// - Parameters:
    ///   - searchText: text to be searched
    ///   - paginate: to start pagination
    func updateSearchResults(searchText: String, paginate: Bool = false) {
        self.view.showLoader()
        resultsViewModel.initiateSearchCall(text: searchText, paginate: paginate) { [weak self] (isFailed) in
            guard let self = self else {
                return
            }
            DispatchQueue.main.async {
                self.view.dismissloader()
                if !isFailed {
                    self.tableView.isHidden = false
                    self.tableView.reloadData()
                    self.navigationItem.rightBarButtonItem?.isEnabled = true
                }
            }
        }
    }
}

//MARK:- TableView Delegate methods
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultsViewModel.getNumberOfResults()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SearchTableViewCell.self), for: indexPath) as? SearchTableViewCell {
            let searchResult = resultsViewModel.getResultLabel(atIndex: indexPath.row)
            cell.update(searchTitle: searchResult.0, authorName: searchResult.1)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let viewController = ResultViewViewController.getComponentViewController() as? ResultViewViewController {
            viewController.url = resultsViewModel.getResultUrl(forIndex: indexPath.row)
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == resultsViewModel.getNumberOfResults() - 5 {
            guard let text = searchController.searchBar.text else {
                return
            }
        updateSearchResults(searchText: text, paginate: true)
        }
    }
}

//MARK:- UISearchControllerDelegate confirmance
extension SearchViewController: UISearchControllerDelegate {}

//MARK:- UISearchResultsUpdating delegate methods
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
