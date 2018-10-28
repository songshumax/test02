//
//  Common_SportsList.swift
//  test02
//
//  Created by fangli on 2018/9/1.
//  Copyright © 2018年 lijs. All rights reserved.
//

import Foundation
import SwiftyJSON
import SnapKit

class Common_TableView01: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var itemDataSouce = [YDC_Model01]()
    
    var tableview:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.title = "活动1"
        
        //设置UITableView的位置
        let rect = self.view.frame
        tableview = UITableView(frame: rect)
        self.tableview.backgroundColor = UIColor.blue
        
        //设置数据源
        self.tableview.dataSource = self
        //设置代理
        self.tableview.delegate = self
        self.view.addSubview(tableview)

        
        self.tableview.ts_registerCellNib(YDC_10_TableViewCell.self)
        self.tableview.estimatedRowHeight = 65
        self.tableview.tableFooterView = UIView()
        tableview.delegate = self
        tableview.dataSource = self

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
//        tabBarController?.tabBar.isHidden = false
        
    }
    
    @objc func btnitemleft(sender:UIButton?){
        print("这里是条件设定")
        self.performSegue(withIdentifier: "YDC102SetQuery", sender: nil)
    }
    
    
}
