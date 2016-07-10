//
//  TowerPickerNode.swift
//  Circles
//
//  Created by Ben Sutherland on 9/07/2016.
//  Copyright © 2016 blendersleuthgraphics. All rights reserved.
//

import SpriteKit

struct Textures {
	static let sharedInstance = Textures()
	
	
}

class TowerPickerNode: SKSpriteNode {
	
	init(sceneSize: CGSize, aspectRatio: CGFloat) {
		let height = sceneSize.height - (sceneSize.height / aspectRatio)
		let nodeSize = CGSize(width: sceneSize.width, height: height)
		
		super.init(texture: nil, color: .purple(), size: nodeSize)
		
		self.position = CGPoint(x: sceneSize.width/2, y: 0)
		anchorPoint = CGPoint(x: 0.5, y: 0)
	}
	
	func setuptowers() {
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

class TowerNode: SKSpriteNode {
	init(type: TowerType) {
		//let shape = SKShapeNode(path: type.path, centered: true)
		
		super.init(texture: nil, color: #colorLiteral(red: 0.1288586855, green: 0, blue: 0.4869538546, alpha: 1), size: CGSize(width: type.radius, height: type.radius))
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
