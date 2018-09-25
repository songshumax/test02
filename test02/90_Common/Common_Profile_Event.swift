//
//  Common_Profile_Group.swift
//  test02
//
//  Created by fangli on 2018/9/6.
//  Copyright © 2018年 lijs. All rights reserved.
//

import UIKit
import CoreLocation
import Eureka

class Common_Profile_Event: FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        URLRow.defaultCellUpdate = { cell, row in cell.textField.textColor = .blue }
        LabelRow.defaultCellUpdate = { cell, row in cell.detailTextLabel?.textColor = .orange  }
        CheckRow.defaultCellSetup = { cell, row in cell.tintColor = .orange }
        DateRow.defaultRowInitializer = { row in row.minimumDate = Date() }
        
        form +++
            
            Section()
            
            <<< PopEventDetailRow () {
                $0.title = "活动详细"
                $0.tag = "EventDetail"
            }
        
            <<< QRCodeRow() {
                $0.title = "二维码"
                $0.tag = "QRCode"
                $0.value = ""
                
            }
        
            <<< PopTextRow () {
                $0.title = "群公告"
                $0.tag = "GroupAnnouncement"
                $0.value = ""
            }
            
            <<< SwitchRow() {
                $0.title = "消息免打扰"
                $0.tag = "MessageSwith"
                $0.value = true
        }
            <<< SwitchRow() {
                $0.title = "置顶聊天"
                $0.tag = "TopChatSetting"
                $0.value = true
        }
        
        +++ Section()
            
            <<< PopTextRow () {
                $0.title = "我在本群中的昵称"
                $0.tag = "MyNicename"
                $0.value = "马云"
                $0.inputValue = $0.value
        }
    
    }
    
    @objc func multipleSelectorDone(_ item:UIBarButtonItem) {
        _ = navigationController?.popViewController(animated: true)
    }
    
}

