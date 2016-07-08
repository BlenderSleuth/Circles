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
	
	let pathWidth: CGFloat
	
	private let pathFraction: CGFloat = 9
    
    init(level: Level, size: CGSize, aspectRatio: CGFloat) {
        let texture = SKTexture(image: level.mapImage)
        let mapSize = CGSize(width: size.width, height: size.height / aspectRatio)
        
        //Get the correct size of the map
        let imageRatio = texture.size().height / texture.size().width
        let imageWidth = mapSize.width
        let imageHeight = mapSize.width * imageRatio
        let imageSize = CGSize(width: imageWidth, height: imageHeight)
        
        backgroundLayer = SKSpriteNode(texture: texture, size: imageSize)
        circleLayer = SKSpriteNode(color: .clear(), size: imageSize)
        
        margin = (imageSize.height - mapSize.height)/2
        map = Map(level: level, mapSize: mapSize)
		
		pathWidth = mapSize.height / pathFraction
		
        super.init(texture: nil, color: .orange(), size: mapSize)
        position = CGPoint(x: size.width / 2, y: size.height - mapSize.height / 2)
        
        setupLayers()
    }
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
    
    func setupLayers() {
        let backgroundCropNode = SKCropNode()
        backgroundCropNode.maskNode = SKSpriteNode(color: .black(), size: size)
        
        backgroundLayer.zPosition = LayerZposition.background.rawValue
        
        circleLayer.zPosition = LayerZposition.circleLayer.rawValue
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
        self.init(level: Levels.sharedInstance.levels[0], mapSize: CGSize.zero)
    }
    
    func createPath(mapSize: CGSize) -> CGPath {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 1024, height: 576), false, 0)
        
        let context = UIGraphicsGetCurrentContext()
        
        context?.beginPath()
        context?.moveTo(x: startPosition.x, y: startPosition.y)
        context?.addLines(between: UnsafePointer(points), count: points.count)
        
        //translating based on device
        let deltaYTrans: CGFloat = startPosition.y
        context?.translate(x: 0, y: -deltaYTrans)
        
        //Scaling to device
        let scale: CGFloat = 1024 / mapSize.width
        context?.scale(x: scale, y: scale)
        
        let path = context?.path()!

        UIGraphicsEndImageContext()
        
        return path!
    }
}
