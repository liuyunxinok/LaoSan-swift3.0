//
//  LSShowLoadingButtonViewController.swift
//  LaoSan
//
//  Created by liuyunxin on 2017/9/6.
//  Copyright © 2017年 liuyunxin. All rights reserved.
//

import UIKit

class LSShowLoadingButtonViewController: LSBaseViewController {
    
    lazy var showTitleButton: LSLoadingButton = {
        let button = LSLoadingButton(title: "显示标题Loading", image: nil, hlImage: nil, bgImage: nil, fontSize: 17, titleColor: .white, loadingIsShowTitle: .show)
        button.backgroundColor = .green
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(didClickShowTitleLoadingButton), for: .touchUpInside)
        return button
    }()
    
    lazy var noneTitleButton: LSLoadingButton = {
        let button = LSLoadingButton(title: "不显示标题Loading", image: nil, hlImage: nil, bgImage: nil, fontSize: 17, titleColor: .white, loadingIsShowTitle: .none)
        button.backgroundColor = .red
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(didClickNoneShowTitleLoadingButton), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.showTitleButton)
        self.view.addSubview(self.noneTitleButton)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.showTitleButton.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(ls_leftMargin)
            make.top.equalToSuperview().offset(HEIGHT_SCALE(200))
            make.right.equalToSuperview().offset(-ls_rightMargin)
            make.height.equalTo(ls_actionButtonHeight)
        }
        
        self.noneTitleButton.snp.makeConstraints { (make) in
            make.left.right.height.equalTo(self.showTitleButton)
            make.top.equalTo(self.showTitleButton).offset(HEIGHT_SCALE(80))
        }
        
    }
    
    
    /// loading中显示title按钮点击事件
    func didClickShowTitleLoadingButton() -> Void {
        self.showTitleButton.isEnabled = false
        self.showTitleButton.startLoading()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 6) { 
            self.showTitleButton.stopLoading()
            self.showTitleButton.isEnabled = true
        }
    }
    
    /// loading中不显示title的按钮点击事件
    func didClickNoneShowTitleLoadingButton() -> Void {
        self.noneTitleButton.isEnabled = false
        self.noneTitleButton.startLoading()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 6) {
            self.noneTitleButton.stopLoading()
            self.noneTitleButton.isEnabled = true
        }
    }

}
