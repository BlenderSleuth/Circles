//
//  Level.swift
//  Circles
//
//  Created by Ben Sutherland on 19/05/2016.
//  Copyright © 2016 blendersleuthgraphics. All rights reserved.
//

import SpriteKit

class Level {
    let name: String
    let description: String
    let mapImage: UIImage
    let selectImage: UIImage
    let pathPoints: [CGPoint]
    let waves: [Wave]
    
    init(name: String, description: String, mapImage: UIImage, selectImage: UIImage, pathPoints: [CGPoint], waves: [Wave]) {
        self.name = name
        self.description = description
        self.mapImage = mapImage
        self.selectImage = selectImage
        self.pathPoints = pathPoints
        self.waves = waves
    }
}

struct Wave {
    let green: Int
    let blue: Int
    let purple: Int
    
    init(green: Int, blue: Int, purple: Int) {
        self.green = green
        self.blue = blue
        self.purple = purple
    }
}

struct Levels {
    static let sharedInstance = Levels()
    
    /*
    let level1 = Level(name: "Level 1", description: "A Beginers course",
                       mapImage: UIImage(named: "Level1Map")!, selectImage: UIImage(named: "Level1Select")!)
    let level2 = Level(name: "Level 2", description: "description",
                       mapImage: UIImage(named: "Level1Map")!, selectImage: UIImage(named: "Level1Select")!)
    let level3 = Level(name: "Level 3", description: "description",
                       mapImage: UIImage(named: "Level1Map")!, selectImage: UIImage(named: "Level1Select")!)
    let level4 = Level(name: "Level 4", description: "description",
                       mapImage: UIImage(named: "Level1Map")!, selectImage: UIImage(named: "Level1Select")!)
    let level5 = Level(name: "Level 5", description: "description",
                       mapImage: UIImage(named: "Level1Map")!, selectImage: UIImage(named: "Level1Select")!)
    let level6 = Level(name: "Level 6", description: "description",
                       mapImage: UIImage(named: "Level1Map")!, selectImage: UIImage(named: "Level1Select")!)
    */
    var levels: [Level]!
    
    init() {
       levels = loadLevelsFromPlist()//[level1, level2, level3, level4, level5, level6]
    }
    
    func loadLevelsFromPlist() -> [Level] {
        let plist = NSBundle.mainBundle().pathForResource("Levels", ofType: "plist")!
        let array = NSArray(contentsOfFile: plist) as! [[String: AnyObject]]
        
        var levelArray = [Level]()
        
        for level in array {
            let name = level["name"]! as! String
            let description = level["description"]! as! String
            let mapImage = level["mapImage"]! as! String
            let selectImage = level["selectImage"]! as! String
            
            let points = level["pathPoints"] as! [[String:AnyObject]]
            var pathPoints = [CGPoint]()
            
            for point in points {
                pathPoints.append(CGPoint(x: point["x"] as! CGFloat, y: point["y"] as! CGFloat))
            }
            let waveArray = level["waves"] as! [[Int]]
            
            var waves = [Wave]()
            for wave in waveArray {
                waves.append(Wave(green: wave[0], blue: wave[1], purple: wave[2]))
            }
            
            levelArray.append(Level(
                name: name,
                description: description,
                mapImage: UIImage(named: mapImage)!,
                selectImage: UIImage(named: selectImage)!,
                pathPoints: pathPoints,
                waves: waves))
        }
        
        return levelArray
    }
}