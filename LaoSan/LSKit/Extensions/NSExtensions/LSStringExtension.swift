//
//  LSStringExtension.swift
//  LaoSan
//
//  Created by liuyunxin on 2017/9/4.
//  Copyright © 2017年 liuyunxin. All rights reserved.
//

import Foundation

extension String {
    
    /// 字符长度
    public var length: Int {
        return self.characters.count
    }
    
    /// 检查是否空白
    public var isBlank: Bool {
        let trimmed = trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmed.isEmpty
    }
    
    ///去空格换行
    public mutating func trim() {
        self = self.trimmed()
    }
    
    /// string字数
    public var countofWords: Int {
        let regex = try? NSRegularExpression(pattern: "\\w+", options: NSRegularExpression.Options())
        return regex?.numberOfMatches(in: self, options: NSRegularExpression.MatchingOptions(), range: NSRange(location: 0, length: self.length)) ?? 0
    }
    
    /// 去空格换行 返回新的字符串
    public func trimmed() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    ///  json 字符转字典
    public func toDictionary() -> [String:AnyObject]? {
        if let data = self.data(using: String.Encoding.utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: [JSONSerialization.ReadingOptions.init(rawValue: 0)]) as? [String:AnyObject]
            } catch let error as NSError {
                print(error)
            }
        }
        return nil
    }
    
    /// String to Int
    public func toInt() -> Int? {
        if let num = NumberFormatter().number(from: self) {
            return num.intValue
        } else {
            return nil
        }
    }
    
    /// String to Double
    public func toDouble() -> Double? {
        if let num = NumberFormatter().number(from: self) {
            return num.doubleValue
        } else {
            return nil
        }
    }
    
    /// String to Float
    public func toFloat() -> Float? {
        if let num = NumberFormatter().number(from: self) {
            return num.floatValue
        } else {
            return nil
        }
    }
    
    /// String to Bool
    public func toBool() -> Bool? {
        let trimmedString = trimmed().lowercased()
        if trimmedString == "true" || trimmedString == "false" {
            return (trimmedString as NSString).boolValue
        }
        return nil
    }
    
    
    
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
