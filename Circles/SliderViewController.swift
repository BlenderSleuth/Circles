//
//  LevelSelecterViewController.swift
//  Circles
//
//  Created by Ben Sutherland on 19/05/2016.
//  Copyright © 2016 blendersleuthgraphics. All rights reserved.
//

import UIKit

class SliderViewController: UIViewController {
    @IBOutlet weak var sliderView: SliderView!
    
    var lastPanPointX: CGFloat!
    
    override func viewDidLayoutSubviews() {
        sliderView.frame = view.bounds
        sliderView.setupLevels()
        
        
    }
    @IBAction func didPan(sender: UIPanGestureRecognizer) {
        if lastPanPointX != nil {
            let point = sender.translationInView(view).x
            let velocity = point - lastPanPointX
            if abs(velocity) < 100 {
                if sliderView.frame.origin.x + velocity <= 0 {
                    sliderView.frame.origin.x += velocity
                }
            }
        }
        lastPanPointX = sender.translationInView(view).x
    }
}

class SliderView: UIView {
    func setupLevels() {
        if let superview = superview {
            //iterate through levels
            for level in 0...Levels.sharedInstance.levels.count - 1{
                let margin = superview.bounds.width / 100
                let height = superview.bounds.height - margin*2
                let width = height / 3 * 2
                
                let levelGap = margin * 2
                
                let frame = CGRect(x: margin + ((levelGap + width) * CGFloat(level)), y: margin, width: width, height: height)
                
                let levelView = LevelView(frame: frame, level: Levels.sharedInstance.levels[level])
                addSubview(levelView)
                
                let sliderFrame = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: frame.width * CGFloat(Levels.sharedInstance.levels.count), height: bounds.height)
                self.frame = sliderFrame
            }
        }
    }
}