//
//  LSViewExtension.swift
//  LaoSan
//
//  Created by liuyunxin on 2017/8/31.
//  Copyright © 2017年 liuyunxin. All rights reserved.
//

import UIKit

extension UIView {
    
    var ls_x: CGFloat {
        set{
            self.frame.origin.x = newValue
        }
        get{
            return self.frame.origin.x
        }
    }
    
    var ls_y: CGFloat {
        set{
            self.frame.origin.y = newValue
        }
        get{
            return self.frame.origin.y
        }
    }

    var ls_width: CGFloat {
        set{
            self.frame.size.width = newValue
        }
        get{
            return self.frame.width
        }
    }
    
    var ls_height: CGFloat {
        set{
            self.frame.size.height = newValue
        }
        get{
            return self.frame.height
        }
    }
    
    var ls_left: CGFloat {
        set{
            self.ls_x = newValue
        }
        get{
            return self.ls_x
        }
    }
    
    var ls_right: CGFloat {
        get{
            return self.ls_x + ls_width
        }
    }
    
    var ls_top: CGFloat {
        set{
            self.ls_y = newValue
        }
        get{
            return self.ls_y
        }
    }
    
    var ls_bottom: CGFloat {
        get{
            return self.ls_y + self.ls_height
        }
    }
    
    var ls_centerX: CGFloat {
        set{
            self.center.x = newValue
        }
        get{
            return self.center.x
        }
    }
    
    var ls_centerY: CGFloat {
        set{
            self.center.y = newValue
        }
        get{
            return self.center.y
        }
    }  
}
