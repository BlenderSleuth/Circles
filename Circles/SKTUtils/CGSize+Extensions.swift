//
//  CGSize+Extensions.swift
//  Circles
//
//  Created by Ben Sutherland on 21/06/2016.
//  Copyright © 2016 blendersleuthgraphics. All rights reserved.
//

import SpriteKit

func / (lhs: CGSize, rhs: CGFloat) -> CGSize {
    return CGSizeMake(lhs.width / rhs, lhs.height / rhs)
}
func * (lhs: CGSize, rhs: CGFloat) -> CGSize {
    return CGSizeMake(lhs.width * rhs, lhs.height * rhs)
}