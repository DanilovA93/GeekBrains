//
//  AvatarView.swift
//  GeekVK
//
//  Created by Антон Данилов on 20.05.2020.
//  Copyright © 2020 Антон Данилов. All rights reserved.
//

import UIKit

@IBDesignable class AvatarView: UIView {
    
    fileprivate var imageView = UIImageView()
    fileprivate var borderView = UIView()
    
    var shadowWidthFloat: CGFloat?
    var shadowTransparencyFloat: Float?
    
    @IBInspectable var image: UIImage? { didSet { configureImage() }}
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
    
    override func layoutSubviews() {
        configureImage()
        configureBorder()
        
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:))))
    }
    
    fileprivate func configureImage() {
        imageView.frame = CGRect(x: 0.0, y: 0.0, width: self.bounds.width, height: self.bounds.height)
        imageView.image = self.image
        imageView.layer.cornerRadius = frame.height/2
        imageView.layer.masksToBounds = true
        
        self.addSubview(imageView)
    }
    
    fileprivate func configureBorder() {
        borderView.frame = CGRect(x: 0.0, y: 0.0, width: self.bounds.width, height: self.bounds.height)
        borderView.layer.borderWidth = 1
        borderView.layer.cornerRadius = frame.height/2
        borderView.layer.shadowRadius = shadowWidthFloat!
        borderView.layer.shadowColor = shadowColor.cgColor
        borderView.layer.shadowOpacity = (shadowTransparencyFloat != nil) ? shadowTransparency : 1
        borderView.layer.shadowOffset = CGSize.zero
        
        self.addSubview(borderView)
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.3,
        delay: 0,
        usingSpringWithDamping: 0.8,
        initialSpringVelocity: 0,
        options: .curveEaseOut,
        animations: {
            self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        },
        completion: { _ in
                    UIView.animate(withDuration: 0.5) {
                        self.transform = CGAffineTransform.identity}
        })
    }
}
