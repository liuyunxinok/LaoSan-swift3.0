//
//  LSPch.swift
//  LaoSan
//
//  Created by liuyunxin on 2017/8/31.
//  Copyright © 2017年 liuyunxin. All rights reserved.
//

import Foundation
//布局
import SnapKit
//photo
import Photos
import AssetsLibrary



/// 当前屏幕的宽高
let SCREEN_WIDTH = UIScreen.main.bounds.width
let SCREEN_HEIGHT = UIScreen.main.bounds.height

/// 当前屏幕的宽高与iPhone6的宽高比
let WIDTH_SCALE = SCREEN_WIDTH / 375
let HEIGHT_SCALE = SCREEN_HEIGHT / 667

/// 适配之后的宽高
func WIDTH_SCALE(_ width: CGFloat) -> CGFloat {
    return width * WIDTH_SCALE
}
func HEIGHT_SCALE(_ height: CGFloat) -> CGFloat {
    return height * HEIGHT_SCALE
}
/// leftMargin - rightMargin
let ls_leftMargin: CGFloat = 13
let ls_rightMargin: CGFloat = 13

/// defaultTableCell height
let ls_defaultCellHeight: CGFloat = 44


/// actionButtonHeight
let ls_actionButtonHeight: CGFloat = 50

/// 构造LSStackView时候数据源字典的key
let ls_stackTitleKey = "ls_stackViewTitleKey"
let ls_stackImageKey = "ls_stackViewImageKey"
let ls_stackViewHeight: CGFloat = 50




