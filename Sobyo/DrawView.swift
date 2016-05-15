//
//  DrawView.swift
//  Sobyo
//
//  Created by Lukas A. Müller on 15/05/16.
//  Copyright © 2016 Lukas Müller. All rights reserved.
//

import UIKit
import Firebase

class DrawView: UIView {
    
    let ref = Firebase(url: "http://sobyo.firebaseIO.com")
    
    var currentColor = UIColor.blackColor()
    var lines: [Line] = []
    
    var lastPoint: CGPoint!
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            lastPoint = touch.locationInView(self)
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            var movedPoint = touch.locationInView(self)
            let line = Line(key: "23", start: lastPoint, end: movedPoint, color: currentColor)
            let upload = ref.childByAppendingPath("\(Int(lastPoint.x))\(Int(lastPoint.y))\(Int(movedPoint.x))\(Int(movedPoint.y))")
            
            upload.setValue(line.convertToAnyObject())
            
            lines.append(line)
            
            lastPoint = movedPoint // So it starts from the last position
        }
        
        self.setNeedsDisplay()
    }
    
    override func drawRect(rect: CGRect)  {
        let con = UIGraphicsGetCurrentContext()
        
        CGContextSetLineCap(con, CGLineCap.Round)
        CGContextSetLineWidth(con, 3)
        
        for line in self.lines {
            CGContextBeginPath(con)
            CGContextMoveToPoint(con, line.startingPoint.x, line.startingPoint.y)
            CGContextAddLineToPoint(con, line.endingPoint.x, line.endingPoint.y)
            CGContextSetStrokeColorWithColor(con, line.color.CGColor)
            CGContextStrokePath(con)
        }
    }
    
    
}