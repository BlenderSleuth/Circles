//
//  Wave.swift
//  Circles
//
//  Created by Ben Sutherland on 23/06/2016.
//  Copyright © 2016 blendersleuthgraphics. All rights reserved.
//

class Wave {
    var green: Int
    var blue: Int
    var purple: Int
    
    let indexCount = 3
    
    let timing = [Int]()
    
    subscript(index: Int) -> Int {
        get {
            switch index {
            case 0:
                return green
            case 1:
                return blue
            case 2:
                return purple
            default:
                print("Invalid Index")
                return 0
            }
        }
        set(value) {
            switch index {
            case 0:
                green = value
            case 1:
                blue = value
            case 2:
                purple = value
            default:
                print("Invalid Index")
                break
            }
        }
    }
    
    init(green: Int, blue: Int, purple: Int) {
        self.green = green
        self.blue = blue
        self.purple = purple
    }
}