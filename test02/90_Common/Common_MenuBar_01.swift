//
//  Common_MenuBar_01.swift
//  test02
//
//  Created by fangli on 2018/8/4.
//  Copyright © 2018年 lijs. All rights reserved.
//

import Foundation

import UIKit

class Common_MenuBar_01: UIView,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    lazy var collectionView : UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.clear
        cv.dataSource = self
        cv.delegate = self
        cv.alwaysBounceHorizontal = true
        return cv
    }()
    let imageNames = ["个人交易","商家","拼","教学"]
    
    let cellID = "cellID"
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! Common_Cell02
//        cell.backgroundColor = UIColor.brown
        cell.menubutton.setTitle(imageNames[indexPath.item], for: .normal)
        cell.tintColor = CFTool.rgb(red: 91, green: 14, blue: 13)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width/4 - 3, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.register(Common_Cell02.self, forCellWithReuseIdentifier: cellID)
        
        addSubview(collectionView)
        addConstraintsWidthFormat(format: "H:|[v0]|", views: collectionView)
        addConstraintsWidthFormat(format: "V:|[v0]|", views: collectionView)
    }
    
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("zhe li shi error")
    }
    
}
