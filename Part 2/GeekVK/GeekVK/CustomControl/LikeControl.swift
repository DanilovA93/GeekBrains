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
    
    var button = UIButton()
    var label = UILabel()
    
    var allLikes = 3
    var likeIt = false

    override init(frame: CGRect) {
        super.init(frame: frame)
        common()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        common()
    }
    
    func common() {
        let controlWidth = 50
        let controlHeight = controlWidth / 2
                
        button.frame = CGRect(x: 0, y: 0, width: controlHeight, height: controlHeight)
        button.isEnabled = false
        
        label.frame = CGRect(x: controlHeight + 10, y: 0, width: controlHeight, height: controlHeight)
        label.text = String(self.allLikes)
        
        getActualColors()

        self.addSubview(button)
        self.addSubview(label)
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        changeLabelByClick()
        getActualColors()
        
        return false
    }
    
    private func getActualColors() {
        let liked = UIColor.red
        let notLiked = UIColor.white

        let tintedImage = image?.withRenderingMode(.alwaysTemplate)
        button.setImage(tintedImage, for: .normal)
                        
        if self.likeIt {
            self.label.textColor = liked
            self.button.tintColor = liked
        } else {
            self.label.textColor = notLiked
            self.button.tintColor = notLiked
        }
    }
    
    private func changeLabelByClick() {
        if self.likeIt {
            self.allLikes -= 1
            self.likeIt = false
            
        } else {
            self.allLikes += 1
            self.likeIt = true
        }
        
        self.label.text = String(self.allLikes)
    }
    
}
