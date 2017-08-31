//
//  LSLeftTitleCell.swift
//  LaoSan
//
//  Created by liuyunxin on 2017/8/31.
//  Copyright © 2017年 liuyunxin. All rights reserved.
//

import UIKit

//只有左边显示文字的cell
class LSLeftTitleCell: LSBaseTableCell {

    lazy var titleLabel: UILabel = {
        let label = UILabel(text: nil, fontSize: ls_cellTitleFontSize, textColor: ls_cellTitleColor)
        label.textAlignment = .left
        return label
    }()

    override func creatSubCellUI() {
        self.contentView.addSubview(self.titleLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(ls_leftMargin)
            make.top.bottom.equalToSuperview()
            make.right.equalToSuperview().offset(-ls_rightMargin)
        }
    }
    
}
