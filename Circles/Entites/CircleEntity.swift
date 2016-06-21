//
//  CircleEntity.swift
//  Circles
//
//  Created by Ben Sutherland on 21/06/2016.
//  Copyright © 2016 blendersleuthgraphics. All rights reserved.
//

import GameKit

class CircleEntity: GKEntity {
    let spriteComponent: SpriteComponent
    let type: CircleType
    
    init(spriteComponent: SpriteComponent, circleType: CircleType, path: CGPath) {
        self.spriteComponent = spriteComponent
        type = circleType
        
        super.init()
        addComponent(spriteComponent)
        
        setCircleOnPath(path)
    }
    
    func setCircleOnPath(path: CGPath) {
        let action = SKAction.sequence([
            SKAction.followPath(path, speed: type.speed),
            SKAction.runBlock {self.removeCircle(dead: false)}
            ])
        
        spriteComponent.node.runAction(action)
    }
    func removeCircle(dead dead: Bool) {
        if dead {
            print("Dead")
            spriteComponent.node.removeAllActions()
            spriteComponent.node.removeFromParent()
        } else {
            spriteComponent.node.removeAllActions()
            spriteComponent.node.removeFromParent()
        }
    }
}
