//
//  MC_MyClub_NewHD_MapSelect.swift
//  test02
//
//  Created by Rgs on 2018/02/12.
//  Copyright © 2018年 lijs. All rights reserved.
//


import UIKit
import SwiftForms

extension MC_MyClub_NewHD_MapSelectCell {
    class func currentViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return currentViewController(base: nav.visibleViewController)
            
        }
        if let tab = base as? UITabBarController {
            return currentViewController(base: tab.selectedViewController)
            
        }
        if let presented = base?.presentedViewController {
            return currentViewController(base: presented)
            
        }
        return base
        
    }
    
}


class MC_MyClub_NewHD_MapSelectCell: FormBaseCell ,UITextFieldDelegate{
    //左侧图片视图
//    open let headImageView = UIImageView()
    //右侧输入框
    open let textField = UITextField()
    
    open let titleLabel = UILabel()
  
    //初始化配置（只会在单元格创建完毕后调用一次）
    override func configure() {
        super.configure()
        //去除选中样式
        selectionStyle = .none
        //图片保持比例缩放
//        headImageView.contentMode = .scaleAspectFill
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
        contentView.addSubview(titleLabel)
        
        //设置遮罩
//        headImageView.layer.masksToBounds = true
        //输入框文字样式
        textField.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
        //输入框内容编辑响应时间
        textField.addTarget(self, action: #selector(MC_MyClub_NewHD_MapSelectCell.editingChanged(_:)),for: .editingChanged)
        
        textField.delegate = self
        
        textField.clearButtonMode = UITextFieldViewMode.whileEditing
        //将组件添加到视图中
        //contentView.addSubview(headImageView)
        contentView.addSubview(textField)
        
    
        
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("我要开始编辑了...")
        
        let theViewControllerYouSee = MC_MyClub_NewHD_MapSelectCell.currentViewController()
        
        theViewControllerYouSee?.performSegue(withIdentifier: "MyClubNewHuoDong03", sender: self)
        
        return true
    }
    
    
    
    //每次需要更新单元格是都会调用
    override func update() {
        super.update()
        //设置输入框文
        textField.text = rowDescriptor?.value as? String
        textField.placeholder = rowDescriptor?.configuration.cell.placeholder
        textField.isSecureTextEntry = false
        textField.clearButtonMode = .whileEditing
        
        titleLabel.text = "Map"
        
    }
    //布局
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //圆形图标直径为单元格高度的3/4
        let diameter = super.frame.height / 4 * 3
        //设置图标的尺寸、位置
        titleLabel.frame.size = CGSize(width: diameter, height: diameter)
        titleLabel.center = CGPoint(x:diameter, y: super.frame.height / 2)
        //设置圆角半径(宽度的一半)，显示成圆形。
//        headImageView.layer.cornerRadius = diameter / 2
        //设置输入框的尺寸和位置
        textField.frame = CGRect(x: diameter * 2, y: 0,width: super.frame.width - diameter * 2,height: super.frame.height)
        
    }
    //输入框内容编辑
    internal func editingChanged(_ sender: UITextField) {
        guard let text = sender.text, text.characters.count > 0
            else { rowDescriptor?.value = nil; update(); return }
        rowDescriptor?.value = text as AnyObject
        
    }
}
