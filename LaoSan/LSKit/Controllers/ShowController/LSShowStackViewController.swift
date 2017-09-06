//
//  LSShowStackViewController.swift
//  LaoSan
//
//  Created by liuyunxin on 2017/9/6.
//  Copyright © 2017年 liuyunxin. All rights reserved.
//

import UIKit

class LSShowStackViewController: LSBaseViewController {
    
    lazy var stackView: LSStackView = {
        let view = LSStackView(frame: CGRect(x: 0, y: self.view.ls_height - ls_stackViewHeight, width: SCREEN_WIDTH, height: ls_stackViewHeight))
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.stackView)
        self.stackView.dataSouece = [[ls_stackTitleKey:"待发货",ls_stackImageKey:""],[ls_stackTitleKey:"待收货",ls_stackImageKey:""],[ls_stackTitleKey:"待评价",ls_stackImageKey:""]]
    }
}
