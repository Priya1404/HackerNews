//
//  ResultViewViewController.swift
//  PlayoHackerNews
//
//  Created by Priya Srivastava on 12/09/21.
//

import UIKit
import WebKit

class ResultViewViewController: UIViewController {

    //MARK:- Properties
    let webView = WKWebView()
    var url: String?
    
    //MARK:- Navigator
    static func getComponentViewController() -> UIViewController {
        return UIViewController.getViewControllerWith(storyBoardID: HNConstants.StoryBoardIDs.searchResults, ViewControllerID: String(describing: ResultViewViewController.self))
    }
    
    //MARK:- ViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpWebView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }
    
    //MARK:- Set up WebView
    func setUpWebView() {
        view.addSubview(webView)
        guard let urlString = url, let url = URL(string: urlString) else {
            return
        }
        webView.load(URLRequest(url: url))
    }
}
