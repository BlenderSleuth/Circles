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
	
    init(type: TowerType) {
        self.type = type //TowerNode(type: type)
		spriteComponent = SpriteComponent(position: CGPoint(x: 0, y: 0), size: CGSize(width: 0, height: 0), texture: nil)
		super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
