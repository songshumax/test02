
//
//  File.swift
//  test02
//
//  Created by fangli on 2018/7/2.
//  Copyright © 2018年 lijs. All rights reserved.
//

import UIKit

class ChatLogController : UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    private let cellID = "cellID"
    
    var objectxxx : objectXXX? {
        didSet{
            navigationController?.title = objectxxx?.name
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        super.collectionView?.backgroundColor = UIColor.blue
        
        collectionView?.register(Common_Cell01_CollectionView.self, forCellWithReuseIdentifier: cellID)
        collectionView?.alwaysBounceVertical = true
        
        tabBarController?.tabBar.isHidden = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if let count = messages.count {
//            return count
//        }
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! Common_ChatLogCell01
        
        return cell
        
    }
    
}

