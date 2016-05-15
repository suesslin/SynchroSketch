//
//  DrawView.swift
//  Sobyo
//
//  Created by Lukas A. Müller on 15/05/16.
//  Copyright © 2016 Lukas Müller. All rights reserved.
//

import UIKit

class DrawView: UIView {
    
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
            lines.append(Line(start: lastPoint, end: movedPoint))
            lastPoint = movedPoint // So it starts from the last position
        }
        
        self.setNeedsDisplay()
    }
    
    override func drawRect(rect: CGRect) {
        let con = UIGraphicsGetCurrentContext()
        CGContextBeginPath(con)
        
        for line in lines {
            CGContextMoveToPoint(con, line.startingPoint.x, line.endingPoint.y)
            CGContextAddLineToPoint(con, line.endingPoint.y, line.startingPoint.x)
            CGContextSetRGBStrokeColor(con, 0, 0, 0, 1.0)
            CGContextStrokePath(con)
        }
        
    }
    
    
}