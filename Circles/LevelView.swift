//
//  LevelView.swift
//  Circles
//
//  Created by Ben Sutherland on 21/05/2016.
//  Copyright © 2016 blendersleuthgraphics. All rights reserved.
//

import UIKit

class LevelView: UIView {
    
    @IBOutlet weak var levelImage: UIImageView!
    @IBOutlet weak var levelLabel: UILabel!
    var level: Int = 0
    
    override func didMoveToSuperview() {
        levelImage.image = UIImage(named: "Level\(level)")
        print(levelImage.frame)
        print(frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}