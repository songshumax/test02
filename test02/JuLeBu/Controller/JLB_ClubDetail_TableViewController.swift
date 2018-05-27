//
//  JLB_ClubDetail_TableViewController.swift
//  test02
//
//  Created by fangli on 2017/11/2.
//  Copyright © 2017年 lijs. All rights reserved.
//

import UIKit

class JLB_ClubDetail_TableViewController: UITableViewController {
    
    @IBAction func MF_XiaoXiDaRao(_ sender: Any) {
        
        print("a")
        
    }
    
    @IBAction func MF_HuoDongDaRao(_ sender: Any) {
        
        print("b")
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("section:" + String(indexPath.section))
        print("row:" + String(indexPath.row))
    }
    
    

//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Uncomment the following line to preserve selection between presentations
//        // self.clearsSelectionOnViewWillAppear = false
//
//        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//        // self.navigationItem.rightBarButtonItem = self.editButtonItem
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//    // MARK: - Table view data source
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 2
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        switch(section)
//        {
//        case 0:
//            return 2
//        case 1:
//            return 1
//
//        default:
//            return 0
//        }
//    }
//
//

}
