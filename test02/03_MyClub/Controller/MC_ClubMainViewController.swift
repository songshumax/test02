//
//  MC_ClubMainViewController.swift
//  test02
//
//  Created by fangli on 2017/9/12.
//  Copyright © 2017年 lijs. All rights reserved.
//

import UIKit

class MC_ClubMainViewController: UIViewController {
    
    var myclub_flag = ""
    
    func GetMyClub() -> String {
        
        
        
        return "2"
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        myclub_flag = GetMyClub()
        
        self.automaticallyAdjustsScrollViewInsets = true;
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func wodejulebu(_ sender: Any) {
        
        if myclub_flag == "1" {
            self.performSegue(withIdentifier: "myclubOK", sender: self)
        }
        
        else{
            self.performSegue(withIdentifier: "myclubNO", sender: self)
        }
        
    }

    @IBAction func wodejulebu2(_ sender: Any) {
        
        self.performSegue(withIdentifier: "myclubOK", sender: self)
        
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
