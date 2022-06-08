//
//  Color+Extension.swift
//  LearningWithPOC
//
//  Created by Apple on 01/04/22.
//

import UIKit
import Foundation

extension UIColor {
    static func random12() -> UIColor {
        return UIColor(
           red:   .random(),
           green: .random(),
           blue:  .random(),
           alpha: 1.0
        )
    }
    
    static func random() -> UIColor{
        let redColor = CGFloat(arc4random_uniform(255)) / 255.0
        let greenColor = CGFloat(arc4random_uniform(255)) / 255.0
        let blueColor = CGFloat(arc4random_uniform(255)) / 255.0
        return  UIColor(red: redColor, green: greenColor, blue: blueColor, alpha: 1.0)
    }
}
extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
