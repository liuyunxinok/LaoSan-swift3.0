//
//  LSBaseNavigationController.swift
//  LaoSan
//
//  Created by liuyunxin on 2017/9/1.
//  Copyright © 2017年 liuyunxin. All rights reserved.
//

import UIKit

class LSBaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //一些基本设置
        self.interactivePopGestureRecognizer?.delegate = self as? UIGestureRecognizerDelegate
        self.navigationBar.tintColor = .white
        self.navigationBar.setBackgroundImage(UIImage(named: ""), for: .default)
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white, NSFontAttributeName : UIFont.ls_systemFont(18, type: .system)]
        self.navigationBar.shadowImage = UIImage()
        }
}
