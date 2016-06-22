//
//  Enums.swift
//  Circles
//
//  Created by Ben Sutherland on 20/06/2016.
//  Copyright © 2016 blendersleuthgraphics. All rights reserved.
//

import SpriteKit

func createPolygonWithSides(numberOfSides: Int, radius: CGFloat) -> CGPath {
    let path = CGPathCreateMutable()
    CGPathMoveToPoint(path, nil, 0, 0)
    
    let oneSegment = π * 2 / CGFloat(numberOfSides)
    
    var points = [CGPoint]()
    
    for i in 1...numberOfSides {
        let point = CGPoint(x: sin(oneSegment * CGFloat(i)) * radius,
                            y: cos(oneSegment * CGFloat(i)) * radius)
        
        points.append(point)
    }
    
    CGPathAddLines(path, nil, UnsafePointer(points), points.count)
    CGPathCloseSubpath(path)
    return path
}

enum LayerZposition: CGFloat {
    case Background = -5
    case CircleLayer = 0
    case Sprites = 5
}

enum Device {
    case iPad
    case iPhone
}

enum CircleType: Int {
    case Green = 0
    case Blue = 1
    case Purple = 2
    
    //TODO: Radius multiplier
    func radius(large: Bool) -> CGFloat {
        let t: CGFloat
        switch self {
        case .Green:
            t = 10
        case .Blue:
            t = 15
        case .Purple:
            t = 30
        }
        if large {
            return 2*t
        } else {
            return t
        }
        
    }
    
    var damage: CGFloat {
        switch self {
        case .Green:
            return 2
        case .Blue:
            return 4
        case .Purple:
            return 10
        }
    }
    
    var speed: CGFloat {
        switch self {
        case .Green:
            return 50
        case .Blue:
            return 75
        case .Purple:
            return 130
        }
    }
    
    var color: UIColor {
        switch self {
        case .Green:
            return .greenColor()
        case .Blue:
            return .blueColor()
        case .Purple:
            return .purpleColor()
        }
    }
}

enum TowerType: Int {
    case Triangle = 3
    case Square
    case Pentagon
    case Hexagon
    case Heptagon
    case Octagon
    case Nonagon
    case Decagon
    case RainbowDodecagon = 20
    
    var radius: CGFloat {
        switch self.rawValue {
        case 0...10:
            return 30
        case 20:
            return 40
        default:
            return 30
        }
    }
    
    var attackSpeed: CGFloat {
        switch self {
        case .Square:
            return 10
        default:
            return 10
        }
    }
    
    var numOfSides: Int {
        return self.rawValue
    }
    
    var path: CGPath {
        return createPolygonWithSides(numOfSides, radius: radius)
    }
}