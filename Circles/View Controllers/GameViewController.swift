//
//  GameViewController.swift
//  Circles
//
//  Created by Ben Sutherland on 15/05/2016.
//  Copyright (c) 2016 blendersleuthgraphics. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    //For testing
    var level: Level = Levels.sharedInstance.levels[0]
    
    @IBOutlet var skView: SKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        
        let scene = GameScene(size: skView.bounds.size, level: level)
        
        scene.scaleMode = .AspectFill
        
        skView.presentScene(scene)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
