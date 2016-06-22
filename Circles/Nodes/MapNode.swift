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
    
    let margin: CGFloat
    
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
        
        margin = (imageSize.height - mapSize.height)
        
        map = Map(level: level, size: mapSize, margin: margin)
        
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
    var pathImage: UIImage!
    
    init(level: Level, size: CGSize, margin: CGFloat) {
        image = level.mapImage
        
        points = level.pathPoints
        startPosition = level.pathPoints[0]
        
        let (path, pathImage) = createPath(size, margin: margin)
        self.path = path
        self.pathImage = pathImage
    }
    convenience init() {
        self.init(level: Levels.sharedInstance.levels[0], size: CGSizeZero, margin: 0)
    }
    
    func createPath(size: CGSize, margin: CGFloat) -> (CGPath, UIImage) {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 1024, height: 576), false, 0)
        
        let context = UIGraphicsGetCurrentContext()
        
        CGContextBeginPath(context)
        CGContextMoveToPoint(context, startPosition.x, startPosition.y)
        
        CGContextAddLines(context, UnsafePointer(points), points.count)

        let scale: CGFloat = (1024 / size.width)
        CGContextScaleCTM(context, scale, scale)
        
        //TODO: Fix translation
        CGContextTranslateCTM(context, 0, -margin/4)
        
        let path = CGContextCopyPath(context)!
        
        CGContextSetLineWidth(context, 1)
        CGContextSetStrokeColorWithColor(context, UIColor.redColor().CGColor)
        CGContextStrokePath(context)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return (path, image)
    }
}