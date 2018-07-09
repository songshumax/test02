//
//  HD_ViewController_Main.swift
//  test02
//
//  Created by fangli on 2017/7/10.
//  Copyright © 2017年 lijs. All rights reserved.
//

import UIKit


class HD_ViewController_Main: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    
    @IBOutlet weak var table_fujin: UITableView!
    @IBOutlet weak var table_canjiazhong: UITableView!
    @IBOutlet weak var table_canjialvli: UITableView!
    
    var p : Int!
    var huodong = HD_Module_HuoDong()
    var celldatas1 = [HD_struct_HuodongXiangXi]()
    var celldatas2 = [HD_struct_HuodongXiangXi]()
    var celldatas3 = [HD_struct_HuodongXiangXi]()
    
    var huodongxiangxi : HD_struct_HuodongXiangXi?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        celldatas1 =  huodong.MF_GetHuoDong_FuJin(dongjing: 11, beiwei: 22)
        celldatas2 =  huodong.MF_GetHuoDong_CanJiaZhong(userid: "lijiashu")
        celldatas3 =  huodong.MF_GetHuoDong_CanJiaLvLi(userid: "lijiashu")
        
        table_fujin.rowHeight = UITableViewAutomaticDimension
        table_canjiazhong.rowHeight = UITableViewAutomaticDimension
        table_canjialvli.rowHeight = UITableViewAutomaticDimension
        
        display_tableview()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        var returnvalue  = 0
        
        if GLOBAL_LOGIN_FLAG == "0" {
            
            return 0
            
        }
        
        switch(tableView)
        {
            
        case table_fujin:
            returnvalue = celldatas1.count
            break
        case table_canjiazhong:
            returnvalue = celldatas2.count
            break
        case table_canjialvli:
            returnvalue = celldatas3.count
            break
        default:
            break
            
        }
        
        return returnvalue
    }

    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var hdid :String
        let cell = Bundle.main.loadNibNamed("HD_TableViewCell", owner:self, options: nil)?.first as! HD_TableViewCell
        
        if tableView == table_fujin {
            
            hdid = celldatas1[indexPath.row].HD_ID
            let imageView = UIImageView(image:UIImage(named:celldatas1[indexPath.row].HD_image))
            cell.hd_title.text = celldatas1[indexPath.row].HD_title
            cell.hd_image.image = imageView.image
            cell.hd_shijian.text = celldatas1[indexPath.row].HD_shijian
            cell.hd_feiyong.text = celldatas1[indexPath.row].HD_feiyong
            cell.hd_canjiarenshu.text = celldatas1[indexPath.row].HD_canjiarenshu
            cell.hd_position.text = celldatas1[indexPath.row].HD_position
            cell.hd_button.setTitle(celldatas1[indexPath.row].HD_button, for: .normal)
            cell.hd_button.tag = Int(hdid)!
            
        } else if tableView == table_canjiazhong {
            
            hdid = celldatas2[indexPath.row].HD_ID
            let imageView = UIImageView(image:UIImage(named:celldatas2[indexPath.row].HD_image))
            cell.hd_title.text = celldatas2[indexPath.row].HD_title
            cell.hd_image.image = imageView.image
            cell.hd_shijian.text = celldatas2[indexPath.row].HD_shijian
            cell.hd_feiyong.text = celldatas2[indexPath.row].HD_feiyong
            cell.hd_canjiarenshu.text = celldatas2[indexPath.row].HD_canjiarenshu
            cell.hd_position.text = celldatas2[indexPath.row].HD_position
            cell.hd_button.setTitle(celldatas2[indexPath.row].HD_button, for: .normal)
            cell.hd_button.tag = Int(hdid)!
            
        } else if tableView == table_canjialvli {
            
            hdid = celldatas3[indexPath.row].HD_ID
            let imageView = UIImageView(image:UIImage(named:celldatas3[indexPath.row].HD_image))
            cell.hd_title.text = celldatas3[indexPath.row].HD_title
            cell.hd_image.image = imageView.image
            cell.hd_shijian.text = celldatas3[indexPath.row].HD_shijian
            cell.hd_feiyong.text = celldatas3[indexPath.row].HD_feiyong
            cell.hd_canjiarenshu.text = celldatas3[indexPath.row].HD_canjiarenshu
            cell.hd_position.text = celldatas3[indexPath.row].HD_position
            cell.hd_button.isHidden = true
            cell.hd_button.tag = Int(hdid)!

        } else {
            
        }
        cell.hd_button.addTarget(self, action: #selector(self.button_onClick(_:)), for: UIControlEvents.touchUpInside)
        
        return cell

    }
    
    @objc func button_onClick(_ sender:UIButton){
        
        if segmented_huodongleibie.selectedSegmentIndex == 0 {
            //参加
            (celldatas1,celldatas2) = huodong.MF_setHD_CanJia(phdid:sender.tag,pcelldatas1:celldatas1,pcelldatas2:celldatas2)
            
        } else {
            //取消
            (celldatas1,celldatas2) = huodong.MF_setHD_QuXiao(phdid:sender.tag,pcelldatas1:celldatas1,pcelldatas2:celldatas2)
        }

        self.table_fujin.reloadData()
        self.table_canjiazhong.reloadData()
        
    }
    
    @IBAction func button_chazhao(_ sender: Any) {
        
        self.performSegue(withIdentifier: "hd_chazhao", sender: self)
        
    }
    
    @IBOutlet weak var segmented_huodongleibie: UISegmentedControl!
    
    @IBAction func segment_changeed(_ sender: Any) {
        
        p = segmented_huodongleibie.selectedSegmentIndex
        display_tableview()
        
    }
    
    
    public func display_tableview()  {
        
        switch(segmented_huodongleibie.selectedSegmentIndex)
        {
        case 0:
            table_fujin.isHidden = false
            table_canjiazhong.isHidden = true
            table_canjialvli.isHidden = true
            break
        case 1:
            table_fujin.isHidden = true
            table_canjiazhong.isHidden = false
            table_canjialvli.isHidden = true
            break
        case 2:
            table_fujin.isHidden = true
            table_canjiazhong.isHidden = true
            table_canjialvli.isHidden = false
            break
        default:
            break
        }
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch tableView {
            
        case table_fujin:
            huodongxiangxi = celldatas1[indexPath.row]
        case table_canjiazhong:
            huodongxiangxi = celldatas2[indexPath.row]
        case table_canjialvli:
            huodongxiangxi = celldatas3[indexPath.row]
        default :
            break
        }
        
//        self.performSegue(withIdentifier: "hd_xiangxi", sender: nil)
        performSegue(withIdentifier: "hd_xiangxi", sender: huodongxiangxi)
        
    }
    
