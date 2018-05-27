//
//  JLB_CanjiaZhongList_Cell.swift
//  test02
//
//  Created by fangli on 2017/11/1.
//  Copyright © 2017年 lijs. All rights reserved.
//

import UIKit

class JLB_CanjiaZhongList_Cell: UITableViewCell {

    
    @IBOutlet weak var clubImage: UIImageView!
    @IBOutlet weak var messageReviceCount: UIImageView!
    @IBOutlet weak var clubName: UILabel!
    @IBOutlet weak var lastMessageTime: UILabel!
    @IBOutlet weak var lastMessage: UILabel!
    @IBOutlet weak var messageNoFlag: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
