//
//  JLB_UserList_CollectionViewController.swift
//  test02
//
//  Created by fangli on 2017/11/4.
//  Copyright © 2017年 lijs. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cell"

class JLB_UserList_CollectionViewController: UICollectionViewController {

    
    var groupuserlist = [JLB_UserList_ByGroup_Structs]()
    var alluserlist = [JLB_UserList_ALL_Structs]()
    var jlbid : String = ""
    var groups = [String]()
    
    var jlb_module_club = JLB_Module_Club()
    override func viewDidLoad() {
        super.viewDidLoad()

        
        alluserlist = jlb_module_club.MF_GetJLB_AllUsers(jlbid: jlbid)
        groups = jlb_module_club.MF_GetJLB_Groups(jlbid: jlbid)
        groupuserlist = jlb_module_club.MF_GetJLB_UserByGroup(palluserlist : alluserlist,pgrouplist : groups)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return groupuserlist.count
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
//        if groupuserlist.count > 0 {
//            return groupuserlist[section].JLB_UserList.count
//        } else {
//            return 0
//        }
        return groupuserlist[section].JLB_UserList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Configure the cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
//        cell.backgroundColor = UIColor.blue
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
     Uncomment this method to specify if the specified item should be highlighted during tracking
     */
//    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
//        return true
//    }
 
    
    //分区的header与footer
    override func collectionView(_ collectionView: UICollectionView,
                                 viewForSupplementaryElementOfKind kind: String,
                                 at indexPath: IndexPath) -> UICollectionReusableView {
        var reusableview:UICollectionReusableView!
        
        //分区头
//        if kind == UICollectionElementKindSectionHeader{
            reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                           withReuseIdentifier: "header", for: indexPath)
            //设置头部标题
            let label = reusableview.viewWithTag(1) as! UILabel
            label.text = groupuserlist[indexPath.section].JLB_UserGroupName
//        }
        //分区尾
//        else if kind == UICollectionElementKindSectionFooter{
//            reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
//                                                                           withReuseIdentifier: "footer", for: indexPath)
//
//        }
        return reusableview
    }
    

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
