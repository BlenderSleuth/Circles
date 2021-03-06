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
    
    var delegate: LevelTapDelegate?
    
    init(frame: CGRect, level: Level) {
        self.level = level
        levelImage = UIImageView()
        levelLabel = UILabel()
        super.init(frame: frame)
        
        backgroundColor = .black
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(LevelView.didTap(_:)))
        
        addGestureRecognizer(tapGesture)
        
        let margin = bounds.width / 80
        let topMargin = bounds.height / 5
        
        let origin = bounds.origin + CGPoint(x: margin, y:  topMargin)
        let size = CGSize(width: bounds.width - margin*2, height: bounds.height - (topMargin + margin))
        
        let imageFrame = CGRect(origin: origin, size: size)
        levelImage.frame = imageFrame
        
        levelImage.image = level.selectImage
        levelImage.contentMode = .scaleAspectFill
        levelImage.clipsToBounds = true
        addSubview(levelImage)
        
        levelLabel.text = level.name
        
        let model = UIDevice.current.model
        if (model == "iPhone") || (model == "iPod Touch") {
            levelLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 34)
        } else {
            levelLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 58)
        }
        
        levelLabel.textColor = .white
        levelLabel.textAlignment = NSTextAlignment.center
        levelLabel.frame = CGRect(x: 0, y: margin, width: bounds.width, height: bounds.height / 6)
        addSubview(levelLabel)
    }
    
    func didTap(_ tapRecognizer: UITapGestureRecognizer) {
        if tapRecognizer.state == .ended {
            if delegate != nil {
                delegate?.levelTapped(level)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

protocol LevelTapDelegate {
    func levelTapped(_ level: Level)
}
