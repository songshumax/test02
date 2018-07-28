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

class YDC_1010_SetQueryViewController_v10: UIViewController {
    
    fileprivate var itemDataSouce = [YDC_Model02]()
//    fileprivate var itemDataSouce2 = [YDC_Model02]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func loadView() {
        /*
         这个例子主要是用来展示数量约束流式布局对分页滚动能力的支持。
         */
        let scrollView = UIScrollView()
        scrollView.delaysContentTouches = false  //因为里面也有滚动视图，优先处理子滚动视图的事件。
        self.view = scrollView
        
        let rootLayout = TGFlowLayout(.vert, arrangedCount:1)
        rootLayout.backgroundColor = .white
        rootLayout.tg_width.equal(.fill)
        rootLayout.tg_height.equal(.wrap)
        rootLayout.tg_gravity = TGGravity.horz.fill  //里面的所有子视图和布局视图宽度一致。
        scrollView.addSubview(rootLayout)
        
        fetchData()
        
        //创建一个水平数量流式布局分页从左到右滚动
        self.query1(rootLayout)
//        self.query2(rootLayout)
//        self.query3(rootLayout)
//        self.query4(rootLayout)

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
    
    //添加所有测试子条目视图。
    func addAllItemSubviews(_ flowLayout:TGFlowLayout, mode: YDC_Model02)
    {
        
        for i in mode.YDCModel03!
        {
            let label = UILabel()
            label.textAlignment = .center
            label.backgroundColor = UIColor.blue
            label.text = i.SportsName
            flowLayout.addSubview(label)
            
        }
    }
    
