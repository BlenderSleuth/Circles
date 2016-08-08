//
//  TowerNode.swift
//  Circles
//
//  Created by Ben Sutherland on 10/07/2016.
//  Copyright © 2016 blendersleuthgraphics. All rights reserved.
//

import SpriteKit

class TowerNode: SKSpriteNode {
	let type: TowerType
	let ratio: CGFloat
	var towerEntity: TowerEntity?
	
	init(type: TowerType) {
		self.type = type
		ratio = type.texture.size().height / type.texture.size().width
		let height = type.radius * ratio
		
		super.init(texture: type.texture, color: .clear(), size: CGSize(width: type.radius, height: height))
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
