//
//  XXX_1010_TongXunLuViewController.swift
//  test02
//
//  Created by fangli on 2018/6/25.
//  Copyright © 2018年 lijs. All rights reserved.
//

import UIKit

class XXX_1010_TongXunLuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var rows01 : [objectXXX]?
    var rows02 : [objectXXX]?
    var rows03 : [objectXXX]?
    
    var tableview_data: [objectXXX]?
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (tableview_data?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style:UITableViewCellStyle.default, reuseIdentifier: "Cell")
        let row = tableview_data![indexPath.row]
        cell.textLabel?.text = row.name
        cell.imageView?.image = UIImage(named: row.profileImageNmae!)
        
        return cell
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupData()
        
        showTableView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backToXXX1010Tongxunlu(segue:UIStoryboardSegue){
        print("返回到通讯录")
    }
    
    @IBOutlet weak var selectChange: UISegmentedControl!
    
    @IBAction func selectValueChange(_ sender: Any) {
        showTableView()
    }
    
    func setupData() {
        let getdata = XXX_Module_Func()
        rows01 = getdata.getTongXunLuList01()
        rows02 = getdata.getTongXunLuList02()
        rows03 = getdata.getTongXunLuList03()
        
    }
    func showTableView() {
        switch(selectChange.selectedSegmentIndex)
        {
        case 0:
            tableview_data = rows01
            
            break
        case 1:
            tableview_data = rows02
            break
        case 2:
            tableview_data = rows03
            break
        default:
            break
        }
        
        tableView.reloadData()
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
