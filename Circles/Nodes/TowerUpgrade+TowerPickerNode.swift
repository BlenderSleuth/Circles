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
        let nodeSize = CGSizeMake(size.width / 2, height)
        
        super.init(texture: nil, color: .orangeColor(), size: nodeSize)
        
        self.position = CGPoint(x: size.width, y: 0)
        anchorPoint = CGPoint(x: 1, y: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class TowerPickerNode: SKSpriteNode {
    
    init(size: CGSize, aspectRatio: CGFloat) {
        let height = size.height - (size.height / aspectRatio)
        let nodeSize = CGSizeMake(size.width / 2, height)
        
        super.init(texture: nil, color: .purpleColor(), size: nodeSize)
        
        self.position = CGPoint(x: 0, y: 0)
        anchorPoint = CGPoint(x: 0, y: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}