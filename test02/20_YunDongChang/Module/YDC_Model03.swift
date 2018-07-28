//
//  TSMessageModel.swift
//  TSWeChat
//
//  Created by Hilen on 2/22/16.
//  Copyright © 2016 Hilen. All rights reserved.
//

import Foundation
import ObjectMapper

class YDC_Model03: NSObject, TSModelProtocol {
    var SportsID : String?
    var SportsName : String?
    
    
    var messageFromType : MessageFromType = MessageFromType.Personal
    var messageContentType : MessageContentType = MessageContentType.Text
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        SportsID <- map["sportid"]
        SportsName <- map["sportname"]
        
        
    }
    
    //因为服务器连这个字符串都没有，客户端只能自己拼了！ (#‵′)凸
    var lastMessage: String? { get {
        switch (self.messageContentType) {
        case .Text, .System:
            return "哈哈测试"
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

