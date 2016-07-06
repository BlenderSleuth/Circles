//
//  TowerPickerNode.swift
//  Circles
//
//  Created by Ben Sutherland on 15/05/2016.
//  Copyright © 2016 blendersleuthgraphics. All rights reserved.
//

import SpriteKit

class TowerUpgradeNode: SKSpriteNode {
    var currentTowerSelected: TowerEntity?
    
    init(size: CGSize, aspectRatio: CGFloat) {
        let height = size.height - (size.height / aspectRatio)
        let nodeSize = CGSize(width: size.width, height: height)
        
        super.init(texture: nil, color: .orange(), size: nodeSize)
        
        self.position = CGPoint(x: size.width, y: 0)
        anchorPoint = CGPoint(x: 0.5, y: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class TowerPickerNode: SKSpriteNode {
    
    init(size: CGSize, aspectRatio: CGFloat) {
        let height = size.height - (size.height / aspectRatio)
        let nodeSize = CGSize(width: size.width, height: height)
        
        super.init(texture: nil, color: .purple(), size: nodeSize)
        
        self.position = CGPoint(x: 0, y: 0)
        anchorPoint = CGPoint(x: 0.5, y: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
