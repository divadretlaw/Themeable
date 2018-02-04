//
//  UIColorExtension.swift
//  Themeable
//
//  Created by David Walter on 02.02.18.
//  Copyright © 2018 David Walter. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(hex: String) {
        var hex = hex.hasPrefix("#") ? String(hex.dropFirst()) : hex
        
        guard hex.count == 8 || hex.count == 6 else {
            self.init(white: 1.0, alpha: 0.0)
            return
        }
        
        if hex.count == 6 {
            hex = "FF\(hex)"
        }
        
        self.init(
            red: CGFloat((Int(hex, radix: 16)! >> 16) & 0xFF) / 255.0,
            green: CGFloat((Int(hex, radix: 16)! >> 8) & 0xFF) / 255.0,
            blue: CGFloat((Int(hex, radix: 16)!) & 0xFF) / 255.0,
            alpha: CGFloat((Int(hex, radix: 16)!) >> 24 & 0xFF) / 255.0)
    }
    
    func hex() -> String {
        var (a, r, g, b): (CGFloat, CGFloat, CGFloat, CGFloat) = (0.0, 0.0, 0.0, 0.0)
        getRed(&r, green: &g, blue: &b, alpha: &a)
        return String(format: "#%02X%02X%02X%02X", Int(a*255), Int(r * 255), Int(g * 255), Int(b * 255))
    }
}
