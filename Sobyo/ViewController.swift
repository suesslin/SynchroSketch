//
//  ViewController.swift
//  Sobyo
//
//  Created by Lukas A. Müller on 15/05/16.
//  Copyright © 2016 Lukas Müller. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var drawView: DrawView!

    @IBAction func colorSelection(sender: AnyObject) {
            let drawing: DrawView = drawView as! DrawView
            drawing.currentColor = UIColor.redColor()
            print("Change!")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

