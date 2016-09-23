//
//  TowerPickerNode.swift
//  Circles
//
//  Created by Ben Sutherland on 9/07/2016.
//  Copyright © 2016 blendersleuthgraphics. All rights reserved.
//

import SpriteKit

class TowerPickerNode: SKSpriteNode {
	
	let nodeRatio: CGFloat
	
	let marginX: CGFloat
	let marginY: CGFloat
	
	let gap: CGFloat
	let towerWidth: CGFloat
	
	init(sceneSize: CGSize, aspectRatio: CGFloat) {
		let height = sceneSize.height - (sceneSize.height / aspectRatio)
		let nodeSize = CGSize(width: sceneSize.width, height: height)
		
		nodeRatio = nodeSize.width / nodeSize.height
		
		marginX = nodeSize.width / 8
		marginY = nodeSize.height / 6
		
		//Increase size of tower by changing gap size divisor:
		gap = (nodeSize.width - marginX*2)	/	7
		
		//towerWidth is based of gap size
		let numberOfGaps = CGFloat((TowerType.allTowers.count-1)/2)
		towerWidth = ((nodeSize.width - marginX*2) - (gap*numberOfGaps)) / 6
		
		super.init(texture: nil, color: .purple, size: nodeSize)
		
		self.position = CGPoint(x: sceneSize.width/2, y: 0)
		anchorPoint = CGPoint(x: 0.5, y: 0)
	}
	
	func setuptowers() {
		for type in TowerType.allTowers {
			addChild(createTowerOfType(type))
		}
	}
	
	func createTowerOfType(_ type: TowerType) -> TowerNode {
		let i = TowerType.allTowers.index(of: type)!
		let tower = TowerNode(type: type)
		
		let posX: CGFloat
		let posY: CGFloat
		
		if type != .rainbowDodecagon {
			tower.size = CGSize(width: towerWidth, height: towerWidth*tower.ratio)
			if nodeRatio < 6 {
				let column = Int((CGFloat(i))/2)
				
				if i % 2 == 0 {
					//Top row
					posY = size.height - marginY - tower.size.height / 2
				} else {
					//Bottom row
					posY = marginY + tower.size.height/2
				}
				
				posX = marginX + (CGFloat(column) * gap) + (CGFloat(column) * towerWidth) + tower.size.width/2
				
			} else {
				let column = Int((CGFloat(i)))
				
				let marginX = self.marginX/2
				let gap = (size.width - marginX*2)/20
				
				//Top row
				posY = size.height / 2
				tower.size = CGSize(width: towerWidth, height: towerWidth*tower.ratio)
				
				posX = (marginX + (CGFloat(column) * gap) + (CGFloat(column) * towerWidth)) + tower.size.width/2
			}
		} else {
			posY = size.height / 2			//account for anchor point
			posX = (size.width - marginX*0.5) - tower.size.width / 2
			tower.size = CGSize(width: towerWidth*2, height: towerWidth*2*tower.ratio)
		}
		
		tower.position = self.scene!.convert(CGPoint(x: posX, y: posY), to: self)
		return tower
	}
	func getTowerForPosition(_ position: CGPoint) -> TowerNode? {
		let nodes = self.nodes(at: position)
		for node in nodes {
			if let tower = node as? TowerNode {
				tower.removeFromParent()
				replenishTower(tower.type)
				return tower
			}
		}
		return nil
	}
	
	//Stub
	func setupLines() {
		//let lines = SKSpriteNode
	}
	
	func replenishTower(_ type: TowerType) {
		let tower = createTowerOfType(type)
		tower.setScale(0.1)
		
		let amtToRotate = CGFloat(360).degreesToRadians()
		let spinAction = SKAction.rotate(byAngle: amtToRotate, duration: 0.3)
		let popAction = SKAction.scale(by: 10, duration: 0.3)
		let action = SKAction.group([spinAction, popAction])
		
		addChild(tower)
		tower.run(action)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
