

import Foundation

class JLB_Module_Club {
    
    //附近位置活动取得
    // agr1 : 纬度 东京
    // agr2 : 纬度 北纬
    // return : 活动结果集
    public func MF_GetJLB_CanJiaZhong(userid : String) ->[JLB_CanJiaZhongList_Structs] {
        
        var celldatas =  [JLB_CanJiaZhongList_Structs]()
        
        for index in 1000...1005 {
            
            celldatas.append(JLB_CanJiaZhongList_Structs(
                JLB_ID: "\(index)",
                JLB_name: "横滨俱乐部"+"\(index)",
                JLB_image: "002",
                JLB_lasttime: "13：00",
                JLB_lastmsg: "大家周六出来玩哦",
                JLB_msgNO: "1",
                JLB_msgcount: 5))
            
        }
        
        return celldatas
    }
    
    
    
    
    //取得俱乐部所有人员
    // agr1 : 俱乐部ID
    // return : 人员LIST
    public func MF_GetJLB_AllUsers(jlbid : String) ->[JLB_UserList_ALL_Structs] {
        
        var celldatas =  [JLB_UserList_ALL_Structs]()
        var groupid : String
        for index in 1000...1041 {
            
            if index < 1003 {
                groupid = "01"
            } else if (index > 1003 && index < 1010) {
                groupid = "02"
            } else if (index > 1010 && index < 1021) {
                groupid = "03"
            } else if (index > 1020 && index < 1031) {
                groupid = "04"
            } else if (index > 1030 && index < 1041) {
                groupid = "05"
            } else {
                groupid = "01"
            }
            
            celldatas.append(JLB_UserList_ALL_Structs(
                JLB_UserID: "\(index)",
                JLB_UserName: "小明"+"\(index)",
                JLB_UserGroupID: groupid,
                JLB_UserImage: "003"))

        }
        
        return celldatas
    }
    
    
    //取得俱乐部等级
    // agr1 : 俱乐部ID
    // return : 人员LIST
    public func MF_GetJLB_Groups(jlbid : String) ->[String] {
        
        return ["01&管理员","02&一级","03&二级","04&三级","05&四级"]
        
    }
    
    //取得某一俱乐部内，不同组的人员列表
    // agr1 : 俱乐部ID
    // return : 人员LIST
    public func MF_GetJLB_UserByGroup(palluserlist : [JLB_UserList_ALL_Structs],pgrouplist : [String]) ->[JLB_UserList_ByGroup_Structs] {

        var list = [JLB_UserList_ByGroup_Structs]()
        for i in pgrouplist{
            var userlist = [JLB_UserList_ALL_Structs]()
            let index1 = i.index(i.startIndex, offsetBy: 2)
            let index2 = i.index(i.startIndex, offsetBy: 3)
            for j in palluserlist {
                if i.substring(to: index1) == j.JLB_UserGroupID {
                    userlist.append(j)
                }
            }
            
            
            list.append(JLB_UserList_ByGroup_Structs(JLB_UserGroupID: i.substring(to: index1),JLB_UserGroupName : i.substring(from: index2), JLB_UserList: userlist))

        }
        
        return list
    }
    
    
}

