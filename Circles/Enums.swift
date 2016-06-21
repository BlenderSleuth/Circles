//
//  Enums.swift
//  Circles
//
//  Created by Ben Sutherland on 20/06/2016.
//  Copyright © 2016 blendersleuthgraphics. All rights reserved.
//

import SpriteKit

public enum LayerZposition: CGFloat {
    case Background = -5
    case CircleLayer = 0
    case Sprites = 5
}

public enum CircleType: Int {
    case Green = 0
    case Blue = 1
    case Purple = 2
    
    public var radius: CGFloat {
        switch self {
        case .Green:
            return 20
        case .Blue:
            return 30
        case .Purple:
            return 60
        }
    }
    
    public var damage: CGFloat {
        switch self {
        case .Green:
            return 2
        case .Blue:
            return 4
        case .Purple:
            return 10
        }
    }
    
    public var speed: CGFloat {
        switch self {
        case .Green:
            return 50
        case .Blue:
            return 75
        case .Purple:
            return 130
        }
    }
    
    public var color: UIColor {
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