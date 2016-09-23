//
//  Tower.swift
//  Circles
//
//  Created by Ben Sutherland on 23/06/2016.
//  Copyright © 2016 blendersleuthgraphics. All rights reserved.
//

import GameplayKit

class TowerEntity: GKEntity {
    let type: TowerType
	let spriteComponent: SpriteComponent
	
	init(node: TowerNode) {
        self.type = node.type
		spriteComponent = SpriteComponent(node: node)
		super.init()
    }
	
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
