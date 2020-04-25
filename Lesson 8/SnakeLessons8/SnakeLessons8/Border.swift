//
//  Border.swift
//  SnakeLessons8
//
//  Created by Антон Данилов on 18.04.2020.
//  Copyright © 2020 Антон Данилов. All rights reserved.
//

import UIKit
import SpriteKit

class Border: SKShapeNode {
    convenience init(position: CGPoint) {
        self.init()
        
        self.physicsBody = SKPhysicsBody(circleOfRadius: 10.0, center: CGPoint(x: 5, y: 5))
        self.physicsBody?.categoryBitMask = CollisionCategory.Border
    }
}
