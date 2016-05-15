//
//  Extension.swift
//  Sobyo
//
//  Created by Lukas A. Müller on 15/05/16.
//  Copyright © 2016 Lukas Müller. All rights reserved.
//

import UIKit

extension UIColor {
    func rgbaString() -> String? {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            return "\(red),\(green),\(blue),\(alpha)"
        }
        return nil
    }
    
    public convenience init?(rgbaString: String) {
        var red: Float = 0
        var green: Float = 0
        var blue: Float = 0
        var alpha: Float = 1
        
        let scanner = NSScanner(string: rgbaString)
        scanner.scanFloat(&red)
        scanner.scanString(",", intoString: nil)
        scanner.scanFloat(&green)
        scanner.scanString(",", intoString: nil)
        scanner.scanFloat(&blue)
        scanner.scanString(",", intoString: nil)
        scanner.scanFloat(&alpha)
        self.init(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alpha))
    }
}