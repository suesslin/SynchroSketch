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
    
    override func drawRect(rect: CGRect)  {
        let context = UIGraphicsGetCurrentContext()
        
        CGContextSetLineCap(context, CGLineCap.Round)
        CGContextSetLineWidth(context, 3)
        
        for line in self.lines {
            CGContextBeginPath(context)
            CGContextMoveToPoint(context, line.startingPoint.x, line.startingPoint.y)
            CGContextAddLineToPoint(context, line.endingPoint.x, line.endingPoint.y)
            CGContextStrokePath(context)
        }
    }
    
    
}