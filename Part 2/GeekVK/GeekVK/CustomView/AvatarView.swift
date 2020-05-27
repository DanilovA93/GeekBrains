//
//  AvatarView.swift
//  GeekVK
//
//  Created by Антон Данилов on 20.05.2020.
//  Copyright © 2020 Антон Данилов. All rights reserved.
//

import UIKit

@IBDesignable class AvatarView: UIView {
    
    var image = UIImage()
    var shadowWidthFloat: CGFloat?
    var shadowTransparencyFloat: Float?
    var color: UIColor?
    
    @IBInspectable var shadowWidth: CGFloat {
        set { shadowWidthFloat = newValue }
        get { return shadowWidthFloat! }
    }
    @IBInspectable var shadowTransparency: Float {
        set { shadowTransparencyFloat = newValue }
        get { return shadowTransparencyFloat! }
    }
    @IBInspectable var shadowColor: UIColor = UIColor.black {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        let frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
    
        let imageView = UIImageView(frame: frame)
        imageView.image = self.image
        imageView.layer.cornerRadius = frame.height/2
        imageView.clipsToBounds = true
        
        let borderView = UIView(frame: frame)
        borderView.layer.borderWidth = 1
        borderView.layer.cornerRadius = frame.height/2
        borderView.layer.shadowRadius = shadowWidthFloat!
        borderView.layer.shadowColor = shadowColor.cgColor
        borderView.layer.shadowOpacity = (shadowTransparencyFloat != nil) ? shadowTransparency : 1
        borderView.layer.shadowOffset = CGSize.zero
        
        self.addSubview(imageView)
        self.addSubview(borderView)
    }
}
