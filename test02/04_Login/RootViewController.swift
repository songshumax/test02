//
//  RootViewController.swift
//  test02
//
//  Created by Rgs on 2018/05/28.
//  Copyright © 2018年 lijs. All rights reserved.
//

import UIKit

class RootViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        print("root")
        // Do any additional setup after loading the view.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using
        // Pass the selected object to the new view controller.
        
        
//        present(logInController, animated: true, completion: nil)
    }
    

}
