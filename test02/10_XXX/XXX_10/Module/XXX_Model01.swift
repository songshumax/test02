//
//  TSMessageModel.swift
//  TSWeChat
//
//  Created by Hilen on 2/22/16.
//  Copyright © 2016 Hilen. All rights reserved.
//

import Foundation
import ObjectMapper

class XXX_Model01: NSObject, TSModelProtocol {
    var HDID : String?
    var HDTitle : String?
    var  HDImageURL: String?
    var  HDJL: String?
    var  HDDateTime: String?
    var  HDTtype: String?
    
    var messageFromType : MessageFromType = MessageFromType.Personal
    var messageContentType : MessageContentType = MessageContentType.Text
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        HDID <- map["hdid"]
        HDTitle <- map["name"]
        HDImageURL <- map["profileImageName"]
        HDJL <- map["lastMessage"]
        HDDateTime <- map["hddatetime"]
        HDTtype <- map["hdtype"]
        
        
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

