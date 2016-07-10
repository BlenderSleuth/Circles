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
    
    init(circleType type: CircleType, startPosition position: CGPoint, mapNode: MapNode) {
		let radius = mapNode.pathWidth / type.radiusDivisor
		
		self.spriteComponent = SpriteComponent(position: position,
		                                       size: CGSize(width: radius*2,
		                                                    height: radius*2),
		                                       texture: type.texture)
		
		self.type = type
        
        super.init()
        addComponent(spriteComponent)
        
        setCircleOnPath(mapNode.map.path)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCircleOnPath(_ path: CGPath) {
		let speed = path.boundingBoxOfPath.size.width / type.speed
		
        let action = SKAction.sequence([
            SKAction.follow(path, asOffset: false, orientToPath: false, speed: speed),
            SKAction.run {self.removeCircle(dead: false)}
            ])
        
        spriteComponent.node.run(action)
    }
    func removeCircle(dead: Bool) {
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
