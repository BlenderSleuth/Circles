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
    let image: UIImage
    
    init(name: String, description: String, imageName: String) {
        self.name = name
        self.description = description
        image = UIImage(named: imageName)!
    }
}

struct Levels {
    static let sharedInstance = Levels()
    
    let level1 = Level(name: "Circles", description: "A Beginers course", imageName: "Level1")
    let levels: [Level]
    
    init() {
       levels = [level1]
    }
}