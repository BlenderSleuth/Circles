//
//  Map.swift
//  Circles
//
//  Created by Ben Sutherland on 22/06/2016.
//  Copyright © 2016 blendersleuthgraphics. All rights reserved.
//

import SpriteKit

class Map {
    let image: UIImage
    let path: CGPath
    
    init(level: Level) {
        image = level.mapImage
        
        //Generate path
        var points = level.pathPoints
        
        let path = CGPathCreateMutable()
        CGPathMoveToPoint(path, nil, points[0].x, points[0].y)
        points.removeFirst()
        
        CGPathAddLines(path, nil, UnsafePointer(points), points.count)
        self.path = path
    }
    convenience init() {
        self.init(level: Levels.sharedInstance.levels[0])
    }
}