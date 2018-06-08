//
//  MyClub_Data_Structs.swift
//  test02
//
//  Created by fangli on 2017/11/4.
//  Copyright © 2017年 lijs. All rights reserved.
//

import Foundation

struct MyClub_TypeList_Structs {

    var myClub_BigType_Structs : MyClub_BigType_Structs
    var myClub_DetailType_Structs :[MyClub_DetailType_Structs]

}

struct MyClub_BigType_Structs {
    
    var myClub_BigTypeID :String
    var myClub_BigTypeName :String

}

struct MyClub_DetailType_Structs {

    var myClub_BigTypeID :String
    var myClub_DetailTypeID :String
    var myClub_DetailTypeName : String
    
}
