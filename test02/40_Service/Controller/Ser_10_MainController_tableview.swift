

//
//  Ser_10_MainController.swift
//  test02
//
//  Created by fangli on 2018/8/4.
//  Copyright © 2018年 lijs. All rights reserved.
//

import Foundation
import UIKit

class Ser_10_MainController_tableview : UIViewController, UITableViewDelegate,UITableViewDataSource{
//class Ser_10_MainController : UIViewController {

    @IBOutlet weak var menubar: Common_MenuBar_01!
//    @IBOutlet weak var tableView: UITableView!
    
//    let tv : UITableView = {
////        let vv = UITableView()
//
//        let vv = UITableView(frame: )
//        return vv
//    }()
    
    let menuItem : Common_MenuBar_01 = {
        let mi = Common_MenuBar_01()
        return mi
    }()
    var table = UITableView()
    
    let cellID = "cellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rect = self.view.frame
        table = UITableView(frame: rect)
//        table.backgroundColor = UIColor.blue
        
        setupNavigationBarItem()
        
        setupMenuItem()
        
        setupTableView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        tabBarController?.tabBar.isHidden = false
        
    }
    
    
    func setupMenuItem() {
        view.addSubview(menuItem)
        view.addSubview(table)
    
        view.addConstraintsWidthFormat(format: "H:|[v0]|", views: menuItem)
        view.addConstraintsWidthFormat(format: "H:|[v0]|", views: table)
        view.addConstraintsWidthFormat(format: "V:|-66-[v0(32)][v1]|", views: menuItem,table)
        
    }
    
    func setupTableView() {
        table.dataSource = self
        table.delegate = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        
    }
    
    func setupNavigationBarItem() {
        
        let itemright = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(self.btnitemright(sender:)))
        //此处使用的图标UIBarButtonSystemItem是一个枚举.大家可以尝试一下其他值出来是什么
        
        let itemleft = UIBarButtonItem(title: "设定", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.btnitemleft(sender:)))
        
        self.navigationItem.rightBarButtonItem = itemright
        self.navigationItem.leftBarButtonItem = itemleft
        navigationItem.title = "服务"
        
    }
    
    @objc func btnitemleft(sender:UIButton?){
        print("这里是设定")
        
//        self.performSegue(withIdentifier: "XXX2TongXunLu", sender: nil)
    }
    
    @objc func btnitemright(sender:UIButton?){
        print("这里添加")
        
//        self.performSegue(withIdentifier: "XXX2TongXunLu", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.imageView?.image = UIImage(named: "001")
        cell.textLabel?.text = "卖出物品"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("ddd2")
        self.performSegue(withIdentifier: "SerToSale01", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("ddd3")
    }
    
    

    
    
    
}
