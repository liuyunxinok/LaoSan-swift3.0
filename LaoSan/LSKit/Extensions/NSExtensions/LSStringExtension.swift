//
//  LSStringExtension.swift
//  LaoSan
//
//  Created by liuyunxin on 2017/9/4.
//  Copyright © 2017年 liuyunxin. All rights reserved.
//

import Foundation

extension String {
    
    /// 验证邮箱格式
    ///
    /// - Parameter isStricterFilter: 规定是否严格判断格式
    /// - Returns: 结果
    func isValidateEmail(isStricterFilter: Bool) -> Bool {
        let stricterFilterString = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9-]+[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let laxString = ".+@.+\\.[A-Za-z]{2}[A-Za-z]*"
        let emailRegex = isStricterFilter ? stricterFilterString : laxString
        let emailCheck = NSPredicate.init(format: "SELF MATCHES %@", emailRegex)
        return emailCheck.evaluate(with:self)
    }
    
    
//    func isValidateIDCard() -> Bool {
//        if self.characters.count != 18 {
//            return false
//        }
//        let codeArray = ["7","9","10","5","8","4","2","1","6","3","7","9","10","5","8","4","2"]
//        let checkCodeDic = ["1":"0","0":"1","X":"2","9":"3","8":"4","7":"5","6":"6","5":"7","4":"8","3":"9","2":"10"]
////        let scan = Scanner(string: self.substring(to: String.Index( 17))
//    
//    }
    
    
    
    
    
    
    
}
