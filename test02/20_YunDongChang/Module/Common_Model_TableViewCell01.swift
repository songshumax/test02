//
//  TSMessageModel.swift
//  TSWeChat
//
//  Created by Hilen on 2/22/16.
//  Copyright © 2016 Hilen. All rights reserved.
//

import Foundation
import ObjectMapper

class Common_Model_TableViewCell01: NSObject, TSModelProtocol {
    var ID : String?
    var avatarImageView : String?
    var unreadNumberLabel : String?
    var dateLabel : String?
    var nameLabel : String?
    var lastMessageLabel : String?
    var sportsTypeID : String?
    var sportsTypeImageView : String?
    
    var messageFromType : MessageFromType = MessageFromType.Personal
    var messageContentType : MessageContentType = MessageContentType.Text
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        ID <- map["listID"]
        avatarImageView <- map["imageURL"]
        unreadNumberLabel <- map["unreadNum"]
        dateLabel <- map["dateTime"]
        nameLabel <- map["nameorTitle"]
        lastMessageLabel <- map["detail"]
        sportsTypeID <- map["sportsType"]
        sportsTypeImageView <- map["sportsTypeIMG"]
        
    }
    
    //因为服务器连这个字符串都没有，客户端只能自己拼了！ (#‵′)凸
    var lastMessage: String? { get {
        switch (self.messageContentType) {
        case .Text, .System:
            return "哈哈蛤haha"
        case .Image:
            return "[图片]"
        case .Voice:
            return "[语音]"
        case .File:
            return "[文件]"
        default:
            return ""
        }}
    }
}

