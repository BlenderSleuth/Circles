//
//  TowerType.swift
//  Circles
//
//  Created by Ben Sutherland on 10/07/2016.
//  Copyright © 2016 blendersleuthgraphics. All rights reserved.
//

import SpriteKit

enum TowerType: Int {
	case triangle = 3
	case square
	case pentagon
	case hexagon
	case heptagon
	case octagon
	case nonagon
	case decagon
	case rainbowDodecagon = 20
	
	var color: UIColor {
		return UIColor.red()
	}
	
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
		case .square:
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
	var texture: SKTexture {
		let imageName: String
		
		switch self {
		case .triangle:
			imageName = "triangle"
		case .square:
			imageName = "square"
		case .pentagon:
			imageName = "pantagon"
		default:
			imageName = "square"
		}
		
		
		return SKTexture(imageNamed: imageName)
	}
}
