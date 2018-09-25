//
//  Get_UserProfiles_Model.swift
//  test02
//
//  Created by fangli on 2018/9/6.
//  Copyright © 2018年 lijs. All rights reserved.
//

import Foundation
import SwiftyJSON
import SnapKit

class Get_UserProfiles_Model{
    
    func fetch_UserProfiles() -> [YDC_Model01]{
        var itemDataSouce1 = [YDC_Model01]()
        guard let JSONData = Data.ts_dataFromJSONFile("ydc1") else { return [YDC_Model01]()}
        do {
            let jsonObject = try JSON(data: JSONData)
            var list = [YDC_Model01]()
            for dict in jsonObject["data"].arrayObject! {
                guard let model = TSMapper<YDC_Model01>().map(JSON: dict as! [String : Any]) else { continue }
                list.insert(model, at: list.count)
            }
            //Insert more data, make the UITableView long and long.  XD
            itemDataSouce1.insert(contentsOf: list, at: 0)
            
        } catch {
            print("Error \(error)")
        }
    
        return itemDataSouce1
    }
}


