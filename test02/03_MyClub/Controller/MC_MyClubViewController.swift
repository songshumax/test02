//
//  MC_MyClubViewController.swift
//  test02
//
//  Created by fangli on 2017/9/12.
//  Copyright © 2017年 lijs. All rights reserved.
//

import UIKit


class MC_MyClubViewController: UITableViewController{
    
    let sectionTitles:[String] = ["活动","俱乐部","成员"]
    let shuliang:[String] = ["1","3","2"]
    
    let s1data:[String] = ["创建活动","活动列表"]
    let s2data:[String] = ["设定","申请消息","解散"]
    let s3data:[String] = ["自定义标签","成员列表"]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{

        
        //        return sectiondata.count
        if section == 0 {
            
            return s1data.count
            
        }else if section == 1 {
            
            return s2data.count
            
        }else if section == 2{
            
            return s3data.count
            
        } else {
            
            return 0
            
        }
        
    }

    
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.section)
        print(indexPath.row)
        
        let group = indexPath.section
        let ind = indexPath.row
        if group == 0 && ind == 0 {
                self.performSegue(withIdentifier: "MyClubNewHuoDong01", sender: self)
        }
        
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for : indexPath as IndexPath)         
        
        if indexPath.section == 0 {
            cell.textLabel?.text = s1data[indexPath.row]
            
            
        } else if indexPath.section == 1 {
            cell.textLabel?.text = s2data[indexPath.row]
            
        } else if indexPath.section == 2 {
            cell.textLabel?.text = s3data[indexPath.row]
            
            
        } else {
            
        }
    
        return cell
    }

    public override func numberOfSections(in tableView: UITableView) -> Int {
        
        return sectionTitles.count
        
    }
    
    
    
    public override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return sectionTitles[section]
    }


}
