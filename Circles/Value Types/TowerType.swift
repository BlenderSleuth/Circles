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
	case diamond
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
		case .diamond:
			return 10
		default:
			return 10
		}
	}
	
	var numOfSides: Int {
		return self.rawValue
	}
	
	var texture: SKTexture {
		let imageName: String
		switch self {
		case .triangle:
			imageName = "Triangle1"
		case .diamond:
			imageName = "Diamond1"
		case .rainbowDodecagon:
			imageName = "RainbowDodecagon1"
		default:
			imageName = "Diamond1"
		}
		
		return SKTexture(imageNamed: imageName)
	}
	static var allTowers: [TowerType] {
		return [.triangle, .diamond, .pentagon, .hexagon, .heptagon, .octagon, .nonagon, .decagon, .rainbowDodecagon]
	}
}
