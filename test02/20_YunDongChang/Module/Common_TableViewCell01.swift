//
//  TSMessageTableViewCell.swift
//  TSWeChat
//
//  Created by Hilen on 12/9/15.
//  Copyright © 2015 Hilen. All rights reserved.
//

import UIKit
// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l < r
    case (nil, _?):
        return true
    default:
        return false
    }
}

// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l > r
    default:
        return rhs < lhs
    }
}


class Common_TableViewCell01: UITableViewCell {

    @IBOutlet weak var ID: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!        //头像图片
    @IBOutlet weak var unreadNumberLabel: UILabel!          //消息数量
    @IBOutlet weak var dateLabel: UILabel!                  //消息时间
    @IBOutlet weak var nameLabel: UILabel!                  //消息名称
    @IBOutlet weak var lastMessageLabel: UILabel!           //消息内容
    @IBOutlet weak var sportsTypeID: UILabel!
    @IBOutlet weak var sportsTypeImageView: UIImageView!    //消息种类图片


    override func awakeFromNib() {
        super.awakeFromNib()
        self.avatarImageView.layer.masksToBounds = true
        self.avatarImageView.layer.cornerRadius = self.avatarImageView.width / 2 / 180 * 30

        self.unreadNumberLabel.layer.masksToBounds = true
        self.unreadNumberLabel.layer.cornerRadius = self.unreadNumberLabel.height / 2.0
    }

    func setCellContnet(_ model: Common_Model_TableViewCell01) {

        self.ID.isHidden = true
        self.sportsTypeID.isHidden = true

        self.ID.text = model.ID
        self.avatarImageView.ts_setImageWithURLString(model.avatarImageView, placeholderImage: model.messageFromType.placeHolderImage)
        self.unreadNumberLabel.text = (model.unreadNumberLabel! as NSString).intValue > 99 ? "99+" : String(model.unreadNumberLabel!)
        self.dateLabel.text = model.dateLabel
        self.nameLabel.text = model.nameLabel
        self.lastMessageLabel.text = model.lastMessageLabel
        self.sportsTypeID.text = model.sportsTypeID
        self.sportsTypeImageView.image = UIImage(named: model.sportsTypeImageView!)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}


