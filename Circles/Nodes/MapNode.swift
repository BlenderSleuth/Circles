//
//  MapNode.swift
//  Circles
//
//  Created by Ben Sutherland on 22/06/2016.
//  Copyright © 2016 blendersleuthgraphics. All rights reserved.
//

import SpriteKit

class MapNode: SKSpriteNode {
    let map: Map
    
    let circleLayer: SKSpriteNode
    let backgroundLayer: SKSpriteNode
    
    var margin: CGFloat
    
    init(level: Level, size: CGSize, aspectRatio: CGFloat) {
        let texture = SKTexture(image: level.mapImage)
        let mapSize = CGSizeMake(size.width, size.height / aspectRatio)
        
        //Get the correct size of the map
        let imageRatio = texture.size().height / texture.size().width
        let imageWidth = mapSize.width
        let imageHeight = mapSize.width * imageRatio
        let imageSize = CGSizeMake(imageWidth, imageHeight)
        
        backgroundLayer = SKSpriteNode(texture: texture, size: imageSize)
        circleLayer = SKSpriteNode(color: .clearColor(), size: imageSize)
        
        margin = (imageSize.height - mapSize.height)/2
        map = Map(level: level, mapSize: mapSize)
        super.init(texture: nil, color: .orangeColor(), size: mapSize)
        
        position = CGPoint(x: size.width / 2, y: size.height - mapSize.height / 2)
        
        setupLayers()
    }
    required init?(coder aDecoder: NSCoder) {
        //Stub
        circleLayer = SKSpriteNode()
        map = Map()
        backgroundLayer = SKSpriteNode()
        margin = 0
        super.init(coder: aDecoder)
    }
    
    func setupLayers() {
        let backgroundCropNode = SKCropNode()
        backgroundCropNode.maskNode = SKSpriteNode(color: .blackColor(), size: size)
        
        backgroundLayer.zPosition = LayerZposition.Background.rawValue
        
        circleLayer.zPosition = LayerZposition.CircleLayer.rawValue
        circleLayer.anchorPoint = CGPoint(x: 0, y: 0)
        circleLayer.position = CGPoint(x: -size.width/2, y: -size.height / 2 - margin)
        
        backgroundCropNode.addChild(backgroundLayer)
        backgroundCropNode.addChild(circleLayer)
        addChild(backgroundCropNode)
    }
}

class Map {
    let image: UIImage
    let points: [CGPoint]
    let startPosition: CGPoint
    
    var path: CGPath!
    
    init(level: Level, mapSize: CGSize) {
        image = level.mapImage
        points = level.pathPoints
        startPosition = level.pathPoints[0]
        
        let path = createPath(mapSize: mapSize)
        self.path = path
    }
    convenience init() {
        print("Stub init used")
        self.init(level: Levels.sharedInstance.levels[0], mapSize: CGSizeZero)
    }
    
    func createPath(mapSize mapSize: CGSize) -> CGPath {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 1024, height: 576), false, 0)
        
        let context = UIGraphicsGetCurrentContext()
        
        CGContextBeginPath(context)
        CGContextMoveToPoint(context, startPosition.x, startPosition.y)
        CGContextAddLines(context, UnsafePointer(points), points.count)
        
        //translating based on device
        let deltaYTrans: CGFloat = startPosition.y
        CGContextTranslateCTM(context, 0, -deltaYTrans)
        
        //Scaling to device
        let scale: CGFloat = 1024 / mapSize.width
        CGContextScaleCTM(context, scale, scale)
        
        let path = CGContextCopyPath(context)!

        UIGraphicsEndImageContext()
        
        return path
    }
}