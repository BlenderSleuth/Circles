//
//  MainMenuViewController.swift
//  Circles
//
//  Created by Ben Sutherland on 15/05/2016.
//  Copyright © 2016 blendersleuthgraphics. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func playButtonPressed(sender: AnyObject) {
        if let levelSelectViewController = storyboard?.instantiateViewControllerWithIdentifier("LevelSelectViewController") as? LevelSelectViewController {
            navigationController?.pushViewController(levelSelectViewController, animated: true)
        }
    }
}
