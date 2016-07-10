//
//  Tower.swift
//  Circles
//
//  Created by Ben Sutherland on 23/06/2016.
//  Copyright © 2016 blendersleuthgraphics. All rights reserved.
//

import GameplayKit

class TowerEntity: GKEntity {
    let type: TowerType
    init(type: TowerType) {
        self.type = type
		super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}