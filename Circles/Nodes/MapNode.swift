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
    
    let mapAspectRatio: CGFloat = 4/3
    
    let circleLayer: SKSpriteNode
    let backgroundLayer: SKSpriteNode
    
    init(level: Level, size: CGSize) {
        map = Map(level: level)
        
        let texture = SKTexture(image: level.mapImage)
        let mapSize = CGSizeMake(size.width, size.height / mapAspectRatio)
        
        //Get the correct size of the map
        let imageRatio = texture.size().height / texture.size().width
        let imageWidth = mapSize.width
        let imageHeight = mapSize.width * imageRatio
        let imageSize = CGSizeMake(imageWidth, imageHeight)
        
        backgroundLayer = SKSpriteNode(texture: texture, size: imageSize)
        circleLayer = SKSpriteNode(color: .clearColor(), size: mapSize)
        
        super.init(texture: nil, color: .orangeColor(), size: mapSize)
        
        position = CGPoint(x: size.width / 2, y: size.height - mapSize.height / 2)
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        setupLayers()
    }
    func setupLayers() {
        let backgroundCropNode = SKCropNode()
        backgroundCropNode.maskNode = SKSpriteNode(color: .blackColor(), size: size)
        
        backgroundLayer.zPosition = LayerZposition.Background.rawValue
        
        backgroundCropNode.addChild(backgroundLayer)
        addChild(backgroundCropNode)
        
        circleLayer.zPosition = LayerZposition.CircleLayer.rawValue
        addChild(circleLayer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        //Placeholder
        map = Map()
        circleLayer = SKSpriteNode()
        backgroundLayer = SKSpriteNode()
        super.init(coder: aDecoder)
    }
}