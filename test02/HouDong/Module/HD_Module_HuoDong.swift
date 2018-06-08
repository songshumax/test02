//
//  HD_Module_HuoDong.swift
//  test02
//
//  Created by fangli on 2017/10/3.
//  Copyright © 2017年 lijs. All rights reserved.
//

import Foundation

class HD_Module_HuoDong {
    
    //附近位置活动取得
    // agr1 : 纬度 东京
    // agr2 : 纬度 北纬
    // return : 活动结果集
    public func MF_GetHuoDong_FuJin(dongjing : Float,beiwei : Float) ->[HD_struct_HuodongXiangXi] {
        
        var celldatas =  [HD_struct_HuodongXiangXi]()
        
        for index in 1000...1005 {
            
            celldatas.append(HD_struct_HuodongXiangXi(
                HD_ID: "\(index)",
                HD_title: "10/10和田町羽毛球俱乐部" + String(index),
                HD_shijian: "10:00~12:00",
                HD_position: "保土谷西体育馆",
                HD_button: "参加",
                HD_image: "001",
                HD_feiyong: "1000日元/人",
                HD_canjiarenshu: "10/20",
                HD_position_dj: 2.111,
                HD_position_bw: 35.111,
                HD_baomingjiezhi: "20171010",
                HD_huodongxiangxi: "活动详细：\n a啊slkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjs"
            ))
            
        }
        
        return celldatas
    }
    
    //取得用户参加中的活动
    // agr1 : 用户ID
    // return : 用户参加中的活动
    func MF_GetHuoDong_CanJiaZhong(userid : String) ->[HD_struct_HuodongXiangXi] {
        
        var celldatas =  [HD_struct_HuodongXiangXi]()
        
        for index in 2006...2015 {
            
            celldatas.append(HD_struct_HuodongXiangXi(
                HD_ID: "\(index)",
                HD_title: "10/10和田町羽毛球俱乐部" + String(index),
                HD_shijian: "10:00~12:00",
                HD_position: "保土谷西体育馆",
                HD_button: "取消",
                HD_image: "001",
                HD_feiyong: "1000日元/人",
                HD_canjiarenshu: "10/20",
                HD_position_dj: 2.111,
                HD_position_bw: 35.111,
                HD_baomingjiezhi: "20171010",
                HD_huodongxiangxi: "活动详细：\n a啊lkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjs"
            ))
            
        }
        
        return celldatas
    }
    
    //取得用户的活动履历
    // agr1 : 用户ID
    // return : 用户参加过的活动
    func MF_GetHuoDong_CanJiaLvLi(userid : String) ->[HD_struct_HuodongXiangXi] {
        
        var celldatas =  [HD_struct_HuodongXiangXi]()
        
        for index in 3016...3035 {
         
            celldatas.append(HD_struct_HuodongXiangXi(
                HD_ID: "\(index)",
                HD_title: "10/10和田町羽毛球俱乐部" + String(index),
                HD_shijian: "10:00~12:00",
                HD_position: "保土谷西体育馆",
                HD_button: "参加",
                HD_image: "001",
                HD_feiyong: "1000日元/人",
                HD_canjiarenshu: "10/20",
                HD_position_dj: 2.111,
                HD_position_bw: 35.111,
                HD_baomingjiezhi: "20171010",
                HD_huodongxiangxi: "活动详细：\n a啊lkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjs"
            ))
            
        }

        return celldatas
    }
    
    //活动详细信息取得
    // agr1 : 活动
    // return : 活动详细信息
    func MF_GetHuoDong_XiangXi(hdid : String) ->HD_struct_HuodongXiangXi {
        
        let celldata = HD_struct_HuodongXiangXi(
            HD_ID: hdid,
            HD_title: "10/10和田町羽毛球俱乐部",
            HD_shijian: "10:00~12:00",
            HD_position: "保土谷西体育馆",
            HD_button: "参加",
            HD_image: "001",
            HD_feiyong: "1000日元/人",
            HD_canjiarenshu: "10/20",
            HD_position_dj: 2.111,
            HD_position_bw: 35.111,
            HD_baomingjiezhi: "20171010",
            HD_huodongxiangxi: "活动详细：\n a啊lkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjs"
        )
        
        return celldata
    }
    
