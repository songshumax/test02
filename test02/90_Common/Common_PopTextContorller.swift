//
//  Common_QRCodeController.swift
//  test02
//
//  Created by fangli on 2018/9/16.
//  Copyright © 2018年 lijs. All rights reserved.
//

import Foundation
import UIKit
import Eureka
import MapKit

    
public class Common_PopTextContorller: FormViewController, TypedRowControllerType {
    public var row: RowOf<String>!
    
    
    public var PopTextDate = ""
    
    public var onDismissCallback: ((UIViewController) -> ())?
    
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    convenience public init(_ callback: ((UIViewController) -> ())?){
        self.init(nibName: nil, bundle: nil)
        onDismissCallback = callback
    }
    
    
    override public func viewDidLoad() {
        super.viewDidLoad()
    
        self.view.backgroundColor = UIColor.gray
        
        let button = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(MapViewController.tappedDone(_:)))
        button.title = "Done"
        navigationItem.rightBarButtonItem = button
        
        form +++
            
            Section()
            
            <<< TextRow() {
                $0.title = ""
                $0.placeholder = ""
                $0.value = PopTextDate
                $0.tag = "TextValue"
        }
    
    }

    @objc func tappedDone(_ sender: UIBarButtonItem){
        // 获取单个row的值
        let getrow: TextRow? = form.rowBy(tag: "TextValue")
        let value = getrow!.value

        row.value = value
        onDismissCallback?(self)
        
    }
    
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func addConstraintsWidthFormat(format : String, views: UIView...) {
        
        var viewDictionary = [String : UIView]()
        for (index, view) in views.enumerated() {
            
            let key = "v\(index)"
            viewDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewDictionary))
    }
    
}
