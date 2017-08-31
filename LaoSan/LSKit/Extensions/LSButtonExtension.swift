//
//  LSButtonExtension.swift
//  LaoSan
//
//  Created by liuyunxin on 2017/8/31.
//  Copyright © 2017年 liuyunxin. All rights reserved.
//

import UIKit

extension UIButton {

    
    /// 创建button的一个便利方法
    ///
    /// - Parameters:
    ///   - title: title
    ///   - bgImage: 背景图
    ///   - normalImage: 按钮图 normal
    ///   - hilImage: 按钮图 highlighted
    ///   - fontSize: 字体大小
    ///   - titleColor: 字体颜色
    ///   - fontType: 字体类型 system / bold
    convenience init(title: String, bgImage: String?, normalImage: String?, hilImage: String?, fontSize: CGFloat, titleColor: UIColor, fontType: UIFontType?){
        self.init()
        self.setTitle(title, for: .normal)
        self.setBackgroundImage(UIImage(named: bgImage ?? ""), for: .normal)
        self.setImage(UIImage(named: normalImage ?? ""), for: .normal)
        self.setImage(UIImage(named: hilImage ?? ""), for: .highlighted)
        self.setTitleColor(titleColor, for: .normal)
        self.titleLabel?.font = UIFont.ls_systemFont(fontSize, type: fontType ?? .system)
    }
}
