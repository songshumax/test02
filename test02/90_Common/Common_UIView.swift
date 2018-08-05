//
//  Common_UIView.swift
//  test02
//
//  Created by fangli on 2018/8/5.
//  Copyright © 2018年 lijs. All rights reserved.
//

import UIKit

class Common_UIView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
extension UIView {
    func addConstraintsWidthFormat(format : String, views: UIView...) {
        
        var viewDictionary = [String : UIView]()
        for (index, view) in views.enumerated() {
            
            let key = "v\(index)"
            viewDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewDictionary))
    }
    
}
