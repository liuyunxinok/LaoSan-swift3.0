//
//  ViewController.swift
//  LaoSan
//
//  Created by liuyunxin on 2017/8/30.
//  Copyright © 2017年 liuyunxin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var menuCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: WIDTH_SCALE(300), height: HEIGHT_SCALE(60))
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(LSMenuCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: NSStringFromClass(LSMenuCollectionViewCell.classForCoder()))
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    var dataSoucre = ["LSKit","音频播放","视频播放","文件下载","获取相册","沙盒文件","图片预览"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.menuCollectionView)
        self.title = "LS工具"
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataSoucre.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: LSMenuCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(LSMenuCollectionViewCell.classForCoder()), for: indexPath) as! LSMenuCollectionViewCell
        cell.titleLabel.text = self.dataSoucre[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.item {
        case 0:
            //LSKit
            let lsKitVC = LSKitViewController()
            navigationController?.pushViewController(lsKitVC, animated: true)
            break
        case 1:
            //音频播放
            break
        case 2:
            //视频播放
            break
        case 3:
            //文件下载
            break
        case 4:
            //获取相册
            let albumListVC = LSAlbumListViewController()
            self.present(UINavigationController(rootViewController: albumListVC), animated: true, completion: nil)
            break
        case 5:
            //沙盒文件
            let sandBoxFileVC = LSFileListViewController()
            sandBoxFileVC.title = "sandBox"
            navigationController?.pushViewController(sandBoxFileVC, animated: true)
            break
        case 6:
            //图片预览
            break
        default: break
            
        }
    }
    
}
