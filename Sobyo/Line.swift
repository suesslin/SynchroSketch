//
//  Line.swift
//  Sobyo
//
//  Created by Lukas A. Müller on 15/05/16.
//  Copyright © 2016 Lukas Müller. All rights reserved.
//

import UIKit

class Line {
    
    let startingPoint: CGPoint
    let endingPoint: CGPoint
    var color: UIColor
    
    init(start: CGPoint, end: CGPoint, color: UIColor) {
        startingPoint = start
        endingPoint = end
        self.color = color
    }
    
}