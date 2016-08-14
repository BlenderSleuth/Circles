//
//  GamePausedState.swift
//  Circles
//
//  Created by Ben Sutherland on 8/08/2016.
//  Copyright © 2016 blendersleuthgraphics. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameStartState: GKState {
	unowned let scene: GameScene
	
	init(scene: GameScene) {
		self.scene = scene
		super.init()
	}
	
	override func didEnter(withPreviousState previousState: GKState?) {
		
	}
}
