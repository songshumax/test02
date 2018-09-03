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

class XXX_10_ViewController_bak: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    private let cellID = "cellID"
    
    var popMenu:SwiftPopMenu!
    
    var actionFloatView: TSMessageActionFloatView!
    
    
    var messages : [Message]?
    
    fileprivate var itemDataSouce = [MessageModel]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
        collectionView.allowsSelection = true
        
        
    }
    
    fileprivate func fetchData() {
        guard let JSONData = Data.ts_dataFromJSONFile("message") else { return }
        do {
            let jsonObject = try JSON(data: JSONData)
            var list = [MessageModel]()
            for dict in jsonObject["data"].arrayObject! {
                guard let model = TSMapper<MessageModel>().map(JSON: dict as! [String : Any]) else { continue }
                list.insert(model, at: list.count)
            }
            //Insert more data, make the UITableView long and long.  XD
            self.itemDataSouce.insert(contentsOf: list, at: 0)
            self.itemDataSouce.insert(contentsOf: list, at: 0)
            self.itemDataSouce.insert(contentsOf: list, at: 0)
            self.itemDataSouce.insert(contentsOf: list, at: 0)
            self.collectionView.reloadData()
            self.collectionView.allowsSelection = true
        } catch {
            print("Error \(error)")
        }
    }
    
    func setupDate() {
        
        let getdata = XXX_Module_Func()
        messages = getdata.getXXXList()
        
        fetchData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = messages?.count {
            return count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! Common_Cell01_CollectionView
        
        if let row = messages?[indexPath.item] {
            
            cell.setNameLable(name: (row.objectXXX?.name)!)
            cell.setMessages(msg: row)
            
            let dfmatter = DateFormatter()
            dfmatter.dateFormat="HH:MM"
            cell.setTimeLable(time: dfmatter.string(from: row.date! as Date))
            cell.setImage(img: (row.objectXXX?.profileImageNmae)!)

        }
        
                return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 76)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        collectionView.backgroundColor = UIColor.blue
        collectionView.register(Common_Cell01_CollectionView.self, forCellWithReuseIdentifier: cellID)
        collectionView.alwaysBounceVertical = true
        
        // Do any additional setup after loading the view.
        
        let itemright = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(self.btnitemright(sender:)))
        //此处使用的图标UIBarButtonSystemItem是一个枚举.大家可以尝试一下其他值出来是什么
        
        
        let itemleft = UIBarButtonItem(title: "通讯录", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.btnitemleft(sender:)))
        
        self.navigationItem.rightBarButtonItem = itemright
        self.navigationItem.leftBarButtonItem = itemleft
        navigationItem.title = "XXX"
        
        setupDate()
    }

    @objc func btnitemleft(sender:UIButton?){
        print("这里是通讯录")
        
        self.performSegue(withIdentifier: "XXX2TongXunLu", sender: nil)
    }
    
    @IBAction func backToXXXmain(segue:UIStoryboardSegue){
        print("返回主VIEW")
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
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("select")
        let viewController = TSChatViewController.ts_initFromNib() as! TSChatViewController
        viewController.messageModel = self.itemDataSouce[indexPath.row]
        //        navigationController?.pushViewController(viewController, animated: true)
        self.ts_pushAndHideTabbar(viewController)
    }
    

    

}