//    //在这个方法中给新页面传递参数
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
////        if segue.identifier == "hd_xiangxi"{
////
////            let controller = segue.destination as! HD_Detailed_MainViewController
////            controller.hd_str_huodongxiangxi = sender as? HD_struct_HuodongXiangXi
////            if segmented_huodongleibie.selectedSegmentIndex == 2 {
////                    controller.hd_flag = false
////            } else {
////                controller.hd_flag = true
////            }
////
////        }
//    }
//    
//    //segue回调方法，获取返回参数
//    @IBAction func backFromFindSegue(segue : UIStoryboardSegue){
////        if segue.identifier == "BackHDMainFromFindView"{
////            //获取返回的控制器
////            let backVC = segue.source as! HD_FindViewController
////            celldatas1 =  huodong.MF_GetHuoDong_FindFuJin(dongjing: 11, beiwei: 22, banjing :backVC.find_banjing , leibie: backVC.find_leibie)
////
////        }
////        if segue.identifier == "backMainForP2"{
////            //获取返回的控制器
////            let backVC = segue.source as! HD_FindViewController
////            celldatas1 =  huodong.MF_GetHuoDong_FindFuJin(dongjing: 11, beiwei: 22, banjing :backVC.find_banjing , leibie: backVC.find_leibie)
////
////        }
////        table_fujin.reloadData()
////    }
    
}
