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
            let point = sender.translationInView(sender.view).x
            let velocity = point - lastPanPointX
            if sliderView.frame.origin.x + velocity <= 10 {
                sliderView.frame.origin.x += velocity
            }
            sender.setTranslation(CGPointZero, inView: sender.view)
        }
        lastPanPointX = sender.translationInView(view).x
        
        if sender.state == .Ended {
            let velocity = sender.velocityInView(view)
            let magnitude = sqrt((velocity.x * velocity.x) + (velocity.y * velocity.y))
            let slideMultiplier = magnitude / 200
            
            let slideFactor = 0.1 * slideMultiplier     //Increase for more of a slide
            
            var finalPoint = CGPoint(x:sender.view!.center.x + (velocity.x * slideFactor), y:0)
            
            finalPoint.x = min(max(finalPoint.x, 0), self.view.bounds.size.width)
            
            UIView.animateWithDuration(Double(slideFactor * 2), delay: 0,
                options: UIViewAnimationOptions(rawValue: UIViewAnimationOptions.CurveEaseOut.rawValue + UIViewAnimationOptions.AllowUserInteraction.rawValue),
                animations: {sender.view!.center.x = finalPoint.x },
                completion: nil)
        }
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
                
                let levelFrame = CGRect(x: margin + ((levelGap + width) * CGFloat(level)), y: margin, width: width, height: height)
                
                let levelView = LevelView(frame: levelFrame, level: Levels.sharedInstance.levels[level])
                addSubview(levelView)
                
                let sliderFrame = CGRect(x: bounds.origin.x,
                                         y: bounds.origin.y,
                                         width: (width + levelGap ) * CGFloat(Levels.sharedInstance.levels.count),
                                         height: bounds.height)
                
                frame = sliderFrame
            }
        }
    }
}