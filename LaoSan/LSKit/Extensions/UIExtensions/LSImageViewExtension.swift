//
//  LSImageViewExtension.swift
//  LaoSan
//
//  Created by liuyunxin on 2017/8/31.
//  Copyright © 2017年 liuyunxin. All rights reserved.
//

import UIKit

extension UIImageView {

    
    /// 创建imageView的便利方法
    ///
    /// - Parameters:
    ///   - image: 图片
    ///   - contentMode: 填充模式
    convenience init(image: UIImage?, contentMode: UIViewContentMode){
        self.init()
        self.image = image
        self.contentMode = contentMode
    }
}
