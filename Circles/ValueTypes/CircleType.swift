//
//  CircleType.swift
//  Circles
//
//  Created by Ben Sutherland on 10/07/2016.
//  Copyright © 2016 blendersleuthgraphics. All rights reserved.
//

import SpriteKit

enum CircleType: Int {
	case green = 0
	case blue = 1
	case purple = 2
	
	//Path width divisor
	var radiusDivisor: CGFloat {
		switch self {
		case .green:
			return 3.5
		case .blue:
			return 3.25
		case .purple:
			return 2.75
		}
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
	
	var texture: SKTexture {
		switch self {
		case .green:
			return SKTexture(imageNamed: "GreenCircle")
		case .blue:
			return SKTexture(imageNamed: "BlueCircle")
		case .purple:
			return SKTexture(imageNamed: "PurpleCircle")
		}
	}
}
