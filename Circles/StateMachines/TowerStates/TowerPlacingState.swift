//
//  TowerPlacingState.swift
//  Circles
//
//  Created by Ben Sutherland on 8/08/2016.
//  Copyright © 2016 blendersleuthgraphics. All rights reserved.
//

import GameplayKit

class TowerPlacingState: GKState {
	unowned let scene: GameScene
	
	init(scene: SKScene) {
		self.scene = scene as! GameScene
		super.init()
	}
	
	override func didEnter(withPreviousState previousState: GKState?) {
	}
	
	override func isValidNextState(_ stateClass: AnyClass) -> Bool {
		return true
	}
}
