//
//  LevelSelecterViewController.swift
//  Circles
//
//  Created by Ben Sutherland on 19/05/2016.
//  Copyright © 2016 blendersleuthgraphics. All rights reserved.
//

import UIKit

class SliderViewController: UIViewController, LevelTapProtocol, UIScrollViewDelegate {
    let sliderView = SliderView()
    
    @IBOutlet weak var scrollView: UIScrollView!
    var lastPanPointX: CGFloat!
    
    override func viewDidLayoutSubviews() {
        sliderView.frame = view.frame
        scrollView.addSubview(sliderView)
        sliderView.setupLevels()
        scrollView.contentSize = sliderView.frame.size
        
        view.layer.borderWidth = 1
        view.layer.frame = CGRect(x: -1, y: 0, width: view.frame.width + 2, height: view.frame.height)
        
        for subview in sliderView.subviews {
            if let levelView = subview as? LevelView {
                levelView.delegate = self
            }
        }
    }
    
    func levelTapped(level: Level) {
        if let gameViewController = storyboard?.instantiateViewControllerWithIdentifier("GameViewController") as? GameViewController {
            parentViewController!.navigationController?.pushViewController(gameViewController, animated: true)
            gameViewController.level = level
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