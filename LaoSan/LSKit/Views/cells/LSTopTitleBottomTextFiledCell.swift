//
//  LSTopTitleBottomTextFiledCell.swift
//  LaoSan
//
//  Created by liuyunxin on 2017/8/31.
//  Copyright © 2017年 liuyunxin. All rights reserved.
//

import UIKit

//上面title,下边输入框的cell
class LSTopTitleBottomTextFiledCell: LSBaseTableCell {

    lazy var titleLabel: UILabel = {
        let label = UILabel(text: nil, fontSize: ls_cellTitleFontSize, textColor: ls_cellTitleColor)
        return label
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.clearButtonMode = .whileEditing
        return textField
    }()
    

    override func creatSubCellUI() {
        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.textField)
    }
    
    override func loadTableData(data: LSTabelViewData) {
        self.titleLabel.text = data.titleString
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.textField.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(ls_leftMargin)
            make.right.equalToSuperview().offset(-ls_rightMargin)
            make.bottom.equalToSuperview()
            make.height.equalTo(30)
        }
        
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(ls_leftMargin)
            make.top.equalToSuperview()
            make.right.equalToSuperview().offset(-ls_rightMargin)
            make.bottom.equalTo(self.textField.snp.top)
        }
    }
    
    
}
