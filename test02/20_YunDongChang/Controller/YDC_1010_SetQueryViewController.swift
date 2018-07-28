//
//  YDC_1010_SetQueryViewController.swift
//  test02
//
//  Created by fangli on 2018/7/18.
//  Copyright © 2018年 lijs. All rights reserved.
//

import Foundation
import UIKit
import TangramKit
import SwiftyJSON

class YDC_1010_SetQueryViewController: UIViewController {
    
    weak var contentLayout:TGLinearLayout!
    var sTagHeight:CGFloat = 40
    var sTagWidth:CGFloat = 70
    
    let titleLabel3 = UILabel()
    
    fileprivate var itemDataSouce = [YDC_Model02]()
//    fileprivate var itemDataSouce2 = [YDC_Model02]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        fetchData()
        
        let scrollView = UIScrollView(frame:self.view.bounds)
        scrollView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.view.addSubview(scrollView)
        
        
        let rootLayout = TGLinearLayout(.vert)
        rootLayout.backgroundColor = .white
        rootLayout.tg_width.equal(.fill)
        rootLayout.tg_height.equal(.wrap)
        rootLayout.tg_gravity = TGGravity.horz.fill
        scrollView.addSubview(rootLayout)
        
        
        //添加数据内容布局
        let contentLayout = TGLinearLayout(.vert)
        contentLayout.tg_height.equal(.wrap)
        contentLayout.backgroundColor = CFTool.color(0)
        contentLayout.tg_gravity = TGGravity.horz.fill
        contentLayout.tg_vspace = 10
        contentLayout.tg_padding = UIEdgeInsetsMake(10, 0, 10, 0);
        rootLayout.addSubview(contentLayout)
        self.contentLayout = contentLayout
        
