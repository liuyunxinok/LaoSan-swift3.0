//
//  LSTextFiledCell.swift
//  LaoSan
//
//  Created by liuyunxin on 2017/8/31.
//  Copyright © 2017年 liuyunxin. All rights reserved.
//

import UIKit

//单个输入框的cell
class LSTextFiledCell: LSBaseTableCell {

    /// 输入框
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.clearButtonMode = .whileEditing
        return textField
    }()

    /// 占位文本
    var placeHoldString: String? {
        didSet{
            self.textField.placeholder = placeHoldString
        }
    }
    
    override func creatSubCellUI() {
        self.contentView.addSubview(self.textField)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.textField.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(ls_leftMargin)
            make.height.equalTo(30)
            make.right.equalToSuperview().offset(-ls_rightMargin)
            make.centerY.equalToSuperview()
        }
    }
}
