//
//  UIView+Extension.swift
//  PlayoHackerNews
//
//  Created by Priya Srivastava on 12/09/21.
//

import Foundation
import UIKit

extension UIView {
    
    func showLoader(_ activityIndicatorStyle: UIActivityIndicatorView.Style = .medium, onTopOf : UIView? = nil, withYOffest : CGFloat = -24){
        var frameView = self
        if let onTopOf = onTopOf{
            frameView = onTopOf
        }
        if self.viewWithTag(12345) == nil{
            //Make sure multiple activityIndicators are not added to the same view
            self.isUserInteractionEnabled = false
            let activityIndicator = UIActivityIndicatorView(style: activityIndicatorStyle)
            activityIndicator.tag = 12345
            activityIndicator.frame = CGRect(x: frameView.frame.origin.x + frameView.frame.size.width/2 - 13,y: frameView.frame.origin.y +  frameView.frame.size.height/2 - 13 + withYOffest, width: 26, height: 26)
            self.addSubview(activityIndicator)
            activityIndicator.color = UIColor.brown
            activityIndicator.startAnimating()
        }
    }
    
    func dismissloader(){
        self.isUserInteractionEnabled = true
        if let  activityIndicator = self.viewWithTag(12345) as? UIActivityIndicatorView{
            activityIndicator.removeFromSuperview()
        }
    }
}
