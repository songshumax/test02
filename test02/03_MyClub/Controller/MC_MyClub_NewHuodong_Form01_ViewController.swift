//
//  MC_MyClub_NewHuodong_Form01_ViewController.swift
//  test02
//
//  Created by Rgs on 2018/01/31.
//  Copyright © 2018年 lijs. All rights reserved.
//

import UIKit
import SwiftForms

class MC_MyClub_NewHuodong_Form01_ViewController: FormViewController,UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "活动信息"
        
        //创建form实例
        let form = FormDescriptor()
        form.title = "Example form"
        
        //第一个section分区
        let section1 = FormSectionDescriptor(headerTitle: nil, footerTitle: nil)
        //用户名
        var row = FormRowDescriptor(tag: "hdname", type: .text, title: "活动名称")
        row.configuration.cell.appearance =
            ["textField.placeholder" : "活动名称" as AnyObject,
             "textField.textAlignment" : NSTextAlignment.left.rawValue as AnyObject]
        
        section1.rows.append(row)
        //密码
        row = FormRowDescriptor(tag: "starttime", type: .dateAndTime, title: "开始时间")
        section1.rows.append(row)
        row = FormRowDescriptor(tag: "endtime", type: .dateAndTime, title: "结束时间")
//        row = FormRowDescriptor(tag: "starttime", type: .password, title: "")
//        row.configuration.cell.appearance =
//            ["textField.placeholder" : "开始时间" as AnyObject,
//             "textField.textAlignment" : NSTextAlignment.left.rawValue as AnyObject]
        section1.rows.append(row)
        
        row = FormRowDescriptor(tag: "feiyong", type: .decimal, title: "费用")
        section1.rows.append(row)
        
        
        row = FormRowDescriptor(tag: "windows", type: .unknown, title: "Windows")
        row.configuration.cell.cellClass = MC_MyClub_NewHD_MapSelectCell.self
        
//        row.configuration.cell.didUpdateClosure = { row in
//            print("b")
//            print("type：\(row.type)")
//            print("tag：\(row.tag)")
//            print("title：\(row.title!)")
//            print("value：\(row.value!)")
//        }
//        let label = UILabel()
//        label.text = "Map"
//        row.configuration.cell.appearance["titleLabel"] = label as AnyObject
        section1.rows.append(row)
        
        
        
        
        //第二个section分区
        let section2 = FormSectionDescriptor(headerTitle: nil, footerTitle: nil)
        //详细说明
        row = FormRowDescriptor(tag: "text", type: .multilineText, title: "详细说明")
//        row.configuration.cell.appearance = ["" ]
        section2.rows.append(row)
        
        
        //第三个section分区
        let section3 = FormSectionDescriptor(headerTitle: nil, footerTitle: nil)
        //提交按钮
        row = FormRowDescriptor(tag: "button", type: .button, title: "登录")
        row.configuration.button.didSelectClosure = { _ in
            self.submit()
        }
        section3.rows.append(row)
        
        //将两个分区添加到form中
        form.sections = [section1, section2,section3]
        self.form = form
    }
    
    //登录按钮点击
    func submit() {
        //取消当前编辑状态
        self.view.endEditing(true)
        
        //将表单中输入的内容打印出来
        let message = self.form.formValues().description
        print(message)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