        //默认第一个风格。
        self.style1Layout(self.contentLayout)
        
        
        
    }

    fileprivate func fetchData() {
        
        guard let JSONData = Data.ts_dataFromJSONFile("sportstype") else { return }
        do {
            let jsonObject = try JSON(data: JSONData)
            var list = [YDC_Model02]()
            for dict in jsonObject["data"].arrayObject! {
    //                        let a = dict["sportstypedetails"] as! [String : Any]
    //                        guard let model = TSMapper<YDC_Model02>().map(JSON: dict as! [String : Any]) else
                guard let model = TSMapper<YDC_Model02>().map(JSON: dict as! [String : Any]) else
                { continue }
                
                list.insert(model, at: list.count)
            }
            //Insert more data, make the UITableView long and long.  XD
            self.itemDataSouce.insert(contentsOf: list, at: 0)


        } catch {
            print("Error \(error)")
        }
    }
    
    //样式1布局： 每行放4个标签，标签宽度不固定，标签之间的间距固定。
    func style1Layout(_ contentLayout:TGLinearLayout)
    {
        var  partIndex = 0
        for dict in itemDataSouce
        {
            let floatLayout = TGFloatLayout(.vert)
            floatLayout.backgroundColor = .white
            floatLayout.tg_padding = UIEdgeInsetsMake(20, 10, 20, 10);
            floatLayout.tg_height.equal(.wrap)
            floatLayout.tg_hspace = 30 //设置浮动布局里面子视图之间的水平间距。
            floatLayout.tg_vspace = 10 //设置浮动布局里面子视图之间的垂直间距。
            contentLayout.addSubview(floatLayout)
            
            //添加标题文本。
            let titleLabel = UILabel()
            titleLabel.text = dict.SportsTypeName
            titleLabel.textColor = CFTool.color(4)
            titleLabel.font = CFTool.font(16)
            titleLabel.tg_width.equal(100%)  //标题部分占据全部的宽度，独占一行。所以
            titleLabel.tg_bottom.equal(5) //设置底部边距，这样下面的内容都和这个视图距离5个点。
            titleLabel.sizeToFit()
            floatLayout.addSubview(titleLabel)
            
            //记录一下每个section的最后的tag视图。原因是每个section的开头都和前一部分有一定的距离。
//            var lastTagView:UIView! = nil

            let sectionDicts = dict.YDCModel03
            
            //创建tag部分的视图。
//            lastTagView = nil
            var tagIndex = 0

            for sectionDict in sectionDicts!
            {
                let tagView = self.createTagView(sectionDict.SportsName!)
                //宽度是布局视图宽度的1/4，因为视图之间是有间距的，所以这里每个视图的宽度都要再减去3/4的间距值。
                tagView.tg_width.equal(floatLayout.tg_width, increment:-3.0 / 4.0 * floatLayout.tg_hspace, multiple:1.0/4.0)
                //高度是固定的40
                tagView.tg_height.equal(sTagHeight)
                floatLayout.addSubview(tagView)
//                lastTagView = tagView;
                
                tagView.tag = (partIndex * 1000) * 1000 + tagIndex;
                tagIndex += 1
          
            }
            partIndex += 1
        }
        
        let floatLayout3 = TGFloatLayout(.vert)
        floatLayout3.backgroundColor = .white
        floatLayout3.tg_padding = UIEdgeInsetsMake(20, 10, 20, 10);
        floatLayout3.tg_height.equal(.wrap)
        floatLayout3.tg_hspace = 30 //设置浮动布局里面子视图之间的水平间距。
        floatLayout3.tg_vspace = 10 //设置浮动布局里面子视图之间的垂直间距。
        contentLayout.addSubview(floatLayout3)
        
        titleLabel3.text = "距离"
        titleLabel3.textColor = CFTool.color(4)
        titleLabel3.font = CFTool.font(16)
        titleLabel3.tg_width.equal(100%)  //标题部分占据全部的宽度，独占一行。所以
        titleLabel3.tg_bottom.equal(5) //设置底部边距，这样下面的内容都和这个视图距离5个点。
        titleLabel3.sizeToFit()
        floatLayout3.addSubview(titleLabel3)
        
        let slider = UISlider()
        slider.minimumValue = 1.0
        slider.maximumValue = 50.0
        slider.minimumTrackTintColor = UIColor.yellow
        slider.maximumTrackTintColor = UIColor.red
        slider.setValue(20.0, animated: true)
        slider.tg_width.equal(100%)  //标题部分占据全部的宽度，独占一行。所以
        slider.tg_bottom.equal(5) //设置底部边距，这样下面的内容都和这个视图距离5个点。
        slider.sizeToFit()
        
        slider.isContinuous = false
        // 响应事件
        slider.addTarget(self, action: #selector(sliderValueChange), for: .valueChanged)
        floatLayout3.addSubview(slider)
        sliderValueChange(slider: slider)
        
        
        
        let floatLayout4 = TGFloatLayout(.vert)
        floatLayout4.backgroundColor = .white
        floatLayout4.tg_padding = UIEdgeInsetsMake(20, 10, 20, 10);
        floatLayout4.tg_height.equal(.wrap)
        floatLayout4.tg_hspace = 30 //设置浮动布局里面子视图之间的水平间距。
        floatLayout4.tg_vspace = 10 //设置浮动布局里面子视图之间的垂直间距。
        contentLayout.addSubview(floatLayout4)
        
        //添加标题文本。
        let titleLabel4 = UILabel()
        titleLabel4.text = "时间"
        titleLabel4.textColor = CFTool.color(4)
        titleLabel4.font = CFTool.font(16)
        titleLabel4.tg_width.equal(100%)  //标题部分占据全部的宽度，独占一行。所以
        titleLabel4.tg_bottom.equal(5) //设置底部边距，这样下面的内容都和这个视图距离5个点。
        titleLabel4.sizeToFit()
        floatLayout4.addSubview(titleLabel4)
        
        let datepickers = UIDatePicker(frame: CGRect(x:0, y:0, width: self.view.frame.width, height : 300))

        datepickers.backgroundColor = CFTool.color(7)

//        datepickers.tg_width.equal(floatLayout4.tg_width, increment: -floatLayout4.tg_hspace, multiple:1.0/2.0)
        datepickers.tg_bottom.equal(5) //设置底部边距，这样下面的内容都和这个视图距离5个点。
        datepickers.sizeToFit()
        datepickers.datePickerMode = .dateAndTime
        datepickers.layer.borderWidth = 1
        datepickers.layer.borderColor = UIColor.gray.cgColor
        datepickers.timeZone = TimeZone.current
        datepickers.tg_width.equal(100%)  //标题部分占据全部的宽度，独占一行。所以
        datepickers.locale = Locale.init(identifier: "zh_CN")
        datepickers.addTarget(self,action:#selector(dateChanged),for:.valueChanged)
        floatLayout4.addSubview(datepickers)

        let datepickere = UIDatePicker()
        datepickere.backgroundColor = CFTool.color(7)
//        datepickere.tg_width.equal(floatLayout4.tg_width, increment: -floatLayout4.tg_hspace, multiple:1.0/2.0)
        datepickere.tg_width.equal(100%)  //标题部分占据全部的宽度，独占一行。所以
        datepickere.tg_bottom.equal(5) //设置底部边距，这样下面的内容都和这个视图距离5个点。
        datepickere.sizeToFit()
        datepickere.datePickerMode = .dateAndTime
        datepickere.layer.borderWidth = 1
        datepickere.layer.borderColor = UIColor.gray.cgColor
        datepickere.locale = Locale.init(identifier: "zh_CN")
        datepickere.timeZone = TimeZone.current
        datepickere.addTarget(self,action:#selector(dateChanged),for:.valueChanged)
//        datepickere.addTarget(self, action: #selector(dateChanged2( _:)), for:UIControlEvents.valueChanged)
        floatLayout4.addSubview(datepickere)
        
        
        
        let floatLayout2 = TGFloatLayout(.horz)
        floatLayout2.backgroundColor = .white
        floatLayout2.tg_padding = UIEdgeInsetsMake(20, 10, 20, 10);
        floatLayout2.tg_height.equal(.wrap)
        floatLayout2.tg_hspace = 30 //设置浮动布局里面子视图之间的水平间距。
        floatLayout2.tg_vspace = 10 //设置浮动布局里面子视图之间的垂直间距。
        contentLayout.addSubview(floatLayout2)
        
        //添加标题文本。
        let btn = UIButton()
        btn.setTitle("设定", for: .normal)
        btn.backgroundColor = CFTool.color(1)
        btn.titleLabel?.font = CFTool.font(16)
        btn.tg_width.equal(floatLayout2.tg_width, increment: -floatLayout2.tg_hspace, multiple:1.0/2.0)
        btn.tg_bottom.equal(5) //设置底部边距，这样下面的内容都和这个视图距离5个点。
        btn.sizeToFit()
        btn.addTarget(self,action:#selector(backToYDCmain),for:.touchUpInside)
        floatLayout2.addSubview(btn)
        
        //添加标题文本。
        let btn2 = UIButton()
        btn2.setTitle("取消", for: .normal)
        btn2.backgroundColor = CFTool.color(1)
        btn2.titleLabel?.font = CFTool.font(16)
        btn2.tg_width.equal(floatLayout2.tg_width, increment: -floatLayout2.tg_hspace, multiple:1.0/2.0)
        btn2.tg_bottom.equal(5) //设置底部边距，这样下面的内容都和这个视图距离5个点。
        btn2.sizeToFit()
        btn2.addTarget(self,action:#selector(backToYDCmain),for:.touchUpInside)
        floatLayout2.addSubview(btn2)
    }
    
    @objc func dateChanged(datePicker : UIDatePicker){
        //更新提醒时间文本框
        let formatter = DateFormatter()
        //日期样式
        formatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        print(formatter.string(from: datePicker.date))
        
        let  chooseDate = datePicker.date
        let  dateFormater = DateFormatter.init()
        dateFormater.dateFormat = "YYYY-MM-dd HH-mm-ss"
        print(dateFormater.string(from: chooseDate))

    }
    
    
    // MARK: - sliderValueChange
    @objc func sliderValueChange(slider:UISlider)
    {
        let value = slider.value
        titleLabel3.text = String(format: "距离：%.2f"+" 公里", arguments: [value])
    }
    
    
    @IBAction func backToYDCmain(segue:UIStoryboardSegue){
        print("返回YDC")
        self.dismiss(animated: true, completion: nil)
    }
    
    //建立标签视图
    func createTagView(_ title:String) ->UIView
    {
        let tagButton = UIButton()
        tagButton.setTitle(title,for:.normal)
        tagButton.setTitleColor(CFTool.color(9),for:.normal)
        tagButton.titleLabel?.adjustsFontSizeToFitWidth = true
        tagButton.titleLabel?.font = CFTool.font(14)
        tagButton.layer.cornerRadius = 20;
        tagButton.layer.borderColor = UIColor.lightGray.cgColor
        tagButton.layer.borderWidth = 0.5;
        tagButton.addTarget(self,action:#selector(handleTagViewTap),for:.touchUpInside)
        
        return tagButton;
    }
    
    
    @objc func handleTagViewTap(sender:UIView!)
    {
        let  partIndex = sender.tag / 1000 / 1000;
        let  tagIndex = sender.tag % 1000;
        let message = "you have select:\npartIndex:\(partIndex)\ntagIndex:\(tagIndex)"
        
        TSAlertView_show("我的title", message: message)
        
    }
}
