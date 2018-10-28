//
//  Common_EventContentTableViewController.swift
//  test02
//
//  Created by fangli on 2018/9/3.
//  Copyright © 2018年 lijs. All rights reserved.
//

import UIKit
import Eureka

class Common_EventContentTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableview: UITableView!
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        tableview.dataSource = self
        tableview.delegate = self
        
        tabBarController?.tabBar.isHidden = true
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    public func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 7
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        
        if indexPath.row == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "cell01")!
            cell.height = 64
        }else if indexPath.row == 1 {
            cell = tableView.dequeueReusableCell(withIdentifier: "cell02")!
        
        }else if indexPath.row == 2 {
            cell = tableView.dequeueReusableCell(withIdentifier: "cell03")!
            
        }
        else if indexPath.row == 3 {
            cell = tableView.dequeueReusableCell(withIdentifier: "cell04")!
            
        }else if indexPath.row == 4 {
            cell = tableView.dequeueReusableCell(withIdentifier: "cell05")!
            
        }else if indexPath.row == 5 {
            cell = tableView.dequeueReusableCell(withIdentifier: "cell06")!
            
        }else if indexPath.row == 6 {
            cell = tableView.dequeueReusableCell(withIdentifier: "cell07")!
            cell.height = 200
            
        }
     
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            
            return 64
        }else if indexPath.row == 6 {
            return 400
            
        }else{
            return 44
        }
        
        
    }

}
