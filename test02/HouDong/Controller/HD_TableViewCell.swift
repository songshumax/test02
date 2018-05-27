//
//  HD_TableViewCell.swift
//  test02
//
//  Created by fangli on 2017/10/2.
//  Copyright © 2017年 lijs. All rights reserved.
//

import UIKit

class HD_TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var hd_image: UIImageView!
    @IBOutlet weak var hd_title: UILabel!
    @IBOutlet weak var hd_canjiarenshu: UILabel!
    @IBOutlet weak var hd_shijian: UILabel!
    @IBOutlet weak var hd_position: UILabel!
    @IBOutlet weak var hd_feiyong: UILabel!
    @IBOutlet weak var hd_button: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
