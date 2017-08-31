//
//  LSTableViewData.swift
//  LaoSan
//
//  Created by liuyunxin on 2017/8/31.
//  Copyright © 2017年 liuyunxin. All rights reserved.
//

import Foundation
import UIKit

enum LSTableCellType {
    //只有一个title
    case title
    //左右各一个title
    case leftRightTitle
    //左边小图标+title
    case imageTitle
    //一个输入框
    case textfield
    //左边title,右边开关
    case leftTitleRightSwitch
    //上下title
    case topBottomTitle
    //上title+下输入框
    case topTitleBottomTextField
    //other
    case other
    
    var cellName: String {
        get{
            switch self {
            case .title:
                return NSStringFromClass(LSLeftTitleCell.classForCoder())
            case .leftRightTitle:
                return NSStringFromClass(LSLeftTitleRightTitleCell.classForCoder())
            case .imageTitle:
                return NSStringFromClass(LSleftImageTitleCell.classForCoder())
            case .textfield:
                return NSStringFromClass(LSTextFiledCell.classForCoder())
            case .leftTitleRightSwitch:
                return NSStringFromClass(LSLeftTitleRightSwitchCell.classForCoder())
            case .topBottomTitle:
                return NSStringFromClass(LSTopBottomTitleCell.classForCoder())
            case .topTitleBottomTextField:
                return NSStringFromClass(LSTopTitleBottomTextFiledCell.classForCoder())
            default:
               return NSStringFromClass(LSBaseTableCell.classForCoder())
            }
        
        }
    }
}

protocol LSTableViewDataProtocol {
    
    //title
    var titleString: String? { get }
    //rightTitle
    var rightTitleString: String? { get }
    //bottomTitle
    var bottomTitleString: String? { get }
    //imageName
    var imageName: String? { get }
    //cellType
    var cellType: LSTableCellType { get }
    //cell height
    var cellHeight: CGFloat { get }
    
}

extension LSTableViewDataProtocol {

    var cellHeight: CGFloat {
        return ls_defaultCellHeight
    }
    
    var titleString: String? {
        return nil
    }
    
    var rightTitleString: String? {
        return nil
    }
    
    var bottomTitleString: String? {
        return nil
    }
    
    var imageName: String? {
        return nil
    }

}

struct LSTabelViewData: LSTableViewDataProtocol {
    
    //title
    var titleString: String?
    
    //rightTitle
    var rightTitleString: String?
    
    //bottomTitle
    var bottomTitleString: String?
    
    //imageName
    var imageName: String?
    
    //cell type
    var cellType: LSTableCellType

    init(type: LSTableCellType) {
        self.cellType = type
    }
    
}

