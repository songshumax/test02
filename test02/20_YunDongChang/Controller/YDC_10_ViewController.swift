//
//  XXX_10_ViewController.swift
//  test02
//
//  Created by fangli on 2018/6/23.
//  Copyright © 2018年 lijs. All rights reserved.
//

import UIKit
import SwiftyJSON
import SnapKit

class YDC_10_ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    fileprivate var itemDataSouce = [YDC_Model01]()
    fileprivate var itemDataSouce1 = [YDC_Model01]()
    fileprivate var itemDataSouce2 = [YDC_Model01]()
    fileprivate var itemDataSouce3 = [YDC_Model01]()
    fileprivate var itemDataSouce4 = [YDC_Model01]()
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var selectChange: UISegmentedControl!
    
    
    var popMenu:SwiftPopMenu!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let itemleft = UIBarButtonItem(title: "条件设定", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.btnitemleft(sender:)))
        let itemright = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(self.btnitemright(sender:)))
        
        self.navigationItem.rightBarButtonItem = itemright
        self.navigationItem.leftBarButtonItem = itemleft
        self.title = "运动场"
        
        self.tableview.ts_registerCellNib(YDC_10_TableViewCell.self)
        self.tableview.estimatedRowHeight = 65
        self.tableview.tableFooterView = UIView()
        
//        tableview.delegate = self
//        tableview.dataSource
        setupDate()
        
        showTableView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 5
        return self.itemDataSouce.count
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.tableview.estimatedRowHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: YDC_10_TableViewCell = tableView.ts_dequeueReusableCell(YDC_10_TableViewCell.self)
        cell.setCellContnet(self.itemDataSouce[indexPath.row])
        return cell
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
        
    }
    
    @IBAction func selectChanged(_ sender: Any) {
        showTableView()
        tableview.reloadData()
    }
    
    func showTableView() {
        switch(selectChange.selectedSegmentIndex)
        {
        case 0:
            
            itemDataSouce = itemDataSouce1
            break
        case 1:
            
            itemDataSouce = itemDataSouce2
            break
        case 2:
            
            itemDataSouce = itemDataSouce3
            break
        case 3:
            
            itemDataSouce = itemDataSouce4
            break
            
        default:
            break
        }
        
//        tableview.reloadData()
        
    }
    
    fileprivate func fetchData1() {
        guard let JSONData = Data.ts_dataFromJSONFile("ydc1") else { return }
        do {
            let jsonObject = try JSON(data: JSONData)
            var list = [YDC_Model01]()
            for dict in jsonObject["data"].arrayObject! {
                guard let model = TSMapper<YDC_Model01>().map(JSON: dict as! [String : Any]) else { continue }
                list.insert(model, at: list.count)
            }
            //Insert more data, make the UITableView long and long.  XD
            self.itemDataSouce1.insert(contentsOf: list, at: 0)
            
            
        } catch {
            print("Error \(error)")
        }
    }
    
    fileprivate func fetchData2() {
        guard let JSONData = Data.ts_dataFromJSONFile("ydc2") else { return }
        do {
            let jsonObject = try JSON(data: JSONData)
            var list = [YDC_Model01]()
            for dict in jsonObject["data"].arrayObject! {
                guard let model = TSMapper<YDC_Model01>().map(JSON: dict as! [String : Any]) else { continue }
                list.insert(model, at: list.count)
            }
            //Insert more data, make the UITableView long and long.  XD
            self.itemDataSouce2.insert(contentsOf: list, at: 0)
            
            self.tableview.reloadData()
        } catch {
            print("Error \(error)")
        }
    }
    
    fileprivate func fetchData3() {
        guard let JSONData = Data.ts_dataFromJSONFile("ydc3") else { return }
        do {
            let jsonObject = try JSON(data: JSONData)
            var list = [YDC_Model01]()
            for dict in jsonObject["data"].arrayObject! {
                guard let model = TSMapper<YDC_Model01>().map(JSON: dict as! [String : Any]) else { continue }
                list.insert(model, at: list.count)
            }
            //Insert more data, make the UITableView long and long.  XD
            self.itemDataSouce3.insert(contentsOf: list, at: 0)
            
            self.tableview.reloadData()
        } catch {
            print("Error \(error)")
        }
    }
    fileprivate func fetchData4() {
        self.itemDataSouce4.removeAll()
        guard let JSONData = Data.ts_dataFromJSONFile("ydc4") else { return }
        do {
            let jsonObject = try JSON(data: JSONData)
            var list = [YDC_Model01]()
            for dict in jsonObject["data"].arrayObject! {
                guard let model = TSMapper<YDC_Model01>().map(JSON: dict as! [String : Any]) else { continue }
                list.insert(model, at: list.count)
            }
            //Insert more data, make the UITableView long and long.  XD
            self.itemDataSouce4.insert(contentsOf: list, at: 0)
            
            self.tableview.reloadData()
        } catch {
            print("Error \(error)")
        }
    }
    
    func setupDate() {
        fetchData1()
        fetchData2()
        fetchData3()
        fetchData4()
    }
    
    @objc func btnitemleft(sender:UIButton?){
        print("这里是条件设定")
        self.performSegue(withIdentifier: "YDC102SetQuery", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let story = UIStoryboard(name: "EventContent", bundle: nil)
        
        let vc = story.instantiateViewController(withIdentifier: "Common_eventConten")
        
        print(vc.classForCoder)
        self.navigationController?.show(vc, sender: nil)
    }
    
    @objc func btnitemright(sender:UIButton?){
        
        popMenu = SwiftPopMenu(frame:  CGRect(x: UIScreen.main.bounds.size.width - 140, y: 60, width: 130, height: 350), arrowMargin: 12)
        popMenu.popData = [(icon:"saoyisao",title:"活动"),
                           (icon:"SignRule",title:"竞技"),
                           (icon:"SignRule",title:"赛事"),
                           (icon:"SignRule",title:"场馆"),
                           (icon:"SignRule",title:"群"),
                           (icon:"SignRule",title:"俱乐部"),
                           (icon:"SignRule",title:"扫一扫")
        ]
        //点击菜单
        popMenu.didSelectMenuBlock = { [weak self](index:Int)->Void in
            self?.popMenu.dismiss()
            print("block select \(index)")
            
            let add = XXX_1020_Add01()
            self?.navigationController?.show(add, sender: nil)
            
        }
        popMenu.show()
        
        print("这里新建菜单")
    }
    
}
