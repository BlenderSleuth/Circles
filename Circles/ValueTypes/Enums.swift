//
//  Enums.swift
//  Circles
//
//  Created by Ben Sutherland on 20/06/2016.
//  Copyright © 2016 blendersleuthgraphics. All rights reserved.
//

import SpriteKit

func createPolygonWithSides(_ numberOfSides: Int, radius: CGFloat) -> CGPath {
	let path = CGMutablePath()
	path.moveTo(nil, x: 0, y: 0)
	
	let oneSegment = π * 2 / CGFloat(numberOfSides)
	
	var points = [CGPoint]()
	
	for i in 1...numberOfSides {
		let point = CGPoint(x: sin(oneSegment * CGFloat(i)) * radius,
		                    y: cos(oneSegment * CGFloat(i)) * radius)
		
		points.append(point)
	}
	
	path.addLines(nil, between: UnsafePointer(points), count: points.count)
	path.closeSubpath()
	return path
}

enum LayerZposition: CGFloat {
	case background = -5
	case circleLayer = 0
	case sprites = 5
}

enum Device {
	case iPad
	case iPhone
}

enum CircleType: Int {
	case green = 0
	case blue = 1
	case purple = 2
	
	//Path width divisor
	var radiusDivisor: CGFloat {
		let divisor: CGFloat
		switch self {
		case .green:
			divisor = 3.5
		case .blue:
			divisor = 3.25
		case .purple:
			divisor = 2.75
		}
		return divisor
	}
	
	var damage: CGFloat {
		switch self {
		case .green:
			return 2
		case .blue:
			return 4
		case .purple:
			return 8
		}
	}
	
	var speed: CGFloat {
		switch self {
		case .green:
			return 20
		case .blue:
			return 75
		case .purple:
			return 130
		}
	}
	
	var color: UIColor {
		switch self {
		case .green:
			return .green()
		case .blue:
			return .blue()
		case .purple:
			return .purple()
		}
	}
}

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
}
