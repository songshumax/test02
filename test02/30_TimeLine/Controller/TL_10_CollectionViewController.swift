//
//  TL_10_CollectionViewController.swift
//  test02
//
//  Created by fangli on 2018/7/20.
//  Copyright © 2018年 lijs. All rights reserved.
//

import UIKit
import TangramKit
import SwiftyJSON

private let reuseIdentifier = "Cell"

class TL_10_CollectionViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    var cell: TL_Common_CollectionViewCell!
    
    var itemDataSouce = [TL_Module01]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "分享"
        collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        collectionView.register(TL_Common_CollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
//        let post01 = TL_Module01()
//        post01
        
        fetchData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    fileprivate func fetchData() {
        guard let JSONData = Data.ts_dataFromJSONFile("tl01") else { return }
        do {
            let jsonObject = try JSON(data: JSONData)
            var list = [TL_Module01]()
            for dict in jsonObject["data"].arrayObject! {
                guard let model = TSMapper<TL_Module01>().map(JSON: dict as! [String : Any]) else { continue }
                list.insert(model, at: list.count)
            }
            //Insert more data, make the UITableView long and long.  XD
            self.itemDataSouce.insert(contentsOf: list, at: 0)
            
            
        } catch {
            print("Error \(error)")
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return itemDataSouce.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! TL_Common_CollectionViewCell
        cell.post = itemDataSouce[indexPath.item]
//        cell.nameLable.text = itemDataSouce[indexPath.item].name
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let statusText = itemDataSouce[indexPath.item].statustext {
            let rect = NSString(string: statusText).boundingRect(with: CGSize(width: view.frame.width, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 14)], context: nil)
            let konwheight : CGFloat = 352
//                8 + 44 + 4 + 30 + 4 + 8 + 24 + 8 + 0.4 + 44
            return CGSize(width: view.frame.width, height: rect.height + konwheight + 24)
        }
        return CGSize(width: view.frame.width, height: 400)
    }

}
