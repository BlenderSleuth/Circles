//
//  LevelSelectViewController.swift
//  Circles
//
//  Created by Ben Sutherland on 15/05/2016.
//  Copyright © 2016 blendersleuthgraphics. All rights reserved.
//

import UIKit

class LevelSelectViewController: UIViewController {
    
    var lastPanPoint: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func viewPanned(sender: UIPanGestureRecognizer) {
        if lastPanPoint != nil {
            let point = sender.translationInView(self.view)
            let velocity = point - lastPanPoint
            let direction = velocity.x <= 0 ? -1 : 1
        }
        lastPanPoint = sender.translationInView(self.view)
    }
    @IBAction func backButtonPressed(sender: AnyObject) {
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    /*
     @IBAction func playButtonPressed(sender: AnyObject) {
     if let WinViewController = storyboard?.instantiateViewControllerWithIdentifier("WinViewController") as? WinViewController {
     navigationController?.pushViewController(WinViewController, animated: true)
     }
     }
     */
}