    //附近位置活动取得
    // agr1 : 纬度 东京
    // agr2 : 纬度 北纬
    // agr3 : 半径
    // agr4 : 活动类别
    // return : 活动结果集
    public func MF_GetHuoDong_FindFuJin(dongjing : Float,beiwei : Float, banjing : Int, leibie : [String]) ->[HD_struct_HuodongXiangXi] {
        
        var celldatas =  [HD_struct_HuodongXiangXi]()
        
        for index in 1000...1003 {
            
            celldatas.append(HD_struct_HuodongXiangXi(
                HD_ID: "\(index)",
                HD_title: "10/10和田町羽毛球俱乐部" + String(index),
                HD_shijian: "10:00~12:00",
                HD_position: "保土谷西体育馆",
                HD_button: "参加",
                HD_image: "001",
                HD_feiyong: "1000日元/人",
                HD_canjiarenshu: "10/20",
                HD_position_dj: 2.111,
                HD_position_bw: 35.111,
                HD_baomingjiezhi: "20171010",
                HD_huodongxiangxi: "活动详细：\n a啊slkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjslkaslkfjlskdjflksjdflkjs"
            ))
            
        }
        
        return celldatas
    }
    
    func MF_setHD_CanJia(phdid:Int,pcelldatas1:Array<HD_struct_HuodongXiangXi>,pcelldatas2:Array<HD_struct_HuodongXiangXi>) -> (Array<HD_struct_HuodongXiangXi>,Array<HD_struct_HuodongXiangXi>) {
        
        let hdid :Int = phdid
        var celldatas1 = pcelldatas1
        var celldatas2 = pcelldatas2
        
        //参加
        for i in (1...celldatas1.count).reversed() {
            let value = celldatas1[i-1]
            if Int(value.HD_ID) == hdid {
                celldatas1[i-1].HD_button = "取消"
                celldatas2.insert(celldatas1[i-1], at: 0)
                celldatas1.remove(at:i-1)
            }
        }

        return (celldatas1,celldatas2)
    }
    
    func MF_setHD_QuXiao(phdid:Int,pcelldatas1:Array<HD_struct_HuodongXiangXi>,pcelldatas2:Array<HD_struct_HuodongXiangXi>) -> (Array<HD_struct_HuodongXiangXi>,Array<HD_struct_HuodongXiangXi>) {
        
        let hdid :Int = phdid
        var celldatas1 = pcelldatas1
        var celldatas2 = pcelldatas2
        
        //取消
        for i in (1...celldatas2.count).reversed() {
            let value = celldatas2[i-1]
            if Int(value.HD_ID) == hdid {
                celldatas2[i-1].HD_button = "参加"
                celldatas1.insert(celldatas2[i-1], at: 0)
                celldatas2.remove(at:i-1)
            }
        }
        
        return (celldatas1,celldatas2)
    }
    
    public func MF_GetHuoDong_ZhongLei() -> Array<HD_HuoDongZhongLei> {
        
        let value = ["羽毛球","篮球","足球","自行车","滑雪","乒乓球","网球","跑步","健身","游泳","台球","保龄球"]
        
        var celldatas =  Array<HD_HuoDongZhongLei>()
        
        for i in (1...value.count).reversed() {
            
            celldatas.append(HD_HuoDongZhongLei(HD_ZhongLei_ID: String(i), HD_ZhongLei_Type: "001", HD_ZhongLei_Name: value[i-1],HD_ZhongLei_Selected : true))
        
        }
        
        return celldatas
        
    }
}
