//
//  TowerPickerNode.swift
//  Circles
//
//  Created by Ben Sutherland on 15/05/2016.
//  Copyright © 2016 blendersleuthgraphics. All rights reserved.
//

import SpriteKit

struct TowerType {
    
}

protocol TowerPickerNodeProtocol {
    func towers() -> [TowerType]
}

class TowerPickerNode: SKNode, TowerPickerNodeProtocol {
    func towers() -> [TowerType] {
        return []
    }
}