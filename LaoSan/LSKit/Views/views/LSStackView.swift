//
//  LSStackView.swift
//  LaoSan
//
//  Created by liuyunxin on 2017/9/6.
//  Copyright © 2017年 liuyunxin. All rights reserved.
//

import UIKit

/// stackView的类型
///
/// - normalTitle: 只有标题
/// - leftImageRightTitle: 左图右标题
/// - topImageBottomTitle: 上图下标题
/// - leftTitleRightImage: 左标提右图
/// - topTitleBottomImage: 上标题下图
public enum LSStackViewType {
    case normalTitle
    case leftImageRightTitle
    case topImageBottomTitle
    case leftTitleRightImage
    case topTitleBottomImage
}

class LSStackView: UIView {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: SCREEN_WIDTH / 3, height: 50)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let view = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        view.register(LSStackViewCollectionCell.classForCoder(), forCellWithReuseIdentifier: NSStringFromClass(LSStackViewCollectionCell.classForCoder()))
        view.bounces = false
        view.backgroundColor = .white
        view.dataSource = self
        view.delegate = self
        return view
    }()
    
    
    /// 数据源 以数组字典的格式 title对应key用 ls_stackTitleKey imageName对应key用 ls_stackImageKey
    var dataSouece: [[String:String]]? {
        didSet{
            self.collectionView.reloadData()
        }
    }
    
    var type: LSStackViewType = .normalTitle {
        didSet{
            self.collectionView.reloadData()
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.collectionView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     override func layoutSubviews() {
        super.layoutSubviews()
        self.collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension LSStackView: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataSouece?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: LSStackViewCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(LSStackViewCollectionCell.classForCoder()), for: indexPath) as! LSStackViewCollectionCell
        cell.loadData(data: self.dataSouece![indexPath.item], stackViewType: self.type)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let itemWidth = SCREEN_WIDTH / CGFloat(self.dataSouece!.count)
        return CGSize(width: itemWidth, height: ls_stackViewHeight)
    }
}

/// stackView的cell
class LSStackViewCollectionCell: UICollectionViewCell {
    
    /// stackButton
    lazy var stackButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    /// 分割线
    lazy var sepratorLine: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    
    /// 是否隐藏分割线 默认为false
    var isHidenLine: Bool = false {
        didSet{
            if isHidenLine {
                self.sepratorLine.snp.updateConstraints({ (make) in
                    make.width.equalTo(0)
                })
            }
        }
    }
    
    /// 分割线的上下缩进 默认为0
    var lineTopEdgs: CGFloat = 0 {
        didSet{
            self.sepratorLine.snp.updateConstraints { (make) in
                make.top.equalTo(self.lineTopEdgs)
                make.bottom.equalTo(-self.lineTopEdgs)
            }
        }
    }
    
    
    /// 赋值数据
    ///
    /// - Parameters:
    ///   - data: 包含title和imageName的字典
    ///   - stackViewType: stackView的type
    func loadData(data: [String:String], stackViewType: LSStackViewType) -> Void {
        self.stackButton.setTitle(data[ls_stackTitleKey], for: .normal)
        self.stackButton.setImage(UIImage(named: data[ls_stackImageKey] ?? ""), for: .normal)
        switch stackViewType {
        case .normalTitle:
            break
        case .leftImageRightTitle:
            self.stackButton.adjustImagePosition(position: .left, offset: 6)
            break
        case .leftTitleRightImage:
            self.stackButton.adjustImagePosition(position: .right, offset: 6)
            break
        case .topImageBottomTitle:
            self.stackButton.adjustImagePosition(position: .top, offset: 6)
            break
        case .topTitleBottomImage:
            self.stackButton.adjustImagePosition(position: .bottom, offset: 6)
            break
        }
    }
    
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(self.stackButton)
        self.contentView.addSubview(self.sepratorLine)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        self.sepratorLine.snp.makeConstraints { (make) in
            make.top.bottom.right.equalToSuperview()
            make.width.equalTo(0.5)
        }
        
        self.stackButton.snp.makeConstraints { (make) in
            make.left.top.bottom.equalToSuperview()
            make.right.equalTo(self.sepratorLine.snp.left)
        }
    }
    
}

