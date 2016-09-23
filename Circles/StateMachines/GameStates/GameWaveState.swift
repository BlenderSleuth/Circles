//
//  GameWaveState.swift
//  Circles
//
//  Created by Ben Sutherland on 14/08/2016.
//  Copyright © 2016 blendersleuthgraphics. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameWaveState: GKState {
	unowned let scene: GameScene
	
	init(scene: GameScene) {
		self.scene = scene
		super.init()
	}
	
	override func didEnter(from previousState: GKState?) {
	}
	
	override func isValidNextState(_ stateClass: AnyClass) -> Bool {
		return true
	}
}