    /**
     *  创建一个水平分页从左向右滚动的流式布局
     */
    func query1(_ rootLayout: UIView)
    {
        
        for item in itemDataSouce {
            let titleLabel = UILabel()
            titleLabel.text = item.SportsTypeName
            titleLabel.sizeToFit()
            titleLabel.tg_top.equal(20)
            rootLayout.addSubview(titleLabel)
            
            //要开启分页功能，必须要将流式布局加入到一个滚动视图里面作为子视图！！！
            let  scrollView = UIScrollView()
            scrollView.isPagingEnabled = true  //开启分页滚动模式！！您可以注释这句话看看非分页滚动的布局滚动效果。
            scrollView.tg_height.equal(60)   //设置明确的高度为200，因为宽度已经由父线性布局的gravity属性确定了，所以不需要设置了。
            rootLayout.addSubview(scrollView)
            
            
            //建立一个水平数量约束流式布局:每列展示3个子视图,每页展示9个子视图，整体从左往右滚动。
            let flowLayout = TGFlowLayout(.horz, arrangedCount:1)
            flowLayout.tg_pagedCount = 4 //tg_pagedCount设置为非0时表示开始分页展示的功能，这里表示每页展示9个子视图，这个数量必须是tg_arrangedCount的倍数。
            flowLayout.tg_width.equal(.wrap) //设置布局视图的宽度由子视图包裹，当水平流式布局的这个属性设置为YES，并和pagedCount搭配使用会产生分页从左到右滚动的效果。
            flowLayout.tg_height.equal(scrollView) //因为是分页从左到右滚动，因此布局视图的高度必须设置为和父滚动视图相等。
            /*
             上面是实现一个水平流式布局分页且从左往右滚动的标准属性设置方法。
             */
            
            
            flowLayout.tg_hspace = 10
            flowLayout.tg_vspace = 10  //设置子视图的水平和垂直间距。
            flowLayout.tg_padding = UIEdgeInsetsMake(5, 5, 5, 5) //布局视图的内边距设置！您可以注释掉这句话看看效果！如果设置内边距且也有分页时请将这个值设置和子视图间距相等。
            scrollView.addSubview(flowLayout)
            flowLayout.backgroundColor = UIColor.white
            
            
            self.addAllItemSubviews(flowLayout, mode: item)
            
            //获取流式布局的横屏size classes，并且设置当设备处于横屏时每页的数量由9个变为了18个。您可以注释掉这段代码，然后横竖屏切换看看效果。
            let flowLayoutSC = flowLayout.tg_fetchSizeClass(with:.landscape, from:.default) as! TGFlowLayoutViewSizeClass
            flowLayoutSC.tg_pagedCount = 18

        }
    }

//    /**
//     *  创建一个水平分页从左向右滚动的流式布局
//     */
//    func query2(_ rootLayout: UIView)
//    {
//        let titleLabel = UILabel()
//        titleLabel.text = "对抗项目"
//        titleLabel.sizeToFit()
//        titleLabel.tg_top.equal(20)
//        rootLayout.addSubview(titleLabel)
//
//        //要开启分页功能，必须要将流式布局加入到一个滚动视图里面作为子视图！！！
//        let  scrollView = UIScrollView()
//        scrollView.isPagingEnabled = true  //开启分页滚动模式！！您可以注释这句话看看非分页滚动的布局滚动效果。
//        scrollView.tg_height.equal(60)   //设置明确的高度为200，因为宽度已经由父线性布局的gravity属性确定了，所以不需要设置了。
//        rootLayout.addSubview(scrollView)
//
//
//        //建立一个水平数量约束流式布局:每列展示3个子视图,每页展示9个子视图，整体从左往右滚动。
//        let flowLayout = TGFlowLayout(.horz, arrangedCount:1)
//        flowLayout.tg_pagedCount = 4 //tg_pagedCount设置为非0时表示开始分页展示的功能，这里表示每页展示9个子视图，这个数量必须是tg_arrangedCount的倍数。
//        flowLayout.tg_width.equal(.wrap) //设置布局视图的宽度由子视图包裹，当水平流式布局的这个属性设置为YES，并和pagedCount搭配使用会产生分页从左到右滚动的效果。
//        flowLayout.tg_height.equal(scrollView) //因为是分页从左到右滚动，因此布局视图的高度必须设置为和父滚动视图相等。
//        /*
//         上面是实现一个水平流式布局分页且从左往右滚动的标准属性设置方法。
//         */
//
//
//        flowLayout.tg_hspace = 10
//        flowLayout.tg_vspace = 10  //设置子视图的水平和垂直间距。
//        flowLayout.tg_padding = UIEdgeInsetsMake(5, 5, 5, 5) //布局视图的内边距设置！您可以注释掉这句话看看效果！如果设置内边距且也有分页时请将这个值设置和子视图间距相等。
//        scrollView.addSubview(flowLayout)
//        flowLayout.backgroundColor = UIColor.white
//
//
//        self.addAllItemSubviews(flowLayout)
//
//        //获取流式布局的横屏size classes，并且设置当设备处于横屏时每页的数量由9个变为了18个。您可以注释掉这段代码，然后横竖屏切换看看效果。
//        let flowLayoutSC = flowLayout.tg_fetchSizeClass(with:.landscape, from:.default) as! TGFlowLayoutViewSizeClass
//        flowLayoutSC.tg_pagedCount = 18
//    }
//
//    /**
//     *  创建一个水平分页从左向右滚动的流式布局
//     */
//    func query3(_ rootLayout: UIView)
//    {
//        let titleLabel = UILabel()
//        titleLabel.text = "休闲娱乐"
//        titleLabel.sizeToFit()
//        titleLabel.tg_top.equal(20)
//        rootLayout.addSubview(titleLabel)
//
//        //要开启分页功能，必须要将流式布局加入到一个滚动视图里面作为子视图！！！
//        let  scrollView = UIScrollView()
//        scrollView.isPagingEnabled = true  //开启分页滚动模式！！您可以注释这句话看看非分页滚动的布局滚动效果。
//        scrollView.tg_height.equal(60)   //设置明确的高度为200，因为宽度已经由父线性布局的gravity属性确定了，所以不需要设置了。
//        rootLayout.addSubview(scrollView)
//
//
//        //建立一个水平数量约束流式布局:每列展示3个子视图,每页展示9个子视图，整体从左往右滚动。
//        let flowLayout = TGFlowLayout(.horz, arrangedCount:1)
//        flowLayout.tg_pagedCount = 4 //tg_pagedCount设置为非0时表示开始分页展示的功能，这里表示每页展示9个子视图，这个数量必须是tg_arrangedCount的倍数。
//        flowLayout.tg_width.equal(.wrap) //设置布局视图的宽度由子视图包裹，当水平流式布局的这个属性设置为YES，并和pagedCount搭配使用会产生分页从左到右滚动的效果。
//        flowLayout.tg_height.equal(scrollView) //因为是分页从左到右滚动，因此布局视图的高度必须设置为和父滚动视图相等。
//        /*
//         上面是实现一个水平流式布局分页且从左往右滚动的标准属性设置方法。
//         */
//
//
//        flowLayout.tg_hspace = 10
//        flowLayout.tg_vspace = 10  //设置子视图的水平和垂直间距。
//        flowLayout.tg_padding = UIEdgeInsetsMake(5, 5, 5, 5) //布局视图的内边距设置！您可以注释掉这句话看看效果！如果设置内边距且也有分页时请将这个值设置和子视图间距相等。
//        scrollView.addSubview(flowLayout)
//        flowLayout.backgroundColor = UIColor.white
//
//
//        self.addAllItemSubviews(flowLayout)
//
//        //获取流式布局的横屏size classes，并且设置当设备处于横屏时每页的数量由9个变为了18个。您可以注释掉这段代码，然后横竖屏切换看看效果。
//        let flowLayoutSC = flowLayout.tg_fetchSizeClass(with:.landscape, from:.default) as! TGFlowLayoutViewSizeClass
//        flowLayoutSC.tg_pagedCount = 18
//    }
//
//    /**
//     *  创建一个水平分页从左向右滚动的流式布局
//     */
//    func query4(_ rootLayout: UIView)
//    {
//        let titleLabel = UILabel()
//        titleLabel.text = "室内娱乐"
//        titleLabel.sizeToFit()
//        titleLabel.tg_top.equal(20)
//        rootLayout.addSubview(titleLabel)
//
//        //要开启分页功能，必须要将流式布局加入到一个滚动视图里面作为子视图！！！
//        let  scrollView = UIScrollView()
//        scrollView.isPagingEnabled = true  //开启分页滚动模式！！您可以注释这句话看看非分页滚动的布局滚动效果。
//        scrollView.tg_height.equal(60)   //设置明确的高度为200，因为宽度已经由父线性布局的gravity属性确定了，所以不需要设置了。
//        rootLayout.addSubview(scrollView)
//
//
//        //建立一个水平数量约束流式布局:每列展示3个子视图,每页展示9个子视图，整体从左往右滚动。
//        let flowLayout = TGFlowLayout(.horz, arrangedCount:1)
//        flowLayout.tg_pagedCount = 4 //tg_pagedCount设置为非0时表示开始分页展示的功能，这里表示每页展示9个子视图，这个数量必须是tg_arrangedCount的倍数。
//        flowLayout.tg_width.equal(.wrap) //设置布局视图的宽度由子视图包裹，当水平流式布局的这个属性设置为YES，并和pagedCount搭配使用会产生分页从左到右滚动的效果。
//        flowLayout.tg_height.equal(scrollView) //因为是分页从左到右滚动，因此布局视图的高度必须设置为和父滚动视图相等。
//        /*
//         上面是实现一个水平流式布局分页且从左往右滚动的标准属性设置方法。
//         */
//
//
//        flowLayout.tg_hspace = 10
//        flowLayout.tg_vspace = 10  //设置子视图的水平和垂直间距。
//        flowLayout.tg_padding = UIEdgeInsetsMake(5, 5, 5, 5) //布局视图的内边距设置！您可以注释掉这句话看看效果！如果设置内边距且也有分页时请将这个值设置和子视图间距相等。
//        scrollView.addSubview(flowLayout)
//        flowLayout.backgroundColor = UIColor.white
//
//
//        self.addAllItemSubviews(flowLayout)
//
//        //获取流式布局的横屏size classes，并且设置当设备处于横屏时每页的数量由9个变为了18个。您可以注释掉这段代码，然后横竖屏切换看看效果。
//        let flowLayoutSC = flowLayout.tg_fetchSizeClass(with:.landscape, from:.default) as! TGFlowLayoutViewSizeClass
//        flowLayoutSC.tg_pagedCount = 18
//    }
    
}
