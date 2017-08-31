//
//  LSLeftTitleRightSwitchCell.swift
//  LaoSan
//
//  Created by liuyunxin on 2017/8/31.
//  Copyright © 2017年 liuyunxin. All rights reserved.
//

import UIKit

//左边title,右边开关
class LSLeftTitleRightSwitchCell: LSBaseTableCell {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(text: nil, fontSize: ls_cellTitleFontSize, textColor: ls_cellTitleColor)
        return label
    }()
    
    lazy var switchButton: UISwitch = {
        let button = UISwitch()
        button.addTarget(self, action: #selector(LSLeftTitleRightSwitchCell.switchButtonValueChanged), for: .valueChanged)
        return button
    }()

    
    /// 开关状态改变时调用的方法
    func switchButtonValueChanged() -> Void {
        
    }
    
    override func creatSubCellUI() {
        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.switchButton)
    }
    
    override func loadTableData(data: LSTabelViewData) {
        self.titleLabel.text = data.titleString
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(ls_leftMargin)
            make.top.bottom.equalToSuperview()
            make.width.equalTo(self.contentView.ls_width / 3 * 2)
        }
        self.switchButton.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-ls_rightMargin)
            make.centerY.equalToSuperview()
        }
    }
    
}
