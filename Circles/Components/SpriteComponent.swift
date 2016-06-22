//
//  SpriteComponent.swift
//  Circles
//
//  Created by Ben Sutherland on 21/06/2016.
//  Copyright © 2016 blendersleuthgraphics. All rights reserved.
//

import SpriteKit
import GameplayKit

class SpriteComponent: GKComponent {
    let node: SKShapeNode
    
    init(type: CircleType, position: CGPoint, large: Bool) {
        let node = SKShapeNode(circleOfRadius: CGFloat(type.radius(large)))
        node.fillColor = type.color
        node.strokeColor = type.color
        node.position = position
        node.zPosition = LayerZposition.Sprites.rawValue
        
        self.node = node
        super.init()
    }
    
    override func updateWithDeltaTime(seconds: NSTimeInterval) {
    }
}
