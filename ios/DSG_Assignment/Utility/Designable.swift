//
//  Designable.swift
//  Prasadarao upputuri
//
//  Created by Prasadarao upputuri on 28/06/21.
//  Copyright © 2021 DSG. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable extension UIView {
    
    @IBInspectable var roundRadius : Bool {
        set {
            self.layer.cornerRadius = self.frame.size.height / 2
            self.clipsToBounds = true
        }
        get {
            return layer.cornerRadius == (frame.size.height / 2)
        }
    }
    
    @IBInspectable var borderColor:UIColor? {
        set {
            layer.borderColor = newValue!.cgColor
        }
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            else {
                return nil
            }
        }
    }
    
    @IBInspectable
    var BorderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var CornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
