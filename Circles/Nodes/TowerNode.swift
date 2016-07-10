//
//  TowerNode.swift
//  Circles
//
//  Created by Ben Sutherland on 10/07/2016.
//  Copyright © 2016 blendersleuthgraphics. All rights reserved.
//

import SpriteKit

class TowerNode: SKSpriteNode {
	init(type: TowerType) {
		//let shape = SKShapeNode(path: type.path, centered: true)
		
		super.init(texture: nil, color: #colorLiteral(red: 0.1288586855, green: 0, blue: 0.4869538546, alpha: 1), size: CGSize(width: type.radius, height: type.radius))
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
