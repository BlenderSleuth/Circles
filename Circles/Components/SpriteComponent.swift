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
    
	init(type: CircleType, position: CGPoint, pathWidth: CGFloat) {
        let node = SKShapeNode(circleOfRadius: pathWidth / type.radiusDivisor)
        node.fillColor = type.color
        node.strokeColor = type.color
        node.position = position
        node.zPosition = LayerZposition.sprites.rawValue
        
        self.node = node
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func update(withDeltaTime seconds: TimeInterval) {
    }
}
