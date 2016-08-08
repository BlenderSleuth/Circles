//
//  GameScene.swift
//  Circles
//
//  Created by Ben Sutherland on 15/05/2016.
//  Copyright (c) 2016 blendersleuthgraphics. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    let aspectRatio: CGFloat = 4/3
    
    let level: Level
    var mapNode: MapNode!
    var towerPickerNode: TowerPickerNode!
    var towerUpgradeNode: TowerUpgradeNode!
    
    var entities = [GKEntity]()
	var selectedTower: TowerEntity?
    
    let spriteSystem = GKComponentSystem(componentClass: SpriteComponent.self)
    
    init(size: CGSize, level: Level) {
        self.level = level
        super.init(size: size)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
	
    override func didMove(to view: SKView) {
		setupMapNode()
        setupTowerPickerNode()
        //setupTowerUpgradeNode()
        
        startWave()
    }
	
    func setupMapNode() {
        mapNode = MapNode(level: level, size: size, aspectRatio: aspectRatio)
        addChild(mapNode)
    }
    func setupTowerPickerNode() {
        towerPickerNode = TowerPickerNode(sceneSize: size, aspectRatio: aspectRatio)
        addChild(towerPickerNode)
		towerPickerNode.setuptowers()
    }
    func setupTowerUpgradeNode() {
        towerUpgradeNode = TowerUpgradeNode(sceneSize: size, aspectRatio: aspectRatio)
        addChild(towerUpgradeNode)
    }
	
    func startWave() {
        let wave = level.waves[0]
        for index in 0..<wave.indexCount {
            for _ in 0..<wave[index] {
                let type = CircleType(rawValue: index)!
                createCircleAtPoint(type, position: mapNode.map.startPosition)
            }
        }
    }
    
    func createCircleAtPoint(_ type: CircleType, position: CGPoint) {
		let entity = CircleEntity(circleType: type, startPosition: position, mapNode: mapNode)
		
        entities.append(entity)
        spriteSystem.addComponent(with: entity)
        mapNode.circleLayer.addChild(entity.spriteComponent.node)
    }
    
    func setCircleOnPath(_ circle: CircleEntity) {
        circle.setCircleOnPath(mapNode.map.path)
    }
	
	func createTower(_ towerNode: TowerNode) {
		let towerEntity = TowerEntity(node: towerNode)
		addChild(towerEntity.spriteComponent.node)
		selectedTower = towerEntity
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		for touch in touches {
			let location = touch.location(in: self)
			let pickerLocation = convert(location, to: towerPickerNode)
			
			if let tower = selectedTower {
				if !mapNode.testForValidPoint(tower.spriteComponent.node.position) {
					return
				}
			} else {
				if let tower = towerPickerNode.getTowerForPosition(pickerLocation) {
					tower.position = location
					createTower(tower)
				}
			}
		}
	}
	
	override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
		for touch in touches {
			let location = touch.location(in: self)
			selectedTower?.spriteComponent.node.position = location
		}
	}
	
	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
		for _ in touches {
			if let tower = selectedTower {
				let point = convert(tower.spriteComponent.node.position, to: mapNode.towerLayer)
				if !mapNode.testForValidPoint(point) {
					return
				} else {
					selectedTower = nil
				}
			}
		}
	}
}
