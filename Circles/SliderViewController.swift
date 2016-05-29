//
//  LevelSelecterViewController.swift
//  Circles
//
//  Created by Ben Sutherland on 19/05/2016.
//  Copyright © 2016 blendersleuthgraphics. All rights reserved.
//

import UIKit

class SliderViewController: UIViewController, LevelTapDelegate, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewWillLayoutSubviews() {
        let sliderView = SliderView()
        scrollView.addSubview(sliderView)
        scrollView.contentSize = sliderView.setupLevels(bounds: view.bounds).size
        
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
    
    func setupLevels(bounds bounds: CGRect) -> CGRect {
        //constants
        let margin = bounds.width / 100
        let height = bounds.height - margin * 2
        let width = height / 3 * 2
        let levelGap = margin * 2
        
        //iterate through levels
        for level in 0...Levels.sharedInstance.levels.count - 1 {
            
            let levelFrame = CGRect(x: margin + ((levelGap + width) * CGFloat(level)), y: margin, width: width, height: height)
            let levelView = LevelView(frame: levelFrame, level: Levels.sharedInstance.levels[level])
            addSubview(levelView)
        }
        
        let sliderFrame = CGRect(x: bounds.origin.x,
                                 y: bounds.origin.y,
                                 width: (width + levelGap ) * CGFloat(Levels.sharedInstance.levels.count),
                                 height: bounds.height)
        
        frame = sliderFrame
        return sliderFrame
    }
}