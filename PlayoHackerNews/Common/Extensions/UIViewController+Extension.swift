//
//  UIViewController+Extension.swift
//  PlayoHackerNews
//
//  Created by Priya Srivastava on 12/09/21.
//

import Foundation
import UIKit

extension UIViewController {
    
    class func getViewControllerWith(storyBoardID : String , ViewControllerID : String) -> UIViewController {
        let storyboard = UIStoryboard(name: storyBoardID, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: ViewControllerID)
    }
}
