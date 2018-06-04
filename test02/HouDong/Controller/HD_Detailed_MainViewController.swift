//
//  HD_Detailed_MainViewController.swift
//  test02
//
//  Created by fangli on 2017/8/18.
//  Copyright © 2017年 lijs. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class HD_Detailed_MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource		 {

    @IBOutlet weak var HDMap: MKMapView!
    @IBOutlet weak var 活动详细: UILabel!
    @IBOutlet weak var hd_title: UILabel!
    @IBOutlet weak var hd_image1: UIImageView!
    @IBOutlet weak var hd_image2: UIImageView!
    @IBOutlet weak var hd_image3: UIImageView!
    @IBOutlet weak var hd_image4: UIImageView!
    @IBOutlet weak var hd_shijian: UILabel!
    @IBOutlet weak var hd_feiyong: UILabel!
    @IBOutlet weak var hd_baomingjiezhi: UILabel!
    @IBOutlet weak var canjiarenshu: UILabel!
    @IBOutlet weak var hd_canjiabutton: UIButton!		
    
    @IBOutlet weak var tableview: UITableView!
    var hd_str_huodongxiangxi : HD_struct_HuodongXiangXi?
    var hd_flag : Bool = true

    //定位管理器
    let locationManager:CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableview.dataSource = self
        tableview.delegate = self
        //Set_DisplayColume(p_huodongxiangxi :hd_str_huodongxiangxi!)
        
        //地图异步设定
//        let globalQueue = DispatchQueue.global()
//        globalQueue.async {
//            self.Set_MapAnnotation(p_map: self.HDMap, p_dongjing: 32.029171, p_beiwei: 118.788231, p_title: "南京南京南京南京****", p_subtitle: "这里是这里是这里是。。。。")
//        }
//        
//        if hd_flag {
//            hd_canjiabutton.isHidden = false
//        } else {
//            hd_canjiabutton.isHidden = true
//        }
        
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 2
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HD_TableViewCell_Detail_R01", for : indexPath as IndexPath) as! HD_TableViewCell_Detail
        cell.backgroundColor = UIColor.blue
        return cell
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func button_canjia(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }

    @IBAction func button_fanhui(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func Set_DisplayColume(p_huodongxiangxi : HD_struct_HuodongXiangXi) {
        
        hd_title.text = p_huodongxiangxi.HD_title
        hd_image1.image = UIImageView(image:UIImage(named:"001")).image
        hd_image2.image = UIImageView(image:UIImage(named:"001")).image
        hd_image3.image = UIImageView(image:UIImage(named:"001")).image
        hd_image4.image = UIImageView(image:UIImage(named:"001")).image
//        hd_shijian.text! = p_huodongxiangxi.HD_shijian
//        hd_feiyong.text! += p_huodongxiangxi.HD_feiyong
//        hd_baomingjiezhi.text! +=  p_huodongxiangxi.HD_baomingjiezhi
//        canjiarenshu.text! += p_huodongxiangxi.HD_canjiarenshu
//        活动详细.text! += p_huodongxiangxi.HD_huodongxiangxi
        
    }
    //地图上设置大头钉
    func Set_MapAnnotation(p_map : MKMapView, p_dongjing : Double, p_beiwei : Double, p_title : String ,p_subtitle : String) {
        
        // Do any additional setup after loading the view.
        p_map.mapType = MKMapType.standard
        
        let latDelta = 0.05
        let longDelta = 0.05
        let currentLocationSpan:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        let center = CLLocation(latitude: p_dongjing, longitude: p_beiwei)
        let currentRegion:MKCoordinateRegion = MKCoordinateRegion(center: center.coordinate,
                                                                  span: currentLocationSpan)
        //设置显示区域
        p_map.setRegion(currentRegion, animated: true)
        
        //创建一个大头针对象
        let objectAnnotation = MKPointAnnotation()
        //设置大头针的显示位置
        objectAnnotation.coordinate = CLLocation(latitude: p_dongjing,
                                                 longitude: p_beiwei).coordinate
        //设置点击大头针之后显示的标题
        objectAnnotation.title = p_title
        //设置点击大头针之后显示的描述
        objectAnnotation.subtitle = p_subtitle
        
        p_map.addAnnotation(objectAnnotation)
        
    }

}
