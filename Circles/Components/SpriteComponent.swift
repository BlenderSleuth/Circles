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
    var node: SKSpriteNode!
    
	init(node: SKSpriteNode) {
		self.node = node
        node.zPosition = LayerZposition.sprites.rawValue
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func update(withDeltaTime seconds: TimeInterval) {
    }
}
