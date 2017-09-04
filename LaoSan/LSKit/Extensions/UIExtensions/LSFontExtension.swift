//
//  LSFontExtension.swift
//  LaoSan
//
//  Created by liuyunxin on 2017/8/31.
//  Copyright © 2017年 liuyunxin. All rights reserved.
//

import UIKit

/// 字体类型
///
/// - system: 常规
/// - bold: 加粗
public enum UIFontType {
    case system
    case bold
}

extension UIFont {
    
    
    /// 根据屏幕宽度做下字体调整
    ///
    /// - Parameters:
    ///   - fontSize: 375屏幕下的字体大小
    ///   - fontType: 常规还是加粗
    /// - Returns: 调整后的字体
    public class func ls_systemFont(_ size: CGFloat, type: UIFontType) -> UIFont {
        var resultFontSize = size
        switch SCREEN_WIDTH {
        case 320:
            resultFontSize *= (320 / 375)
            break
        case 414:
            resultFontSize *= (414 / 375)
            break
        default:
            break
        }
        
        switch type {
        case .bold:
            return UIFont.boldSystemFont(ofSize: resultFontSize)
        default:
            return UIFont.systemFont(ofSize: resultFontSize)
        }
    }
    
    
}
