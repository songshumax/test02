//
//  Common_Profile_Group.swift
//  test02
//
//  Created by fangli on 2018/9/6.
//  Copyright © 2018年 lijs. All rights reserved.
//

import UIKit
import SwiftyFORM

class Common_Profile_Event: FormViewController {
    
    override func populate(_ builder: FormBuilder) {
        builder.navigationTitle = "活动详细"
        builder += ViewControllerFormItem().title("查看/编辑活动详细").storyboard("EventContent", bundle: nil)
        builder += ViewControllerFormItem().title("二维码").viewController(Common_QRCodeContorller.self)
        notes.value = "sdfsldfjlksjdflksjdflaksjdfl;aksjdfl;kxnvkjc;aksjdf;laksjdfl;aksjdfl;aksjdfa;lksjdfal;ksjdfa;lskfdja;lksdjfa;lskdfja;slkdjfa;lskfjdal;skfdjal;skfdjal;skdjfal;skfdja;slkfja;slkdfj"
        builder += notes
        builder += ViewControllerFormItem().title("查找").viewController(Common_PopTextContorller_02.self)
        
        builder += noMessage
        builder += topMessage
        builder += TextFieldFormItem().title("昵称设定").placeholder("请输入昵称").keyboardType(.default)
        builder += report
        builder += deleteCacheButton
    }
    
    lazy var notes: TextViewFormItem = {
        let instance = TextViewFormItem()
        instance.title("公告")
        return instance
    }()
    
    lazy var noMessage: SwitchFormItem = {
        let instance = SwitchFormItem()
        instance.title = "消息免打扰"
        instance.value = true
        return instance
    }()
    
    lazy var topMessage: SwitchFormItem = {
        let instance = SwitchFormItem()
        instance.title = "置顶"
        instance.value = true
        return instance
    }()
    
    lazy var report: OptionPickerFormItem = {
        let instance = OptionPickerFormItem()
        instance.title("举报").placeholder("")
        instance.append("赌博").append("黄色").append("谣言")
        instance.selectOptionWithTitle("赌博")
        return instance
    }()
    
    lazy var deleteCacheButton: ButtonFormItem = {
        let instance = ButtonFormItem()
        instance.title = "清除记录"
        instance.action = { [weak self] in
//            self?.form_simpleAlert("清除记录", "Button clicked")
            let alertController = UIAlertController(title: "系统提示",
                                                    message: "您确定要删除消息吗", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
            let okAction = UIAlertAction(title: "好的", style: .default, handler: {
                action in
                print("点击了确定")
            })
            alertController.addAction(cancelAction)
            alertController.addAction(okAction)
            self?.present(alertController, animated: true, completion: nil)
            
        }
        return instance
    }()
    
    
    
}

