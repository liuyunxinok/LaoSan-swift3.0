//
//  LSArrayExtension.swift
//  LaoSan
//
//  Created by liuyunxin on 2017/9/4.
//  Copyright © 2017年 liuyunxin. All rights reserved.
//

import Foundation

extension Array {
    
    /// 写个取数组元素防止越界崩溃的方法
    ///
    /// - Parameter index: 下标
    /// - Returns: 返回值
    func ls_objectWithIndex(index: Int) -> AnyObject? {
        if index < 0 || index > self.count {
            return nil
        }
        return self[index] as AnyObject
    }
}
