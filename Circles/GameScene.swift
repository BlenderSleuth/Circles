//
//  GameScene.swift
//  Circles
//
//  Created by Ben Sutherland on 15/05/2016.
//  Copyright (c) 2016 blendersleuthgraphics. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var level: Level!
    
    override func didMoveToView(view: SKView) {
        let label = SKLabelNode(text: level.name)
        label.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        addChild(label)
    }
}
