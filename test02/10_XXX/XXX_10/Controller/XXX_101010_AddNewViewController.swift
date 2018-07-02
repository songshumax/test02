//
//  XXX_101010_AddNewViewController.swift
//  test02
//
//  Created by fangli on 2018/7/1.
//  Copyright © 2018年 lijs. All rights reserved.
//

import UIKit

class XXX_101010_AddNewViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var tableview_data: [objectXXX]?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
