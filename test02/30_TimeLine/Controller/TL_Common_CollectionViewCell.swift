

//
//  TimeLine_Common_CollectionViewCell.swift
//  test02
//
//  Created by fangli on 2018/7/20.
//  Copyright © 2018年 lijs. All rights reserved.
//

import UIKit


class TL_Common_CollectionViewCell: UICollectionViewCell {
    
    var post : TL_Module01? {
        didSet {
            if let name = post?.name {
                let attributedText = NSMutableAttributedString(string: name, attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 14)])
                attributedText.append(NSMutableAttributedString(string: "\nDecember 18 ・　Tokyo", attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 10), NSAttributedStringKey.foregroundColor : UIColor(r: 155/255, g: 161/255, b: 171/255)]))
                //上面的前景色没有成功，字体还是黑色
                
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.lineSpacing = 4
                attributedText.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText.string.count))
                
                nameLable.attributedText = attributedText
            }
            
            if let statustext = post?.statustext {
                statusTextView.text = statustext
            }
            
            if let image = post?.profileimage {
                profileImageVie.image = UIImage(named: image)
            }
            
            if let statusimage = post?.imageURL {
                statusImageView.image = UIImage(named: statusimage)
            }
            
            if let textlike = post?.likenum {
                LikesCommentsLable.text = textlike + " like    " + (post?.commentnum)! + " Comments"
            }
        }
    }
    
    let nameLable : UILabel = {
        let lable = UILabel()
        lable.numberOfLines = 2
        return lable
    }()
    
    let profileImageVie : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = UIColor.red
        
        return imageView
    
    }()
    
    let statusTextView : UITextView = {
        
        let textView = UITextView()
        textView.text = "Hello this is my first timeline"
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.isScrollEnabled = false
        return textView
    }()
    
    let statusImageView : UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "share01")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let LikesCommentsLable : UILabel = {
        
        let label = UILabel()
        label.text = "300 like    10.7K Comments"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = CFTool.rgb(red: 226, green: 228, blue: 232)
        return label
        
    }()
    
    let dividerLineView : UIView = {
       
        let view = UIView()
        view.backgroundColor = CFTool.rgb(red: 226, green: 228, blue: 232)
        return view
        
    }()
    
    let likeButton : UIButton = {
        let button = UIButton()
//        button.setTitle("like", for: .normal)
        button.setTitleColor(CFTool.rgb(red: 143, green: 150, blue: 163), for: .normal)
        button.setImage(UIImage(named: "likebutton"), for: .normal)
        return button
    }()
    
    let commentButton : UIButton = {
        let button = UIButton()
//        button.setTitle("like", for: .normal)
        button.setTitleColor(CFTool.rgb(red: 143, green: 150, blue: 163), for: .normal)
        button.setImage(UIImage(named: "commentbutton"), for: .normal)
        return button
    }()
    
    let shareButton : UIButton = {
        let button = UIButton()
//        button.setTitle("like", for: .normal)
        button.setTitleColor(CFTool.rgb(red: 143, green: 150, blue: 163), for: .normal)
        button.setImage(UIImage(named: "sharebutton"), for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = UIColor.white
        addSubview(nameLable)
        addSubview(profileImageVie)
        addSubview(statusTextView)
        addSubview(statusImageView)
        addSubview(LikesCommentsLable)
        addSubview(dividerLineView)
        addSubview(likeButton)
        addSubview(commentButton)
        addSubview(shareButton)
        
        
        
        
        addConstraintsWidthFormat(format: "H:|-8-[v0(44)]-8-[v1]|", views: profileImageVie,nameLable)
        addConstraintsWidthFormat(format: "H:|-4-[v0]-4-|", views: statusTextView)
        addConstraintsWidthFormat(format: "H:|[v0]|", views: statusImageView)
        addConstraintsWidthFormat(format: "H:|-12-[v0]|", views: LikesCommentsLable)
        addConstraintsWidthFormat(format: "H:|-12-[v0]-12-|", views: dividerLineView)
        addConstraintsWidthFormat(format: "H:|-12-[v0(v1)][v1(v2)][v2]-12-|", views: likeButton,commentButton,shareButton)
        
        addConstraintsWidthFormat(format: "V:|-12-[v0]", views: nameLable)
        addConstraintsWidthFormat(format: "V:|-8-[v0(44)]-4-[v1]-4-[v2(200)]-8-[v3(24)]-8-[v4(0.4)]-8-[v5(44)]", views: profileImageVie, statusTextView,statusImageView,LikesCommentsLable,dividerLineView,likeButton)
        addConstraintsWidthFormat(format: "V:[v0]-8-[v1(44)]", views: dividerLineView,commentButton)
        addConstraintsWidthFormat(format: "V:[v0]-8-[v1(44)]", views: dividerLineView,shareButton)
        
    }
    
//    func addConstraintsWidthFormat(format : String, views: UIView...) {
//        
//        var viewDictionary = [String : UIView]()
//        for (index, view) in views.enumerated() {
//            
//            let key = "v\(index)"
//            viewDictionary[key] = view
//            view.translatesAutoresizingMaskIntoConstraints = false
//        }
//    
//        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewDictionary))
//    }
}
