//
//  Enums.swift
//  Circles
//
//  Created by Ben Sutherland on 20/06/2016.
//  Copyright © 2016 blendersleuthgraphics. All rights reserved.
//

import SpriteKit

/**
This method will generate a closed CGPath polygon from a given number of sides and radius.

 - Note:
	1 or 2 sides will not work

- parameters:
	- numberOfSides: The number of sides to make the polygon
	- radius: Radius of polygon to generate
*/
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
	case UI = 10
}
