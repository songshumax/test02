//
//  JLB_LiaoTian.swift
//  test02
//
//  Created by fangli on 2017/8/29.
//  Copyright © 2017年 lijs. All rights reserved.
//

import UIKit

class JLB_LiaoTian: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        // 1 只有文字
//        let item=UIBarButtonItem(title: "详细", style: UIBarButtonItemStyle.plain, target: self, action: nil)
        
        let item=UIBarButtonItem(title: "详细", style: UIBarButtonItemStyle.plain, target: self, action: #selector(sayHello))
        self.navigationItem.rightBarButtonItem=item
        
//        item.addTarget(self, action: #selector(buttonTapped(_:)), forControlEvents: .TouchUpInside)
        
        // 2 图标
//        let item1=UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.edit, target: self, action: nil)//此处使用的图标UIBarButtonSystemItem是一个枚举.大家可以尝试一下其他值出来是什么
//        self.navigationItem.rightBarButtonItem=item1

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sayHello() {
        print("hello")
        self.performSegue(withIdentifier: "SEG_JLB_LiaoTian_XX", sender: self)
        
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
