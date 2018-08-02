//
//  TL_Module01.swift
//  test02
//
//  Created by fangli on 2018/7/29.
//  Copyright © 2018年 lijs. All rights reserved.
//

import Foundation
import ObjectMapper

class TL_Module01: NSObject, TSModelProtocol {
    var name : String?
    var profileimage : String?
    var imageURL : String?
    var statustext : String?
    var likenum : String?
    var commentnum : String?
    
    
    var messageFromType : MessageFromType = MessageFromType.Personal
    var messageContentType : MessageContentType = MessageContentType.Text
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        imageURL <- map["imageurl"]
        statustext <- map["statustext"]
        likenum <- map["likenum"]
        commentnum <- map["commentnum"]
        profileimage <- map["profileimage"]
        
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

