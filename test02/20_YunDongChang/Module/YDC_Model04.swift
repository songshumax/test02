//
//  TSMessageModel.swift
//  TSWeChat
//
//  Created by Hilen on 2/22/16.
//  Copyright © 2016 Hilen. All rights reserved.
//

import Foundation
import ObjectMapper

class YDC_Model04: NSObject, TSModelProtocol {
    var HDID : String?
    var HDTitle : String?
    var HDImageURL : String?
    var HDTtype : String?
    var HDJL : String?
    var HDDateTime : String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        HDID <- map["hdid"]
        HDTitle <- map["hdtitle"]
        HDImageURL <- map["hdimageurl"]
        HDJL <- map["hdjl"]
        HDDateTime <- map["hddatetime"]
        
    }
    
    //    //因为服务器连这个字符串都没有，客户端只能自己拼了！ (#‵′)凸
    //    var lastMessage: String? { get {
    //        switch (self.messageContentType) {
    //        case .Text, .System:
    //            return self.latestMessage
    //        case .Image:
    //            return "[图片]"
    //        case .Voice:
    //            return "[语音]"
    //        case .File:
    //            return "[文件]"
    //        default:
    //            return ""
    //        }}
    //    }
}

