//
//  LSAlbumListCell.swift
//  LaoSan
//
//  Created by liuyunxin on 2017/9/1.
//  Copyright © 2017年 liuyunxin. All rights reserved.
//

import UIKit

class LSAlbumListCell: UITableViewCell {
    
    lazy var coverImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var albumNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    lazy var albumDetailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(self.coverImageView)
        self.contentView.addSubview(self.albumNameLabel)
        self.coverImageView.addSubview(self.albumDetailLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        self.coverImageView.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 60, height: 60))
            make.left.equalToSuperview().offset(13)
            make.centerY.equalToSuperview()
        }
        
        self.albumNameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.coverImageView.snp.right).offset(13)
            make.right.equalToSuperview().offset(-13)
            make.top.equalTo(self.coverImageView)
        }
        self.albumDetailLabel.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.albumNameLabel)
            make.bottom.equalTo(self.coverImageView)
        }
        
    }
    
    
}
