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
	
	init(type: TowerType) {
		self.type = type
		ratio = type.texture.size().height / type.texture.size().width
		let height = type.radius * ratio
		
		super.init(texture: type.texture, color: .clear(), size: CGSize(width: type.radius, height: height))
	}
	
	override init(texture: SKTexture?, color: UIColor, size: CGSize) {
		self.type = TowerType.triangle
		ratio = type.texture.size().height / type.texture.size().width
		super.init(texture: texture, color: color, size: size)
	}
	
	required init?(coder aDecoder: NSCoder) {
		let node = aDecoder.decodeObject() as! TowerNode
		type = node.type
		ratio = type.texture.size().height / type.texture.size().width
		super.init(coder: aDecoder)
	}
}
