//
//  Common_Cell01_CollectionView.swift
//  test02
//
//  Created by fangli on 2018/6/23.
//  Copyright © 2018年 lijs. All rights reserved.
//

import Foundation
import UIKit

class Common_Cell02 : UICollectionViewCell
{
    
    var message : Message?
    
    let profileImageview : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let menubutton : UIButton = {
        let btn = UIButton()
//        btn.backgroundColor = UIColor.brown
        btn.setTitleColor(UIColor.blue, for: .normal)
        btn.setTitleColor(UIColor.black, for: .selected)
        btn.setTitleColor(UIColor.gray, for: .highlighted)
        
        return btn
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupView()
    }
   
    
    func setImage(img : String) {

        profileImageview.image = UIImage(named: img)
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init coder has not been implemented")
    }
    
    func setupView(){
        
        addSubview(menubutton)
        
        menubutton.translatesAutoresizingMaskIntoConstraints = false
        
        menubutton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        menubutton.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        menubutton.widthAnchor.constraint(equalToConstant: self.width).isActive = true
        menubutton.heightAnchor.constraint(equalToConstant: self.height).isActive = true

    }
    
    override var isSelected: Bool {
        didSet {
            menubutton.backgroundColor = isSelected ? UIColor.black : UIColor.clear
            print("is selected")
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            menubutton.backgroundColor = isHighlighted ? UIColor.black : UIColor.clear
            print("is highlighted")
        }
    }
    
    
}
