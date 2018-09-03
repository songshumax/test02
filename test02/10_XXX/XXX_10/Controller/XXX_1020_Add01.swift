//
//  XXX_1020_ADD01.swift
//  test02
//
//  Created by fangli on 2018/8/12.
//  Copyright © 2018年 lijs. All rights reserved.
//

//import UIKit
//import SwiftForms
//import SwiftForm
import SwiftyFORM


class XXX_1020_Add01: FormViewController {
    
    override func loadView() {
        super.loadView()
//        form_installSubmitButton()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "完成", style: .plain, target: self, action: #selector(self.form_submitAction2(_:)))
        
    }
    
    override func populate(_ builder: FormBuilder) {
        builder.navigationTitle = "新建运动"
        builder += sportsName
        builder += sportsType
        builder += datePicker_dateAndTime_currentLocale
        builder += ViewControllerFormItem().title("选择地点").viewController(XXX_102010_AddMap.self)
        builder += peopleNums
        builder += payment
        builder += endDatetime
        builder += ViewControllerFormItem().title("邀请朋友").viewController(XXX_102010_AddMap.self)
        builder += userDescription
        builder.alignLeft([sportsName, sportsType, datePicker_dateAndTime_currentLocale,peopleNums,payment,endDatetime,userDescription])
        self.tabBarController?.tabBar.isHidden = true
        
        
       
        
        
    }
    lazy var userDescription: TextViewFormItem = {
        let instance = TextViewFormItem()
        instance.title("活动说明").placeholder("请输入活动说明")
        return instance
    }()
    lazy var endDatetime: DatePickerFormItem = {
        let instance = DatePickerFormItem()
        instance.title = "报名截止"
        instance.datePickerMode = .dateAndTime
        return instance
    }()
    lazy var payment: TextFieldFormItem = {
        let instance = TextFieldFormItem()
        instance.title("参加费用").placeholder("请填费用")
        
        instance.keyboardType = .decimalPad
        instance.autocorrectionType = .no
        instance.submitValidate(CountSpecification.min(1), message: "Length must be minimum 1 digits")
        instance.validate(CountSpecification.max(7), message: "Length must be maximum 7 digits")
        return instance
    }()
    lazy var peopleNums: TextFieldFormItem = {
        let instance = TextFieldFormItem()
        instance.title("征集人数").placeholder("请填写征集人数")
        
        instance.keyboardType = .numberPad
        instance.autocorrectionType = .no
        
        
        instance.submitValidate(CountSpecification.min(1), message: "Length must be minimum 1 digits")
        instance.validate(CountSpecification.max(7), message: "Length must be maximum 7 digits")
        return instance
    }()
    lazy var sportsName: TextFieldFormItem = {
        let instance = TextFieldFormItem()
        instance.title("填写活动名称").placeholder("请填写活动名称")
        
        instance.keyboardType = .default
        instance.autocorrectionType = .no
        instance.submitValidate(CountSpecification.min(4), message: "Length must be minimum 4 digits")
        instance.validate(CountSpecification.max(20), message: "Length must be maximum 20 digits")
        return instance
    }()
    lazy var sportsType: OptionPickerFormItem = {
        let instance = OptionPickerFormItem()
        instance.title("活动类型").placeholder("请选择活动")
        instance.append("羽毛球").append("篮球").append("网球")
        instance.selectOptionWithTitle("羽毛球")
        return instance
    }()

    lazy var datePicker_dateAndTime_currentLocale: DatePickerFormItem = {
        let instance = DatePickerFormItem()
        instance.title = "活动时间"
        instance.datePickerMode = .dateAndTime
        return instance
    }()
    
    @objc public func form_submitAction2(_ sender: AnyObject?) {
//        formBuilder.validateAndUpdateUI()
//        let result = formBuilder.validate()
//        SwiftyFormLog("result \(result)")
//        form_showSubmitResult(result)
        self.navigationController?.popToRootViewController(animated: true)
//        popViewControllerAnimated(true)
        print("2323")
    }
    
    /// Used internally by the `form_installSubmitButton()` function
    public func form_showSubmitResult2(_ result: FormBuilder.FormValidateResult) {
        switch result {
        case .valid:
            form_simpleAlert("Valid", "All the fields are valid")
        case let .invalid(item, message):
            let title = item.elementIdentifier ?? "Invalid"
            form_simpleAlert(title, message)
        }
    }
   
    
}
