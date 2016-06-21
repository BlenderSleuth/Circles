//
//  GameScene.swift
//  Circles
//
//  Created by Ben Sutherland on 15/05/2016.
//  Copyright (c) 2016 blendersleuthgraphics. All rights reserved.
//

import SpriteKit
import GameplayKit

enum Device {
    case iPad
    case iPhone
}

class GameScene: SKScene {
    let level: Level
    var mapNode: MapNode!
    var device: Device!
    
    var entities = [GKEntity]()
    
    let spriteSystem = GKComponentSystem(componentClass: SpriteComponent.self)
    
    init(size: CGSize, level: Level) {
        self.level = level
        super.init(size: size)
    }
    
    //For loading from archive
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToView(view: SKView) {
        setupMapNode()
        startWave()
    }
    
    func setupMapNode() {
        mapNode = MapNode(level: level, size: size)
        addChild(mapNode)
    }
    
    func createCircleAtPoint(type: CircleType, position: CGPoint) {
        let spriteComponent = SpriteComponent(type: type, position: position)
        
        let entity = CircleEntity(spriteComponent: spriteComponent, circleType: type, path: mapNode.map.path)
        entities.append(entity)
        
        spriteSystem.addComponentWithEntity(entity)
        
        mapNode.circleLayer.addChild(entity.spriteComponent.node)
    }
    
    func startWave() {
        let wave = level.waves[0]
        for index in 0..<wave.indexCount {
            for _ in 0..<wave[index] {
                let type = CircleType(rawValue: index)!
                createCircleAtPoint(type, position: CGPoint(x: 300, y: 300))
            }
        }
    }
    
    func setCircleOnPath(circle: CircleEntity) {
        circle.setCircleOnPath(mapNode.map.path)
    }
    
    /*func setDevice() {
        if UIDevice.currentDevice().model == "iPhone" {
            device = .iPhone
            print("iPhone")
        } else {
            device = .iPad
            print("iPad")
        }
    }*/
}

class UpgradeNode: SKSpriteNode {
    var currentTowerSelected: Tower?
    
    init() {
        super.init(texture: nil, color: .whiteColor(), size: CGSizeZero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class Tower {
    
}