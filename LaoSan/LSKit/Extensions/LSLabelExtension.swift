//
//  LSLabelExtension.swift
//  LaoSan
//
//  Created by liuyunxin on 2017/8/31.
//  Copyright © 2017年 liuyunxin. All rights reserved.
//

import UIKit

extension UILabel {

    
    /// 创建label的便利方法
    ///
    /// - Parameters:
    ///   - text: 文本
    ///   - fontSize: 字体大小
    ///   - textColor: 文本颜色
    convenience init(text: String?, fontSize: CGFloat, textColor: UIColor){
        self.init()
        self.text = text
        self.font = UIFont.systemFont(ofSize: fontSize)
        self.textColor = textColor
    }
}
