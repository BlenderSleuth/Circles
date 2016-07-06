//
//  WinViewController.swift
//  Circles
//
//  Created by Ben Sutherland on 15/05/2016.
//  Copyright © 2016 blendersleuthgraphics. All rights reserved.
//

import UIKit

class WinViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func button(_ sender: AnyObject) {
        if let levelSelectViewController = navigationController?.viewControllers[1] as? LevelSelectViewController {
            _ = navigationController?.popToViewController(levelSelectViewController, animated: true)
        }
    }
}
