//
//  LevelSelecterViewController.swift
//  Circles
//
//  Created by Ben Sutherland on 19/05/2016.
//  Copyright © 2016 blendersleuthgraphics. All rights reserved.
//

import UIKit

class LevelSelecterViewController: UIViewController {
    @IBOutlet weak var sliderView: SliderView!
    
    override func viewDidLayoutSubviews() {
        sliderView.frame = self.view.bounds
        sliderView.setupLevels()
        print(self.view.bounds)
    }
}

class SliderView: UIView {
    func setupLevels() {
        if let superview = superview {
            //iterate through levels
            for level in 1...Levels.sharedInstance.levels.count {
                
                let margin = superview.bounds.width / 100
                let sidelength = superview.bounds.height - margin*2
                
                let frame = CGRect(x: margin, y: margin, width: sidelength, height: sidelength)
                
                let nib = UINib(nibName: "LevelView", bundle: nil)
                let levelView = nib.instantiateWithOwner(self, options: nil)[0] as! LevelView
                levelView.level = level
                levelView.frame = frame
                
                addSubview(levelView)
            }
        }
    }
}

