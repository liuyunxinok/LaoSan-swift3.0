//
//  LSColorExtension.swift
//  LaoSan
//
//  Created by liuyunxin on 2017/8/31.
//  Copyright © 2017年 liuyunxin. All rights reserved.
//

import UIKit

extension UIColor {

    /// 根据十六进制色值获取color
    ///
    /// - Parameter hex: 十六进制色值
    /// - Returns: color
    class func colorWithHexValue(hex: UInt32) -> UIColor {
        let r = (hex >> 16) & 0xFF
        let g = (hex >> 8) & 0xFF
        let b = hex & 0xFF
        return UIColor(red: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: 1)
    }
}
