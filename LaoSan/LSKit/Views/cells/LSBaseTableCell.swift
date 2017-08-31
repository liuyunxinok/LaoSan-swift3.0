//
//  LSBaseTableCell.swift
//  LaoSan
//
//  Created by liuyunxin on 2017/8/31.
//  Copyright © 2017年 liuyunxin. All rights reserved.
//

import UIKit

//baseCell
class LSBaseTableCell: UITableViewCell {

    
    /// 分割线
    lazy var separatorLine: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.creatBaseUI()
        self.creatSubCellUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    /// 创建基类控件
    private func creatBaseUI() -> Void {
        self.contentView.addSubview(self.separatorLine)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.separatorLine.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
    }
    
    
    /// 加载数据 需子类重写
    ///
    /// - Parameter data: 数据
    public func loadTableData(data: LSTabelViewData) -> Void {}
    
    /// 创建子类视图 需子类重写
    public func creatSubCellUI() -> Void {}
    
    
}
