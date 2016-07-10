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
