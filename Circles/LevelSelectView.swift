//
//  LevelSelectView.swift
//  Circles
//
//  Created by Ben Sutherland on 19/05/2016.
//  Copyright © 2016 blendersleuthgraphics. All rights reserved.
//

import UIKit

class LevelSelectView: UIView {
    
    let sliderView = SliderView()
    
    override func didMoveToSuperview() {
        print(self.bounds.size.height)
        
        
        
        sliderView.frame = self.bounds
        
        
        
        
        
        sliderView.backgroundColor = UIColor.blackColor()
        self.addSubview(sliderView)
    }
    
    func pan(direction: Int) {
        print(direction)
    }
}

class SliderView: UIView {
    //override func didMoveToSuperview() {
        //for i in 1...Levels.sharedInstance.levels.count {
            //let frame = CGRect(x: 10, y: 10, width: 500, height: 530)
            
            //let levelView = LevelView(level: i, frame: frame)
            //self.addSubview(levelView)
        //}
    //}
}

/*
class LevelView: UIView {
    let imageView: UIImageView
    
    init(level: Int, frame: CGRect) {
        imageView = UIImageView(frame: frame)
        super.init(frame: frame)
        
        imageView.image = UIImage(named: "Level\(level)")
        
        self.addSubview(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
 */