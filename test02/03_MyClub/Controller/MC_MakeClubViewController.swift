//
//  ViewController.swift
//  test02
//
//  Created by fangli on 2017/9/8.
//  Copyright © 2017年 lijs. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cell"

class MC_MakeClubViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    
    var typegrouplist = [MyClub_TypeList_Structs]()
    
    var mc_Module_MyClub = MC_Module_MyClub()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        typegrouplist = mc_Module_MyClub.MF_GetClubType_List()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return typegrouplist.count
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return typegrouplist[section].myClub_DetailType_Structs.count
        
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Configure the cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MC_ClubTypeCollectionViewCell
        cell.button.setTitle(typegrouplist[indexPath.section].myClub_DetailType_Structs[indexPath.row].myClub_DetailTypeName, for: .normal)
        cell.button.tag = Int(typegrouplist[indexPath.section].myClub_DetailType_Structs[indexPath.row].myClub_DetailTypeID)!
        cell.button.isHidden = true
        cell.backgroundColor = UIColor.brown
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("1")
        performSegue(withIdentifier: "goInputClubInfo", sender: typegrouplist[indexPath.section].myClub_DetailType_Structs[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("2")
//        var theSegue = segue.destinationViewController as SecondViewController
//        theSegue.text = "Pass"
        
//        if segue.identifier == "goInputClubInfo"{
//            
//            let controller = segue.destination as! MC_MakeClubViewController2
//            let detailtype = sender as! MyClub_DetailType_Structs
//            controller.vClubTypeName = detailtype.myClub_DetailTypeName
//            controller.vClubTypeID = detailtype.myClub_DetailTypeID
//            
//        }
    }
}
