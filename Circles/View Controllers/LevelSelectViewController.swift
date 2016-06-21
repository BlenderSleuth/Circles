//
//  LevelSelectViewController.swift
//  Circles
//
//  Created by Ben Sutherland on 15/05/2016.
//  Copyright © 2016 blendersleuthgraphics. All rights reserved.
//

import UIKit

class LevelSelectViewController: UIViewController {
    
    @IBOutlet weak var scrollingImage: ScrollingImage!
    
    private var i = 0
    override func viewDidLayoutSubviews() {
        i += 1
        if i == 1 {
            scrollingImage.setupSize()
            scrollingImage.scroll()
        }
    }
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        navigationController?.popToRootViewControllerAnimated(true)
    }
}

class ScrollingImage: UIView {
    let image = UIImage(named: "ScrollingBackground")!
    var imageView = UIImageView()
    var imageView2 = UIImageView()
    
    override func didMoveToSuperview() {
        imageView.image = image
        imageView.contentMode = .ScaleAspectFit
        addSubview(imageView)
        
        imageView2.image = image
        imageView2.contentMode = .ScaleAspectFit
        addSubview(imageView2)
    }
    
    func setupSize() {
        let size = CGSize(width: 3 * bounds.height, height: bounds.height)
        imageView.frame.size = size
        imageView2.frame.size = size
        imageView2.frame.origin.x = bounds.width
    }
    
    func scroll() {
        func animate(amountToMove: CGFloat, view: UIView, completion: (Bool) -> ()) {
            let pointsPerSec: CGFloat = 25
            
            let seconds = NSTimeInterval(abs(amountToMove) / pointsPerSec)
            
            UIView.animateWithDuration(seconds,
                                       delay: 0,
                                       options: UIViewAnimationOptions.CurveLinear,
                                       animations: {view.frame.origin.x += amountToMove}, completion: completion)
        }
        let lastPosX = -(imageView.frame.width - bounds.width)
        
        func loop() {
            let amountToMove = imageView.frame.origin.x + lastPosX
            animate(amountToMove, view: imageView) {_ in
                
                let amountToMove = -self.frame.width
                animate(amountToMove, view: self.imageView) {_ in
                    self.imageView.frame.origin.x = self.frame.width
                }
                
                animate(amountToMove, view: self.imageView2) {_ in
                    let amountToMove = self.imageView2.frame.origin.x + lastPosX
                    
                    animate(amountToMove, view: self.imageView2) {_ in
                        
                        let amountToMove = -self.frame.width
                        animate(amountToMove, view: self.imageView) {_ in
                            loop()
                        }
                        
                        animate(amountToMove, view: self.imageView2) {_ in
                            self.imageView2.frame.origin.x = self.frame.width
                        }
                    }
                }
            }
        }
        loop()
    }
}