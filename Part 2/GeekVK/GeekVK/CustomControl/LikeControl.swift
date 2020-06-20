//
//  LikeControl.swift
//  GeekVK
//
//  Created by Антон Данилов on 20.05.2020.
//  Copyright © 2020 Антон Данилов. All rights reserved.
//

import UIKit

class LikeControl: UIControl {
    let image = UIImage(named: "liked")
    let button = UIButton()
    let label = UILabel()
    
    let controlHeight = 22.5
    var allLikes: Int? { didSet { configureText() } }
    var likeIt = false

    override func layoutSubviews() {
        configureText()
        configureButton()
        
        getActualColors()
    }
    
    fileprivate func configureText() {
        label.frame = CGRect(x: controlHeight + 10, y: 0, width: controlHeight, height: controlHeight)
        label.text = String(self.allLikes!)
        
        self.addSubview(label)
    }
    
    fileprivate func configureButton() {
        button.frame = CGRect(x: 0, y: 0, width: controlHeight, height: controlHeight)
        button.isEnabled = false
        
        self.addSubview(button)
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        changeLabelByClick()
        getActualColors()
        
        return false
    }
    
    private func getActualColors() {
        let likeColor = UIColor.red
        let notLikeColor = UIColor.black

        let tintedImage = image?.withRenderingMode(.alwaysTemplate)
        button.setImage(tintedImage, for: .normal)
        
        UIView.transition(with: label,
                          duration: 0.5,
                          options: .transitionCrossDissolve,
                          animations: {
                    if self.likeIt {
                self.label.textColor = likeColor
                self.button.tintColor = likeColor
            } else {
                self.label.textColor = notLikeColor
                self.button.tintColor = notLikeColor
            }
        })
    }
    
    private func changeLabelByClick() {
        if likeIt {
            allLikes! -= 1
            likeIt = false
        } else {
            allLikes! += 1
            likeIt = true
        }
        label.text = String(self.allLikes!)
    }
}
