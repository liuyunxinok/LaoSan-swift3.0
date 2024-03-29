//
//  LSKitViewController.swift
//  LaoSan
//
//  Created by liuyunxin on 2017/9/4.
//  Copyright © 2017年 liuyunxin. All rights reserved.
//

import UIKit

class LSKitViewController: UIViewController {
    
    lazy var listCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 300, height: 60)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        let collectionView = UICollectionView.init(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.register(LSMenuCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: NSStringFromClass(LSMenuCollectionViewCell.classForCoder()))
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    
    let menuTitles = ["基本cell","LSLoadingButton","LSStackView","待补模块","待补模块"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.listCollectionView)
        self.title = "LSKit"
    }
    
}

extension LSKitViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.menuTitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: LSMenuCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(LSMenuCollectionViewCell.classForCoder()), for: indexPath) as! LSMenuCollectionViewCell
        cell.titleLabel.text = self.menuTitles[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch indexPath.item {
        case 0:
            //基本cell展示
            let lsKitShowCellVC = LSKitShowCellViewController()
            lsKitShowCellVC.title = self.menuTitles[indexPath.item]
            navigationController?.pushViewController(lsKitShowCellVC, animated: true)
            break
        case 1:
            //loadingButton展示
            let lsShowLoadingButtonVC = LSShowLoadingButtonViewController()
            lsShowLoadingButtonVC.title = self.menuTitles[indexPath.item]
            navigationController?.pushViewController(lsShowLoadingButtonVC, animated: true)
            break
        case 2:
            //stackView展示
            let lsShowStackViewVC = LSShowStackViewController()
            lsShowStackViewVC.title = self.menuTitles[indexPath.item]
            navigationController?.pushViewController(lsShowStackViewVC, animated: true)
            break
        case 3:
            break
        case 4:
            break
        default:
            break
        }
    }
    
}






