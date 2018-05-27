//
//  HD_ViewController_Main.swift
//  test02
//
//  Created by fangli on 2017/7/10.
//  Copyright © 2017年 lijs. All rights reserved.
//

import UIKit


class HD_FindResult_MainViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    
    struct celldata {
        
        let celltype : Int!
        
        let huodongriqi : String!
        let huodongshichang : String!
        
    }
    
    let sectionTitles:[String] = ["未参加","已报名","活动履历"]
    let shuliang:[String] = ["2","0","3"]
    
    let s1data:[String] = ["aa","bb"]
    let s2data:[String] = []
    let s3data:[String] = ["cc","dd","ee"]
    
    let btn_canjia_text = "参加"
    let btn_quxiao_text = "取消"
    
    
    //    var sectiondata: [Int: [String]] = [:]
    
    var celldatas1 =  [celldata]()
    var celldatas2 =  [celldata]()
    var celldatas3 =  [celldata]()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //        sectiondata = [0 : s1data, 1 : s2data , 2 : s3data]
        
        // Do any additional setup after loading the view.
        //在这里动态接收数据，重新构造celldatas
        
        celldatas1.append(celldata(celltype : 1, huodongriqi : "20171001", huodongshichang : "2"))
        celldatas1.append(celldata(celltype : 1, huodongriqi : "20170901", huodongshichang : "3"))
        celldatas1.append(celldata(celltype : 1, huodongriqi : "20170801", huodongshichang : "4"))
        
        celldatas2.append(celldata(celltype : 2, huodongriqi : "20170701", huodongshichang : "1"))
        celldatas2.append(celldata(celltype : 2, huodongriqi : "20170601", huodongshichang : "2"))
        
        celldatas3.append(celldata(celltype : 3, huodongriqi : "20170701", huodongshichang : "3"))
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return 2
        
    }

    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "findresultcell", for : indexPath as IndexPath) as! HD_FindResult_Main_TVC
        
        return cell
        
        
    }
    
    
    @IBAction func button_fanhui(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
}
