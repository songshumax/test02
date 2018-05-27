//
//  MC_MakeClubViewController2.swift
//  test02
//
//  Created by fangli on 2017/9/9.
//  Copyright © 2017年 lijs. All rights reserved.
//

import UIKit
private let reuseIdentifier = "cell"

class MC_MakeClubViewController2: ViewController,UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier+String(indexPath.row), for: indexPath)
        return cell
    }
    

    var vClubTypeName : String = ""
    var vClubTypeID : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = vClubTypeName
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    public func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
    
    
    @IBAction func quxiaoclick(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    

    @IBAction func zhuce(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)

    } 

}
