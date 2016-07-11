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
		
		super.init(texture: nil, color: .purple(), size: nodeSize)
		
		self.position = CGPoint(x: sceneSize.width/2, y: 0)
		anchorPoint = CGPoint(x: 0.5, y: 0)
	}
	
	func setuptowers() {
		for (_, type) in TowerType.allTowers.enumerated() {
			addChild(setTowerPosition(type: type))
		}
	}
	
	func setTowerPosition(type: TowerType) -> TowerNode {
		let i = TowerType.allTowers.index(of: type)!
		let tower = TowerNode(type: type)
		
		
		
		let posX: CGFloat
		let posY: CGFloat
		
		if type != .rainbowDodecagon {
			
			if nodeRatio < 6 {
				let column = Int((CGFloat(i))/2)
				
				if i % 2 == 0 {
					//Top row
					posY = size.height - marginY
					tower.anchorPoint = CGPoint(x: 0, y: 1)
				} else {
					//Bottom row
					posY = marginY
					tower.anchorPoint = CGPoint(x: 0, y: 0)
				}
				posX = marginX + (CGFloat(column) * gap) + (CGFloat(column) * towerWidth)
				
				tower.size = CGSize(width: towerWidth, height: towerWidth*tower.ratio)
			} else {
				let column = Int((CGFloat(i)))
				
				let marginX = self.marginX/2
				let gap = (size.width - marginX*2)/20
				
				//Top row
				posY = size.height / 2
				tower.anchorPoint = CGPoint(x: 0, y: 0.5)
				
				posX = marginX + (CGFloat(column) * gap) + (CGFloat(column) * towerWidth)
				
				tower.size = CGSize(width: towerWidth, height: towerWidth*tower.ratio)
			}

		} else {
			posY = size.height / 2
			posX = size.width - marginX*0.5
			tower.anchorPoint = CGPoint(x: 1, y: 0.5)
			tower.size = CGSize(width: towerWidth*2, height: towerWidth*2*tower.ratio)
		}
		
		tower.position = self.scene!.convert(CGPoint(x: posX, y: posY), to: self)
		return tower
	}
	
	func getTowerForPosition(position: CGPoint) -> TowerNode? {
		let nodes = self.nodes(at: position)
		for node in nodes {
			if node is TowerNode {
				return (node.copy() as! TowerNode)
			}
		}
		return nil
	}
	
	//Stub
	func setupLines() {
		//let lines = SKSpriteNode
	}
	
	func replenishTower(type: TowerType) {
		let tower = setTowerPosition(type: type)
		tower.setScale(0)
		
		let spinAction = SKAction.rotate(byAngle: 360, duration: 1)
		let popAction = SKAction.scale(by: 1, duration: 1)
		let action = SKAction.group([spinAction, popAction])
		
		addChild(tower)
		
		tower.run(action)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
