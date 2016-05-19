//
//  LevelSelectViewController.swift
//  Circles
//
//  Created by Ben Sutherland on 15/05/2016.
//  Copyright © 2016 blendersleuthgraphics. All rights reserved.
//

import UIKit

class LevelSelectViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func playButtonPressed(sender: AnyObject) {
        if let WinViewController = storyboard?.instantiateViewControllerWithIdentifier("WinViewController") as? WinViewController {
            navigationController?.pushViewController(WinViewController, animated: true)
        }
    }
    @IBAction func backButtonPressed(sender: AnyObject) {
        navigationController?.popToRootViewControllerAnimated(true)
    }
}