//
//  HD_FindViewController.swift
//  test02
//
//  Created by fangli on 2017/9/23.
//  Copyright © 2017年 lijs. All rights reserved.
//

import UIKit

class HD_FindViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    var huodong = HD_Module_HuoDong()
    var celldatas =  Array<HD_HuoDongZhongLei>()
    
    var find_banjing : Int = 0
    var find_leibie : [String] = []

    @IBOutlet weak var huodongbanjing: UILabel!
    @IBOutlet weak var collectionview: UICollectionView!
    @IBOutlet weak var stepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        celldatas = huodong.MF_GetHuoDong_ZhongLei()
        huodongbanjing.text = "5"

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return celldatas.count
        
    }
    
    @IBAction func StepperChanged(_ sender: Any) {

        huodongbanjing.text = String(Int(stepper.value))
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "col_cell_leibie01", for: indexPath) as! HD_CollectionViewCell_HuoDongZhongLei
        cell.HuoDongLeiBie.text = celldatas[indexPath.row].HD_ZhongLei_Name
        cell.HuoDongLeiBie.tag = Int(celldatas[indexPath.row].HD_ZhongLei_ID)!

        return cell
    }
    @IBAction func button_fanhui(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func button_sheding(_ sender: Any) {
        
        find_banjing = Int(huodongbanjing.text!)!
        for i in (0...celldatas.count - 1) {
            
            if celldatas[i].HD_ZhongLei_Selected {
            
                find_leibie.append(celldatas[i].HD_ZhongLei_ID)
            }
        }

        performSegue(withIdentifier: "BackHDMainFromFindView", sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print("bbb")
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! HD_CollectionViewCell_HuoDongZhongLei
        
        if cell.HuoDongLeiBie.backgroundColor == UIColor.brown {
            
            cell.HuoDongLeiBie.backgroundColor = UIColor.blue
            celldatas[indexPath.row].HD_ZhongLei_Selected = true
            
        } else {
            celldatas[indexPath.row].HD_ZhongLei_Selected = false
            cell.HuoDongLeiBie.backgroundColor = UIColor.brown
            
        }
    }
    
    
//    ovrride func 
    
    
}
