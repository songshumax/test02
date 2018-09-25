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

    
public class Common_QRCodeContorller: UIViewController,TypedRowControllerType {
    public var row: RowOf<String>!
    
    public var QRimageNmae = ""
    
    let QRImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = UIColor.red
        
        return imageView
        
    }()
    
    //    public typealias RowValue = ""
    
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
        
        view.addSubview(QRImageView)
        QRImageView.image = UIImage(named: QRimageNmae)
        addConstraintsWidthFormat(format: "H:|-8-[v0]-8-|", views: QRImageView)
        addConstraintsWidthFormat(format: "V:|-80-[v0(300)]", views: QRImageView)
    
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
