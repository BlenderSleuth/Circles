//
//  LevelView.swift
//  Circles
//
//  Created by Ben Sutherland on 21/05/2016.
//  Copyright © 2016 blendersleuthgraphics. All rights reserved.
//

import UIKit

class LevelView: UIView {
    
    let levelImage: UIImageView
    let levelLabel: UILabel
    let level: Level
    
    override func didMoveToSuperview() {
        
    }
    
    init(frame: CGRect, level: Level) {
        self.level = level
        levelImage = UIImageView()
        levelLabel = UILabel()

        super.init(frame: frame)
        
        backgroundColor = .blackColor()
        
        let margin = bounds.width / 80
        let topMargin = bounds.height / 5
        
        let origin = bounds.origin + CGPoint(x: margin, y:  topMargin)
        let size = CGSize(width: bounds.width - margin*2, height: bounds.height - (topMargin + margin))
        
        let imageFrame = CGRect(origin: origin, size: size)
        levelImage.frame = imageFrame
        
        levelImage.image = UIImage(named: level.imageName)
        levelImage.contentMode = .ScaleAspectFill
        levelImage.clipsToBounds = true
        addSubview(levelImage)
        
        levelLabel.text = level.name
        
        let model = UIDevice.currentDevice().model
        if (model == "iPhone") || (model == "iPod Touch") {
            levelLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 34)
        } else {
            levelLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 58)
        }
        
        levelLabel.textColor = .whiteColor()
        levelLabel.textAlignment = NSTextAlignment.Center
        levelLabel.frame = CGRect(x: 0, y: margin, width: bounds.width, height: bounds.height / 6)
        addSubview(levelLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}