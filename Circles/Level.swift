//
//  Level.swift
//  Circles
//
//  Created by Ben Sutherland on 19/05/2016.
//  Copyright © 2016 blendersleuthgraphics. All rights reserved.
//

import SpriteKit

class Level {
    let name: String
    let description: String
    let imageName: String
    
    init(name: String, description: String, imageName: String) {
        self.name = name
        self.description = description
        self.imageName = imageName
    }
}

struct Levels {
    static let sharedInstance = Levels()
    
    let level1 = Level(name: "Level 1", description: "A Beginers course",    imageName: "Level1")
    let level2 = Level(name: "Level 2", description: "description",          imageName: "Level1")
    let level3 = Level(name: "Level 3", description: "description",          imageName: "Level1")
    let level4 = Level(name: "Level 4", description: "description",          imageName: "Level1")
    let level5 = Level(name: "Level 5", description: "description",          imageName: "Level1")
    let level6 = Level(name: "Level 6", description: "description",          imageName: "Level1")
    let levels: [Level]
    
    init() {
       levels = [level1, level2, level3, level4, level5, level6]
    }
}