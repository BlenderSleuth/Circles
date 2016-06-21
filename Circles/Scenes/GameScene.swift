//
//  GameScene.swift
//  Circles
//
//  Created by Ben Sutherland on 15/05/2016.
//  Copyright (c) 2016 blendersleuthgraphics. All rights reserved.
//

import SpriteKit

enum Device {
    case iPad
    case iPhone
}

class GameScene: SKScene {
    let level: Level
    var mapScene: MapScene!
    var device: Device!
    
    init(size: CGSize, level: Level) {
        self.level = level
        super.init(size: size)
    }
    
    //For loading from archive
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToView(view: SKView) {
        setDevice()
        setupMapScene()
        loadLayout()
        
        let label = SKLabelNode(text: level.name)
        label.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        addChild(label)
        
        //let backgroundNode = childNodeWithName("mapBackground") as! SKSpriteNode
        //backgroundNode.texture = SKTexture(image: level.mapImage)
    }
    
    func setDevice() {
        if UIDevice.currentDevice().model == "iPhone" {
            device = .iPhone
            print("iPad")
        } else {
            device = .iPad
            print("iPhone")
        }
    }
    
    func setupMapScene() {
        mapScene = MapScene(level: level, size: self.size, scene: self)
    }
    
    func loadLayout() {
        if device == .iPad {
            
        } else {
            
        }
    }
}

class MapScene: SKScene {
    let map: Map
    
    var background: SKSpriteNode!
    var circleLayer: SKSpriteNode!
    
    init(level: Level, size: CGSize, scene: GameScene) {
        map = Map(level: level)
        
        super.init(size: size)
        
        position = CGPoint(x: 0, y: size.height)
        backgroundColor = .orangeColor()
    }
    
    func setupLayers() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        //Placeholder
        map = Map(level: Levels.sharedInstance.levels[0])
        super.init(coder: aDecoder)
    }
}

class Map {
    let image: UIImage
    let path: CGPath
    
    init(level: Level) {
        image = level.mapImage
        
        //Generate path
        var points = level.pathPoints
        
        let path = CGPathCreateMutable()
        CGPathMoveToPoint(path, nil, points[0].x, points[0].y)
        points.removeFirst()
        
        CGPathAddLines(path, nil, UnsafePointer(points), points.count)
        self.path = path
    }
}