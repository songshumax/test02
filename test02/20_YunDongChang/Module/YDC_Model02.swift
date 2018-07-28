//
//  TSMessageModel.swift
//  TSWeChat
//
//  Created by Hilen on 2/22/16.
//  Copyright © 2016 Hilen. All rights reserved.
//

import Foundation
import ObjectMapper
import SwiftyJSON

class YDC_Model02: NSObject, TSModelProtocol {
    var SportsTypeID : String?
    var SportsTypeName : String?
    
    var YDCModel03 : [YDC_Model03]?
    
    var messageFromType : MessageFromType = MessageFromType.Personal
    var messageContentType : MessageContentType = MessageContentType.Text
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        SportsTypeID <- map["sportstypeid"]
        SportsTypeName <- map["sportstypename"]
        YDCModel03 <- map["sportstypedetails"]
        
        if let obj = YDCModel03 {
            for res in obj{
                    print(res.SportsID)
                print(res.SportsName)
            }
        }
        
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

