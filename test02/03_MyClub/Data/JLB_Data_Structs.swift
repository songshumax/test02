//
//  File.swift
//  test02
//
//  Created by fangli on 2017/11/1.
//  Copyright © 2017年 lijs. All rights reserved.
//

import Foundation


struct JLB_CanJiaZhongList_Structs {
    
    var JLB_ID :String
    var JLB_name : String
    var JLB_image : String
    var JLB_lasttime :String
    var JLB_lastmsg : String
    var JLB_msgNO : String
    var JLB_msgcount : Int
    
}

struct JLB_UserList_ALL_Structs {
    
    var JLB_UserID :String
    var JLB_UserName : String
    var JLB_UserGroupID : String
    var JLB_UserImage : String
    
}

struct JLB_UserList_ByGroup_Structs {
    
    var JLB_UserGroupID : String
    var JLB_UserGroupName : String
    var JLB_UserList : [JLB_UserList_ALL_Structs]
    
}
