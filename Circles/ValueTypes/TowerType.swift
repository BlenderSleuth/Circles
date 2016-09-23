//
//  TowerType.swift
//  Circles
//
//  Created by Ben Sutherland on 10/07/2016.
//  Copyright © 2016 blendersleuthgraphics. All rights reserved.
//

import SpriteKit
let towerTextures: [TowerType: SKTexture] =
	 [.triangle:	SKTexture(imageNamed:	"Triangle1"),
	  .diamond:		SKTexture(imageNamed:	"Diamond1"),
	//No textures yet
	//.pentagon:	"Pentagon1",
	//.hexagon:		"Hexagon1",
	//.heptagon:	"Heptagon1",
	//.octagon:		"Octogon1",
	//.nonagon:		"Nonagon1",
	//.decagon:		"Decagon1",
	  .rainbowDodecagon: SKTexture(imageNamed:	"RainbowDodecagon1")]

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
		return UIColor.red
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
		if let name = towerTextures[self] {
			return name
		} else {
			return towerTextures[.triangle]!
		}
		
	}
	
	static func getTypeForTexture(_ texture: SKTexture?) -> TowerType? {
		if let texture = texture {
			let type = towerTextures.filter {
				$0.1 == texture
				}.map {
					$0.0
			}
			return type.first
		}
		return nil
	}
	
	static var allTowers: [TowerType] {
		return [.triangle, .diamond, .pentagon, .hexagon, .heptagon, .octagon, .nonagon, .decagon, .rainbowDodecagon]
	}
}
