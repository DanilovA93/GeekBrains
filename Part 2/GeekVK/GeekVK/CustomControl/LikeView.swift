//
//  LikeView.swift
//  GeekVK
//
//  Created by Антон Данилов on 20.05.2020.
//  Copyright © 2020 Антон Данилов. All rights reserved.
//

import UIKit

class LikeView: UIView {
    
    var switcher: UISwitch?
    var label: UILabel?
    var numberOfLikes: Int?

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if switcher!.isOn {
            numberOfLikes! += 1
            label?.text = numberOfLikes!
        }
        
//        button.
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
