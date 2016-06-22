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
    
    //TODO: Don't use device; use screen size and proportions
    var device: Device!
    
    var entities = [GKEntity]()
    
    let spriteSystem = GKComponentSystem(componentClass: SpriteComponent.self)
    
    init(size: CGSize, level: Level) {
        self.level = level
        super.init(size: size)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }//For loading from archive
    
    override func didMoveToView(view: SKView) {
        setupDevice()
        
        setupMapNode()
        setupTowerPickerNode()
        setupTowerUpgradeNode()
        
        startWave()
    }
    
    func setupDevice() {
        if UIDevice.currentDevice().model == "iPhone" {
            device = .iPhone
        } else {
            device = .iPad
        }
    }
    
    func setupMapNode() {
        mapNode = MapNode(level: level, size: size, aspectRatio: aspectRatio)
        addChild(mapNode)
    }
    func setupTowerPickerNode() {
        towerPickerNode = TowerPickerNode(size: size, aspectRatio: aspectRatio)
        addChild(towerPickerNode)
    }
    func setupTowerUpgradeNode() {
        towerUpgradeNode = TowerUpgradeNode(size: size, aspectRatio: aspectRatio)
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
    
    func createCircleAtPoint(type: CircleType, position: CGPoint) {
        let spriteComponent = SpriteComponent(type: type, position: position, large: (device == Device.iPad))
        
        let entity = CircleEntity(spriteComponent: spriteComponent, circleType: type, path: mapNode.map.path)
        entities.append(entity)
        
        spriteSystem.addComponentWithEntity(entity)
        
        mapNode.circleLayer.addChild(entity.spriteComponent.node)
    }
    
    func setCircleOnPath(circle: CircleEntity) {
        circle.setCircleOnPath(mapNode.map.path)
    }
}