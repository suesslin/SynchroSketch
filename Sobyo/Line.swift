//
//  Line.swift
//  Sobyo
//
//  Created by Lukas A. Müller on 15/05/16.
//  Copyright © 2016 Lukas Müller. All rights reserved.
//

import UIKit
import Firebase

class Line {
    
    var key: String
    var ref: Firebase?
    
    let startingPoint: CGPoint
    let endingPoint: CGPoint
    var color: UIColor
    
    init(key: String, start: CGPoint, end: CGPoint, color: UIColor) {
        
        self.key = key
        self.ref = nil
        
        startingPoint = start
        endingPoint = end
        self.color = color
    }
    
    init(snapshot: FDataSnapshot) {
        print(snapshot.value)
        print(snapshot.key)
        key = snapshot.key
        startingPoint = CGPoint(x: snapshot.value["startingPointX"] as! Double, y: snapshot.value["startingPointY"] as! Double)
        endingPoint = CGPoint(x: snapshot.value["endingPointX"] as! Double, y: snapshot.value["endingPointY"] as! Double)
        color = UIColor(rgbaString: (snapshot.value["color"] as! String))!
        ref = snapshot.ref
    }
    
}

extension Line {
    
    func convertToAnyObject() -> AnyObject {
        return [
            "startingPointX": self.startingPoint.x,
            "startingPointY": self.startingPoint.y,
            "endingPointX": self.endingPoint.x,
            "endingPointY": self.endingPoint.y,
            "color": self.color.rgbaString()!
        ]
    }
    
}