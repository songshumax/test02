//
//  MC_MapCustom02View.swift
//  test02
//
//  Created by Rgs on 2018/02/19.
//  Copyright © 2018年 lijs. All rights reserved.
//

import UIKit

class MC_MapCustom02View: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        self.clipsToBounds = true
        self.layer.masksToBounds = true
        setupViews()
    }
    
    func setData(title: String,img : UIImage,price : Int){
        lblTitle.text = title
        imgView.image = img
        lblPrice.text = "$\(price)"
        
    }
    
    func setupViews(){
        addSubview(containerView)
        containerView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        containerView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        containerView.addSubview(lblTitle)
        lblTitle.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        lblTitle.topAnchor.constraint(equalTo: topAnchor).isActive = true
        lblTitle.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        lblTitle.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        addSubview(imgView)
        imgView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imgView.topAnchor.constraint(equalTo: lblTitle.bottomAnchor).isActive = true
        imgView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        imgView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        addSubview(lblPrice)
        lblPrice.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        lblPrice.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        lblPrice.widthAnchor.constraint(equalToConstant: 90).isActive = true
        lblPrice.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    
    let containerView: UIView = {
      let v = UIImageView()
        v.image = UIImage(named :"111.png")
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let imgView: UIImageView = {
        let v = UIImageView()
        v.image = UIImage(named :"111.png")
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let lblTitle: UILabel = {
       let lbl = UILabel()
        lbl.text = "Name"
        lbl.font = UIFont.boldSystemFont(ofSize: 28)
        lbl.textColor = UIColor.black
        lbl.backgroundColor = UIColor.white
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let lblPrice: UILabel = {
       let lbl = UILabel()
        lbl.text = "$12"
        lbl.font = UIFont.boldSystemFont(ofSize: 32)
        lbl.textColor = UIColor.white
        lbl.backgroundColor = UIColor(white: 0.2, alpha: 0.8)
        lbl.textAlignment = .center
        lbl.layer.cornerRadius = 5
        lbl.clipsToBounds = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    required init?(coder aDecoder: NSCoder) {
        fatalError("ddddlkjlskjdlfkj")
    }
}
