//
//  HD_ViewController_Main.swift
//  test02
//
//  Created by fangli on 2017/7/10.
//  Copyright © 2017年 lijs. All rights reserved.
//

import UIKit


class JLB_CanJiaZhong: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    
    var huodong = JLB_Module_Club()
    var Cells = [JLB_CanJiaZhongList_Structs]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        Cells = huodong.MF_GetJLB_CanJiaZhong(userid: GLOBAL_UserID)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
            return Cells.count
        
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL_JLB_CJZ", for: indexPath) as! JLB_CanjiaZhongList_Cell
        
        
        let tempvalue = Cells[indexPath.row]
        
        cell.clubName.text = tempvalue.JLB_name
        cell.lastMessage.text = "[" + String(tempvalue.JLB_msgcount) + "条]" + tempvalue.JLB_lastmsg
        
        let imageView = UIImageView(image:UIImage(named:tempvalue.JLB_image))
        cell.clubImage.image = imageView.image
        
        cell.lastMessageTime.text = tempvalue.JLB_lasttime
        if tempvalue.JLB_msgNO == "1" {
            cell.messageNoFlag.isHidden = true
        } else {
            cell.messageNoFlag.isHidden = false
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "JLB_DH", sender: nil)
    }
    
 
 
    
    
}
