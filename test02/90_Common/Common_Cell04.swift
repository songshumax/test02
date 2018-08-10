//
//  Common_Cell04.swift
//  test02
//
//  Created by fangli on 2018/8/8.
//  Copyright © 2018年 lijs. All rights reserved.
//

import UIKit

class Common_Cell04: UITableViewCell {

    @IBOutlet weak var bbimage: UIImageView!
    @IBOutlet weak var bbname: UILabel!
    @IBOutlet weak var describelable: UILabel!
    @IBOutlet weak var valuelable: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
//        self.performSegue(withIdentifier: "SerToSale01", sender: nil)
        // Configure the view for the selected state
    }
    
    
//    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//
//    }
    
}
