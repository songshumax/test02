

//
//  TimeLine_Common_CollectionViewCell.swift
//  test02
//
//  Created by fangli on 2018/7/20.
//  Copyright © 2018年 lijs. All rights reserved.
//

import UIKit
import TangramKit

class TL_Common_CollectionViewCell: UICollectionViewCell {
    
//    var porfilecontainer: UIView!
    
    var porfilename = UILabel()
    var porfiledetailes = UILabel()
    var comment = UILabel()
    var goodcomment  = UILabel()
    var buttoncontainer: TL_Common_CollectionViewCell!
    var btngood = UIButton()
    var btnaddcomment = UIButton()
    var btnshare = UIButton()
    var images = [String()]
    
    
    let porfileimage : UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(named: "001")
        imageview.contentMode = .scaleAspectFit
        return imageview
    }()
    
    weak var contentLayout:TGLinearLayout!
    
    
    override init(frame:CGRect){
        super.init(frame: frame)
        setupView()
    }
    
    func setupView() {
        
        let  contentLayout = TGLinearLayout(.vert)
        
        contentLayout.tg_padding = UIEdgeInsets(top: 4,left: 4,bottom: 4,right: 4) //设置布局内的子视图离自己的边距.
        contentLayout.tg_width.equal(.fill);  //设置视图自身的宽度填充父视图的剩余宽度。
        contentLayout.tg_gravity = TGGravity.horz.fill
        //高度由子视图决定，但是布局视图的最低高度等于
        contentLayout.tg_height.equal(.wrap).min(10)
        
        self.addSubview(contentLayout)
        
        
        createSection2(in : contentLayout)
        
        createSection3(in : contentLayout)
        
        images = ["001"]
        createSection4(in : contentLayout)
        
        createSection5(in : contentLayout)
    }
    
    //线性布局片段2：垂直线性布局套水平线性布局
    func createSection2(in contentLayout:TGLinearLayout)
    {
        let userInfoLayout = TGLinearLayout(.horz)
        
        userInfoLayout.tg_padding = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        userInfoLayout.tg_top.equal(4)
        //这句代码等价于tg_leading.equal(0) tg_trailing.equal(0)，表明宽度和父视图保持一致
        userInfoLayout.tg_width.equal(.fill)
        userInfoLayout.tg_height.equal(.wrap) //高度由子视图决定。
        
  
        porfileimage.tg_centerY.equal(0)  //在父视图中垂直居中。
        porfileimage.tg_height.equal(44)
        porfileimage.tg_width.equal(44)
        userInfoLayout.addSubview(porfileimage)
//
        let nameLayout = TGLinearLayout(.vert)
        nameLayout.layer.backgroundColor = UIColor.brown.cgColor
        nameLayout.layer.borderColor = UIColor.brown.cgColor
        nameLayout.layer.borderWidth = 1.5//
        nameLayout.tg_padding = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        nameLayout.tg_width.equal(.fill)
        nameLayout.tg_height.equal(.wrap)
        nameLayout.tg_leading.equal(8)
        nameLayout.tg_centerY.equal(0)   //垂直居中，如果不等于0则会产生居中偏移
        userInfoLayout.addSubview(nameLayout)
        //
        
        porfilename.text = NSLocalizedString("Name:欧阳大哥呃呃呃鹅鹅鹅鹅鹅鹅饿鹅鹅鹅鹅饿鹅鹅鹅鹅饿鹅鹅鹅鹅饿鹅鹅鹅鹅饿1232434", comment:"")
        porfilename.font = CFTool.font(15);
        porfilename.tg_top.equal(2)
        porfilename.tg_leading.equal(2)
        porfilename.tg_height.equal(24)
        porfilename.tg_width.equal(.fill)
        
        nameLayout.addSubview(porfilename)
        
        porfiledetailes.text  = NSLocalizedString("Nickname:醉里挑灯看键Nickname:醉里挑灯看键Nickname:醉里挑灯看键", comment:"")
        porfiledetailes.textColor = CFTool.color(4)
        porfiledetailes.font = CFTool.font(12);
        porfiledetailes.tg_top.equal(4)
        porfiledetailes.tg_leading.equal(2)
        porfiledetailes.tg_height.equal(20)
        porfiledetailes.tg_width.equal(.fill)
        
        nameLayout.addSubview(porfiledetailes)
        
        
        contentLayout.addSubview(userInfoLayout)
        
    }
    
    func createSection3(in contentLayout:TGLinearLayout){
        
        comment.text  = NSLocalizedString("今天天气真好", comment:"")
        comment.textColor = CFTool.color(4)
        comment.font = CFTool.font(12);
        comment.tg_top.equal(4)
        comment.tg_leading.equal(2)
        comment.tg_height.equal(20)
        comment.tg_width.equal(.fill)
        contentLayout.addSubview(comment)
        
    }
    
    func createSection4(in contentLayout:TGLinearLayout){
        
        if images.count == 1 {
            
            let p : UIImageView = {
                let imageview = UIImageView()
                imageview.image = UIImage(named: "001")
                imageview.contentMode = .scaleAspectFit
                return imageview
            }()
            
            p.tg_top.equal(4)
            p.tg_leading.equal(2)
            p.tg_height.equal(100)
            p.tg_width.equal(.fill)
            contentLayout.addSubview(p)
            
        } else {

        }
    }
    
    func createSection5(in contentLayout:TGLinearLayout){
        
        let btnLayout = TGLinearLayout(.horz)
        btnLayout.tg_hspace = 10  //设置里面所有子视图之间的水平间距都是10，这样里面的子视图就不在需要设置间距了。
        btnLayout.tg_top.equal(5)
        btnLayout.tg_width.equal(.fill)
        btnLayout.tg_height.equal(.wrap)
        btnLayout.tg_padding = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        
        btngood.tg_height.equal(20)
        btngood.tg_width.equal(.average)  //这里面每个子视图的宽度来平均分配父视图的宽度。这样里面所有子视图的宽度都相等。
        btngood.setTitle("赞", for: .normal)
        btngood.backgroundColor = UIColor.brown
        btnLayout.addSubview(btngood)
        
        btnaddcomment.tg_height.equal(20)
        btnaddcomment.tg_width.equal(.average)  //这里面每个子视图的宽度来平均分配父视图的宽度。这样里面所有子视图的宽度都相等。
        btnaddcomment.setTitle("回复", for: .normal)
        btnaddcomment.backgroundColor = UIColor.brown
        btnLayout.addSubview(btnaddcomment)

        btnshare.tg_height.equal(20)
        btnshare.tg_width.equal(.average)  //这里面每个子视图的宽度来平均分配父视图的宽度。这样里面所有子视图的宽度都相等。
        btnshare.setTitle("共享", for: .normal)
        btnshare.backgroundColor = UIColor.brown
        btnLayout.addSubview(btnshare)

        
        contentLayout.addSubview(btnLayout)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
