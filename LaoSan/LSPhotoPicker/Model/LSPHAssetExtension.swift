//
//  LSPHAssetExtension.swift
//  LaoSan
//
//  Created by liuyunxin on 2017/9/1.
//  Copyright © 2017年 liuyunxin. All rights reserved.
//

import UIKit
import Photos

struct runTimeKey {
    static let isSelectedKey = "tcz_isSelectedKey"
    static let thumbImageKey = "tcz_thumbImageKey"
    static let imagePathKey = "tcz_imagePathKey"
    static let indexKey = "tcz_indexkey"
}

extension PHAsset{
    
    var isSelected: Bool? {
        set{
            objc_setAssociatedObject(self, runTimeKey.isSelectedKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
        get{
            return objc_getAssociatedObject(self,runTimeKey.isSelectedKey) as? Bool
        }
    }
    var thumbImage: UIImage? {
        set{
            objc_setAssociatedObject(self, runTimeKey.thumbImageKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get{
            return objc_getAssociatedObject(self, runTimeKey.thumbImageKey) as? UIImage
        }
    }
    var imagePath: String? {
        set{
            objc_setAssociatedObject(self, runTimeKey.imagePathKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        get{
            return objc_getAssociatedObject(self, runTimeKey.imagePathKey) as? String
        }
    }
    var index: Int? {
        set{
            objc_setAssociatedObject(self, runTimeKey.indexKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
        get{
            return objc_getAssociatedObject(self, runTimeKey.indexKey) as? Int
        }
    }
    
}
