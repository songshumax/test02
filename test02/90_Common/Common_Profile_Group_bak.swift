//
//  Common_Profile_Group.swift
//  test02
//
//  Created by fangli on 2018/9/6.
//  Copyright © 2018年 lijs. All rights reserved.
//

import UIKit
import SwiftyFORM

class Common_Profile_Group_bak: FormViewController {
    
    override func populate(_ builder: FormBuilder) {
        builder.navigationTitle = "群设定"
        builder += StaticTextFormItem().title("群名称").value("周末羽毛球群")
        builder += longSummary2
        builder += ViewControllerFormItem().title("群二维码").viewController(Common_Profile_Group.self)
        builder += subscribeToNewsletter
        builder += longSummary3
        let aa = Common_TableView01()
        let bb = Get_UserProfiles_Model()
        aa.itemDataSouce = bb.fetch_UserProfiles()
        let cc = ViewControllerFormItem()
//        let mm = UIViewController()
        cc.title("群成员")
        cc.viewController(Common_TableView01.self)
        
        
//        cc.createViewController = aa
        builder += cc //ViewControllerFormItem().title("群成员").createViewController
        builder += randomizeButton
    }
    
    
    lazy var longSummary2: TextViewFormItem = {
        let instance = TextViewFormItem()
        instance.title("群公告").placeholder("请输入群公告")
        instance.value = ""
        return instance
    }()
    
    lazy var subscribeToNewsletter: SwitchFormItem = {
        let instance = SwitchFormItem()
        instance.title = "消息免打扰"
        instance.value = true
        return instance
    }()
    
    lazy var longSummary3: TextViewFormItem = {
        let instance = TextViewFormItem()
        instance.title("我在本群昵称").placeholder("")
        instance.value = ""
        return instance
    }()
    
    lazy var randomizeButton: ButtonFormItem = {
        let instance = ButtonFormItem()
        instance.title = "删除并退出"
        instance.action = { [weak self] in
            self?.randomize()
        }
        return instance
    }()
    
    func randomize() {
        print("22")
    }
    
    
}

