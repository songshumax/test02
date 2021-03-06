//
//  Common_SportsList.swift
//  test02
//
//  Created by fangli on 2018/9/1.
//  Copyright © 2018年 lijs. All rights reserved.
//

import Foundation
import SwiftyJSON
import SnapKit
import Eureka

public class Common_SportsList: FormViewController,TypedRowControllerType {
    
    fileprivate var itemDataSouce = [YDC_Model01]()
    fileprivate var itemDataSouce1 = [YDC_Model01]()
    
    public var row: RowOf<String>!
    public var PopTextDate = ""
    public var onDismissCallback: ((UIViewController) -> ())?
    
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    convenience public init(_ callback: ((UIViewController) -> ())?){
        self.init(nibName: nil, bundle: nil)
        onDismissCallback = callback
    }
    
    @IBOutlet weak var tableview: UITableView!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
    
        self.title = "活动1"
        
        self.tableview.ts_registerCellNib(YDC_10_TableViewCell.self)
        self.tableview.estimatedRowHeight = 65
        self.tableview.tableFooterView = UIView()
        tableview.delegate = self
        tableview.dataSource = self

        setupDate()
        
        showTableView()
        tableview.reloadData()
    }
    
    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.itemDataSouce.count
        
    }
    
    override public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.tableview.estimatedRowHeight
    }
    
    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: YDC_10_TableViewCell = tableView.ts_dequeueReusableCell(YDC_10_TableViewCell.self)
        cell.setCellContnet(self.itemDataSouce[indexPath.row])
        return cell
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        
    }
    
    @IBAction func selectChanged(_ sender: Any) {
        showTableView()
        tableview.reloadData()
    }
    
    func showTableView() {
        
            itemDataSouce = itemDataSouce1
        
    }
    
    fileprivate func fetchData1() {
        guard let JSONData = Data.ts_dataFromJSONFile("ydc1") else { return }
        do {
            let jsonObject = try JSON(data: JSONData)
            var list = [YDC_Model01]()
            for dict in jsonObject["data"].arrayObject! {
                guard let model = TSMapper<YDC_Model01>().map(JSON: dict as! [String : Any]) else { continue }
                list.insert(model, at: list.count)
            }
            //Insert more data, make the UITableView long and long.  XD
            self.itemDataSouce1.insert(contentsOf: list, at: 0)
            
            
        } catch {
            print("Error \(error)")
        }
    }
    
    
    
    func setupDate() {
        fetchData1()
        
    }
    
    @objc func btnitemleft(sender:UIButton?){
        print("这里是条件设定")
        self.performSegue(withIdentifier: "YDC102SetQuery", sender: nil)
    }
    
    
}
