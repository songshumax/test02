

//
//  Ser_10_MainController.swift
//  test02
//
//  Created by fangli on 2018/8/4.
//  Copyright © 2018年 lijs. All rights reserved.
//

import Foundation
import UIKit

class Ser_10_MainController : UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
//class Ser_10_MainController : UIViewController {

    let menuItem : Common_MenuBar_01 = {
        let mi = Common_MenuBar_01()
        return mi
    }()
    
    let collectionView : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.blue
        cv.alwaysBounceVertical = true
        return cv
    }()
    
    

    
    let cellID = "cellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBarItem()
        
        setupMenuItem()
        
        setupCollectionView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        tabBarController?.tabBar.isHidden = false
        
    }
    
    
    func setupMenuItem() {
        view.addSubview(menuItem)
    
        view.addConstraintsWidthFormat(format: "H:|[v0]|", views: menuItem)
        view.addConstraintsWidthFormat(format: "V:|-66-[v0(32)]", views: menuItem)
    }
    
    func setupCollectionView() {
        view.addSubview(collectionView)
//
        view.addConstraintsWidthFormat(format: "H:|[v0]|", views: collectionView)
        view.addConstraintsWidthFormat(format: "V:|-66-[v0(50)]-[v1]-|", views: menuItem,collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellID)
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        cell.backgroundColor = UIColor.brown
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.width/3 - 16, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
}
