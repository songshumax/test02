//
//  Common_Cell01_CollectionView.swift
//  test02
//
//  Created by fangli on 2018/6/23.
//  Copyright © 2018年 lijs. All rights reserved.
//

import Foundation
import UIKit

class Common_Cell01_CollectionView : UICollectionViewCell
{
//    var imageString = "001"
//    var nameText = "First Name 111111111112345678901234567890"
//    var messageText = "This is my test message 12345678901234567890"
//    var timeText = "12:00"
    
    var message : Message?
    
    let profileImageview : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let dividerLinView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        return view
    }()
    
    let nameLable : UILabel = {
       let lable = UILabel()
//        lable.text = nameText
//        lable.text = "First Name 111111111112345678901234567890"
        lable.font = UIFont.systemFont(ofSize: 18)
        return lable
    }()
    
    let messageLable : UILabel = {
        let lable = UILabel()
//        lable.text = messageText
//        lable.text = "This is my test message 12345678901234567890"
        lable.font = UIFont.systemFont(ofSize: 14)
        return lable
    }()
    
    let timeLable : UILabel = {
        let lable = UILabel()
//        lable.text = timeText
//        lable.text = "12:00"
        lable.font = UIFont.systemFont(ofSize: 14)
        lable.textAlignment = NSTextAlignment.center
        return lable
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupView()
    }
    func setNameLable(name : String) {
        nameLable.text = name
    }
    
    func setMessageLable(msg : String) {
        messageLable.text = msg
    }
    func setTimeLable(time : String) {
        timeLable.text = time
    }
    
    func setImage(img : String) {

        profileImageview.image = UIImage(named: img)
    }
    
    func setMessages(msg : Message) {
        self.message = msg
        self.setMessageLable(msg: msg.text!)
        //.....
        //.....
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init coder has not been implemented")
    }
    
    func setupView(){
//        backgroundColor = UIColor.cyan
        
        addSubview(profileImageview)
        addSubview(dividerLinView)
        addSubview(nameLable)
        addSubview(messageLable)
        addSubview(timeLable)
        
//        profileImageview.image = UIImage(named: imageString)
//        profileImageview.image = UIImage(named: "001")
        
        profileImageview.translatesAutoresizingMaskIntoConstraints = false
        dividerLinView.translatesAutoresizingMaskIntoConstraints = false
        nameLable.translatesAutoresizingMaskIntoConstraints = false
        messageLable.translatesAutoresizingMaskIntoConstraints = false
        timeLable.translatesAutoresizingMaskIntoConstraints = false
        
        profileImageview.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        profileImageview.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        profileImageview.widthAnchor.constraint(equalToConstant: 60).isActive = true
        profileImageview.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        dividerLinView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12).isActive = true
        dividerLinView.topAnchor.constraint(equalTo: self.bottomAnchor, constant: 1).isActive = true
        dividerLinView.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -24).isActive = true
        dividerLinView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        nameLable.leftAnchor.constraint(equalTo: profileImageview.rightAnchor, constant: 8).isActive = true
        nameLable.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        nameLable.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -168).isActive = true
        nameLable.heightAnchor.constraint(equalToConstant: 32).isActive = true

        messageLable.leftAnchor.constraint(equalTo: profileImageview.rightAnchor, constant: 8).isActive = true
        messageLable.topAnchor.constraint(equalTo: nameLable.bottomAnchor, constant: 4).isActive = true
        messageLable.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -100).isActive = true
        messageLable.heightAnchor.constraint(equalToConstant: 24).isActive = true

        timeLable.leftAnchor.constraint(equalTo: self.rightAnchor, constant: -48).isActive = true
        timeLable.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        timeLable.widthAnchor.constraint(equalToConstant: 40).isActive = true
        timeLable.heightAnchor.constraint(equalToConstant: 20).isActive = true
//
    }
    
    
    
}
