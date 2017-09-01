//
//  LSImageCollectionViewCell.swift
//  LaoSan
//
//  Created by liuyunxin on 2017/9/1.
//  Copyright © 2017年 liuyunxin. All rights reserved.
//

import UIKit
import Photos

let LSImageItemWidth = UIScreen.main.bounds.width / 3.0 * 2
class LSImageCollectionViewCell: UICollectionViewCell {
    
    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var selectImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .clear
        view.image = UIImage(named: "ch_selectbg_photo")
        view.isHidden = true
        return view
    }()
    
    lazy var indexLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    
    var asset: PHAsset? {
        didSet{
            if asset?.isSelected ?? false {
                self.selectImageView.isHidden = false
                self.indexLabel.isHidden = false
            }else{
                self.selectImageView.isHidden = true
                self.indexLabel.isHidden = true
            }
            if asset?.thumbImage == nil {
                let imageManager = PHImageManager.default()
                imageManager.requestImage(for: asset!, targetSize: CGSize(width: LSImageItemWidth, height: LSImageItemWidth), contentMode: .aspectFill, options: nil, resultHandler: { (result, info) in
                    DispatchQueue.global().async {
                        let image = result?.imageCompressForTargetSize(size: CGSize(width: LSImageItemWidth, height: LSImageItemWidth))
                        DispatchQueue.main.async {
                            self.imageView.image = image
                        }
                    }
                })
            }else {
                self.imageView.image = asset?.thumbImage
            }
            
            for imageModel in self.selectArray {
                if imageModel.identifier == asset?.localIdentifier {
                    self.indexLabel.text = String(format: "%d", imageModel.index ?? 0)
                    break
                }
            }
        }
    }
    var selectArray: [LSImageModel] = [];
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(self.imageView)
        self.contentView.addSubview(self.indexLabel)
        self.contentView.addSubview(self.selectImageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        self.imageView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets.zero)
        }
        self.selectImageView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets.zero)
        }
        self.indexLabel.snp.makeConstraints { (make) in
            make.right.top.equalTo(self.contentView)
            make.size.equalTo(CGSize(width: 25, height: 25))
        }
        
    }
    
    
    func updateImageIsSelected(isSelected: Bool, complete: @escaping ((Bool) -> Void)) -> Void {
        
        let timeInterval = 0.1
        UIView.animate(withDuration: timeInterval, animations: {
            self.imageView.transform = CGAffineTransform(scaleX: 1.03, y: 1.03);
        }) { (isFinish) in
            if isFinish {
                UIView.animate(withDuration: timeInterval, animations: {
                    self.imageView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                }, completion: complete)
            }
        }
    }

}
