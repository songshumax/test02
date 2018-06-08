
import Foundation
import UIKit

class Mc_MapCustom01View: UIView {
    
    var img2: UIImage!
    var bordorColor: UIColor!
    
    init(frame: CGRect, image: UIImage, borderColor: UIColor, tag: Int){
        super.init(frame: frame)
        self.img2 = image
        self.bordorColor = borderColor
        self.tag = tag
        setupView()
        
    }
    
    func setupView(){
        let imgView = UIImageView(image: img2)
        imgView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        imgView.layer.cornerRadius = 25
        imgView.layer.borderColor = bordorColor.cgColor
        imgView.layer.borderWidth = 4
        imgView.clipsToBounds = true
        let lbl = UILabel(frame: CGRect(x: 0, y: 45, width: 50, height: 10))
        lbl.text = "x"
        lbl.font = UIFont.systemFont(ofSize: 24)
        lbl.textColor = bordorColor
        lbl.textAlignment = .center
        self.addSubview(imgView)
        self.addSubview(lbl)
        
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("xxxxxxxxsdlfjslkdfjlskdjflj")
    }

    

}
