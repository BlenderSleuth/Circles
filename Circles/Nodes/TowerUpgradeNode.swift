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
    
    init(sceneSize: CGSize, aspectRatio: CGFloat) {
        let height = sceneSize.height - (sceneSize.height / aspectRatio)
        let nodeSize = CGSize(width: sceneSize.width, height: height)
        
        super.init(texture: nil, color: .orange(), size: nodeSize)
        
        self.position = CGPoint(x: sceneSize.width, y: 0)
        anchorPoint = CGPoint(x: 0.5, y: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
