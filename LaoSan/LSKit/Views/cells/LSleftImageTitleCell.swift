//
//  LSleftImageTitleCell.swift
//  LaoSan
//
//  Created by liuyunxin on 2017/8/31.
//  Copyright © 2017年 liuyunxin. All rights reserved.
//

import UIKit

//左边有小图标 title紧跟图标显示的cell
class LSleftImageTitleCell: LSBaseTableCell {

    lazy var smallImageView: UIImageView = {
        let imageView = UIImageView(image: nil, contentMode: .scaleAspectFill)
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(text: nil, fontSize: ls_cellTitleFontSize, textColor: ls_cellTitleColor)
        return label
    }()

    override func creatSubCellUI() {
        self.contentView.addSubview(self.smallImageView)
        self.contentView.addSubview(self.titleLabel)
    }
    
    override func loadTableData(data: LSTabelViewData) {
        self.smallImageView.image = UIImage(named: data.imageName ?? "")
        self.titleLabel.text = data.titleString
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.smallImageView.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 20, height: 20))
            make.left.equalToSuperview().offset(ls_leftMargin)
            make.centerY.equalToSuperview()
        }
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.smallImageView.snp.right).offset(5)
            make.top.bottom.equalToSuperview()
            make.right.equalToSuperview().offset(-ls_rightMargin)
        }
    }
}
