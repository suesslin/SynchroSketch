//
//  ViewController.swift
//  Sobyo
//
//  Created by Lukas A. Müller on 15/05/16.
//  Copyright © 2016 Lukas Müller. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    let ref = Firebase(url: "sobyo.firebaseio.com")
    
    @IBOutlet var drawView: DrawView!

    @IBAction func colorSelection(sender: AnyObject) {
        let drawing: DrawView = drawView as! DrawView
        let alert = UIAlertController(title: "Choose a color", message: nil, preferredStyle: .ActionSheet)
        let red = UIAlertAction(title: "Red", style: .Default) { (action) in
            drawing.currentColor = UIColor.redColor()
            print("Change!")
        }
        let green = UIAlertAction(title: "Green", style: .Default) { (action) in
            drawing.currentColor = UIColor.greenColor()
            print("Change!")
        }
        let orange = UIAlertAction(title: "Orange", style: .Default) { (action) in
            drawing.currentColor = UIColor.orangeColor()
            print("Change!")
        }
        let purple = UIAlertAction(title: "Purple", style: .Default) { (action) in
            drawing.currentColor = UIColor.purpleColor()
            print("Change!")
        }
        let blue = UIAlertAction(title: "blue", style: .Default) { (action) in
            drawing.currentColor = UIColor.blueColor()
            print("Change!")
        }
        let brown = UIAlertAction(title: "Brown", style: .Default) { (action) in
            drawing.currentColor = UIColor.brownColor()
            print("Change!")
        }
        let yellow = UIAlertAction(title: "Yellow", style: .Default) { (action) in
            drawing.currentColor = UIColor.yellowColor()
            print("Change!")
        }
        
        alert.addAction(red)
        alert.addAction(green)
        alert.addAction(orange)
        alert.addAction(purple)
        alert.addAction(blue)
        alert.addAction(brown)
        alert.addAction(yellow)
        
        
        presentViewController(alert, animated: true, completion: nil)
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref.observeEventType(.Value, withBlock: { (snapshot) in
            var newLines = [Line]()
            
            for line in snapshot.children {
                let line = Line(snapshot: line as! FDataSnapshot)
                newLines.append(line)
            }
            
            let drawing: DrawView = self.drawView as! DrawView
            drawing.lines = newLines
            debugPrint(drawing.lines)
            
        })

}

}