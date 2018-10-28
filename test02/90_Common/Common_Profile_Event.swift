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
    
    
    
}

