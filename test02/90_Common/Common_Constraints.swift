
//
//  File.swift
//  test02
//
//  Created by fangli on 2018/7/28.
//  Copyright © 2018年 lijs. All rights reserved.
//

import Foundation
import UIKit

class Common_Constraints {
    
    func addConstraintsWidthFormat(viewController: UIViewController,  format : String, views: UIView...) {
        
        var viewDictionary = [String : UIView]()
        for (index, view) in views.enumerated() {
            
            let key = "v\(index)"
            viewDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
//        viewController.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewDictionary))
    }

}





