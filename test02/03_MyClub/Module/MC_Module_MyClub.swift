//
//  MC_Module_MyClub.swift
//  test02
//
//  Created by fangli on 2017/11/4.
//  Copyright © 2017年 lijs. All rights reserved.
//

import Foundation


class MC_Module_MyClub {
    
    //取得俱乐部的种类
    // return : 俱乐部大类List
    public func MF_GetClubBigType_List() ->[MyClub_BigType_Structs] {
        
        var celldatas =  [MyClub_BigType_Structs]()
        celldatas.append(MyClub_BigType_Structs(
            myClub_BigTypeID: "001",
            myClub_BigTypeName: "体育"))
        
        return celldatas
        
    }
    
    //取得俱乐部的种类
    // agr1 : 俱乐部大类ID
    // return : 俱乐部小类List
    public func MF_GetDetailType_List(pclugBigType : String) ->[MyClub_DetailType_Structs] {
        
        var celldatas =  [MyClub_DetailType_Structs]()
        celldatas.append(MyClub_DetailType_Structs(
            myClub_BigTypeID: "001",
            myClub_DetailTypeID: "001",
            myClub_DetailTypeName: "羽毛球"))
        celldatas.append(MyClub_DetailType_Structs(
            myClub_BigTypeID: "001",
            myClub_DetailTypeID: "002",
            myClub_DetailTypeName: "网球"))
        celldatas.append(MyClub_DetailType_Structs(
            myClub_BigTypeID: "001",
            myClub_DetailTypeID: "003",
            myClub_DetailTypeName: "高尔夫"))
        celldatas.append(MyClub_DetailType_Structs(
            myClub_BigTypeID: "001",
            myClub_DetailTypeID: "004",
            myClub_DetailTypeName: "足球"))
        celldatas.append(MyClub_DetailType_Structs(
            myClub_BigTypeID: "001",
            myClub_DetailTypeID: "005",
            myClub_DetailTypeName: "篮球"))
        celldatas.append(MyClub_DetailType_Structs(
            myClub_BigTypeID: "001",
            myClub_DetailTypeID: "006",
            myClub_DetailTypeName: "排球"))
        celldatas.append(MyClub_DetailType_Structs(
            myClub_BigTypeID: "001",
            myClub_DetailTypeID: "007",
            myClub_DetailTypeName: "自行车"))
        celldatas.append(MyClub_DetailType_Structs(
            myClub_BigTypeID: "001",
            myClub_DetailTypeID: "008",
            myClub_DetailTypeName: "跑步"))
        
        return celldatas
        
    }
    
    //取得活动种类
    // return : 活动种类LIST
    public func MF_GetClubType_List() ->[MyClub_TypeList_Structs] {
        
        let bigTypes = MF_GetClubBigType_List()
        var list = [MyClub_TypeList_Structs]()
        
        for i in bigTypes{
            let detailTypes = MF_GetDetailType_List(pclugBigType: i.myClub_BigTypeID)
            list.append(MyClub_TypeList_Structs(
                myClub_BigType_Structs: i,
                myClub_DetailType_Structs: detailTypes))
            
        }
        
        return list
    }
}
