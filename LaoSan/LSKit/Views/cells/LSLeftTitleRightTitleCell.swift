//
//  LSLeftTitleRightTitleCell.swift
//  LaoSan
//
//  Created by liuyunxin on 2017/8/31.
//  Copyright © 2017年 liuyunxin. All rights reserved.
//

import UIKit

//左右都有title的cell
class LSLeftTitleRightTitleCell: LSBaseTableCell {
    
    lazy var leftLabel: UILabel = {
        let label = UILabel(text: nil, fontSize: ls_cellTitleFontSize, textColor: ls_cellTitleColor)
        label.textAlignment = .left
        return label
    }()
    
    lazy var rightLabel: UILabel = {
        let label = UILabel(text: nil, fontSize: ls_cellSubTitleFontSize, textColor: ls_cellSubTitleColor)
        label.textAlignment = .right
        return label
    }()
    
    
    /// 搭建UI
    override func creatSubCellUI() {
        self.contentView.addSubview(self.leftLabel)
        self.contentView.addSubview(self.rightLabel)
    }
    
    /// 加载数据
    ///
    /// - Parameter data: data
    override func loadTableData(data: LSTabelViewData) {
        self.leftLabel.text = data.titleString
        self.rightLabel.text = data.rightTitleString
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.leftLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(ls_leftMargin)
            make.width.equalTo(self.contentView.ls_width / 2 - ls_leftMargin)
        }
        self.rightLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.right.equalToSuperview().offset(-ls_rightMargin)
            make.width.equalTo(self.leftLabel)
        }
    }
}
