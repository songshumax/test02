//
//  MC_ClubTypeCollectionViewCell.swift
//  test02
//
//  Created by fangli on 2017/11/4.
//  Copyright © 2017年 lijs. All rights reserved.
//

import UIKit

class MC_ClubTypeCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var button: UIButton!
    
    @IBAction func Click(_ sender: Any) {
        print("aa1")
        
//        performSegue(withIdentifier: "goInputClubInfo", sender: button.tag)
    }
    

}
