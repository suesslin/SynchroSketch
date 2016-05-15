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
            drawing.currentColor = UIColor.redColor()
            print("Change!")
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