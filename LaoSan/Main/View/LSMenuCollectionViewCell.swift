//
//  LSMenuCollectionViewCell.swift
//  LaoSan
//
//  Created by liuyunxin on 2017/8/31.
//  Copyright © 2017年 liuyunxin. All rights reserved.
//

import UIKit

class LSMenuCollectionViewCell: UICollectionViewCell {
   
    lazy var titleLabel: UILabel = {
        let label = UILabel(text: nil, fontSize: 18, textColor: .red)
        label.textAlignment = .center
        label.layer.borderColor = UIColor.blue.cgColor
        label.layer.borderWidth = 3
        label.backgroundColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(self.titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.titleLabel.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(3, 3, 3, 3))
        }
    }
        
}
