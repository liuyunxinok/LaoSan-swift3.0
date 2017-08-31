//
//  LSTopBottomTitleCell.swift
//  LaoSan
//
//  Created by liuyunxin on 2017/8/31.
//  Copyright © 2017年 liuyunxin. All rights reserved.
//

import UIKit

//上下title格式的cell
class LSTopBottomTitleCell: LSBaseTableCell {

    lazy var topLabel: UILabel = {
        let lable = UILabel(text: nil, fontSize: ls_cellTitleFontSize, textColor: ls_cellTitleColor)
        lable.textAlignment = .left
        return lable
    }()
    
    lazy var bottomLbale: UILabel = {
        let label = UILabel(text: nil, fontSize: ls_cellSubTitleFontSize, textColor: ls_cellSubTitleColor)
        return label
    }()
    
    override func creatSubCellUI() {
        self.contentView.addSubview(self.topLabel)
        self.contentView.addSubview(self.bottomLbale)
    }
    
    override func loadTableData(data: LSTabelViewData) {
        self.topLabel.text = data.titleString
        self.bottomLbale.text = data.bottomTitleString
    }    

    override func layoutSubviews() {
        super.layoutSubviews()
        self.topLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(ls_leftMargin)
            make.right.equalToSuperview().offset(-ls_rightMargin)
            make.top.equalToSuperview()
            make.height.equalTo(self.contentView.ls_height / 3 * 2)
        }
        self.bottomLbale.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.topLabel)
            make.top.equalTo(self.topLabel.snp.bottom)
            make.bottom.equalToSuperview()
        }
    }
    
}
