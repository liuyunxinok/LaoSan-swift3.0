//
//  LSAlbumListViewController.swift
//  LaoSan
//
//  Created by liuyunxin on 2017/9/1.
//  Copyright © 2017年 liuyunxin. All rights reserved.
//

import UIKit
import Photos

class LSAlbumListViewController: UITableViewController {
    
    var okClickComplete: (([LSImageModel]) -> Void)?
    var rightTitle: String?
    var maxSelectCount: Int = 9
    var dataSource: [PHFetchResult<PHObject>] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 80
        self.title = "相册"
        self.tableView.register(LSAlbumListCell.classForCoder(), forCellReuseIdentifier: NSStringFromClass(LSAlbumListCell.classForCoder()))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "取消", style: .plain, target: self, action: #selector(LSAlbumListViewController.cancleButtonDidClick))
        self.tableView.tableFooterView = UIView()
        self.loadAlbum()
        if self.dataSource.count > 0 {
            let result = self.dataSource[0]
            if result.count > 0 {
                self.jumpToImageDetailWithGroup(fetchResult: result, isAnimate: false)
            }
        }
        
    }
    
    func cancleButtonDidClick() -> Void {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    /// 获取相册列表
    func loadAlbum() -> Void {
        
        if !LSImageHelper.isOpenAuthority() {
            let alertVC = UIAlertController(title: "温馨提示", message: "您没有开启相册权限", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: { (UIAlertAction) in
                self.dismiss(animated: true, completion: nil)
            })
            let doneAction = UIAlertAction(title: "去开启", style: .default, handler: { (UIAlertAction) in
                LSImageHelper.jumpToSetting()
            })
            alertVC.addAction(cancelAction)
            alertVC.addAction(doneAction)
            alertVC.show(self, sender: nil)
            
        }
        
        LSImageHelper.getAlbumList { (albumList: [PHFetchResult<PHObject>]) in
            self.dataSource = albumList
        }
        
    }
}

//MARK:UITbableViewDataSource UITableViewDelegate
extension LSAlbumListViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        }else {
            let fetchResult = self.dataSource[section]
            if fetchResult.count > 0 {
                return fetchResult.count
            }
        }
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: LSAlbumListCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(LSAlbumListCell.classForCoder()), for: indexPath) as! LSAlbumListCell
        cell.accessoryType = .none
        var fetchResult = self.dataSource[indexPath.section]
        if indexPath.section == 0 {
            cell.albumNameLabel.text = "相机胶卷"
            cell.albumDetailLabel.text = String(format: "%d", fetchResult.count)
        }else {
            let collection: PHAssetCollection = fetchResult[indexPath.row] as! PHAssetCollection
            cell.albumNameLabel.text = collection.localizedTitle
            if collection.isKind(of: PHAssetCollection.classForCoder()) {
                let assetFetchResult = PHAsset.fetchAssets(in: collection , options: nil)
                cell.albumDetailLabel.text = String(format: "%d", assetFetchResult.count)
                fetchResult = assetFetchResult as! PHFetchResult<PHObject>
            }
            
        }
        if fetchResult.count > 0 {
            let asset = fetchResult[0]
            PHImageManager.default().requestImage(for: asset as! PHAsset , targetSize: CGSize(width: 120, height: 120), contentMode: .aspectFill, options: nil, resultHandler: { (result, info) in
                DispatchQueue.global().async {
                    let image = result?.imageCompressForTargetSize(size: CGSize(width: 120, height: 120))
                    DispatchQueue.main.async {
                        cell.coverImageView.image = image
                    }
                }
            })
            
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var result: PHFetchResult<AnyObject>?
        if indexPath.section == 0 {
            result = self.dataSource[0] as? PHFetchResult<AnyObject>
        }else{
            let fetchResult = self.dataSource[indexPath.section]
            let collection = fetchResult[indexPath.row]
            guard collection.isKind(of: PHAssetCollection.classForCoder()) else {
                return
            }
            result = PHAsset.fetchAssets(in: (collection as? PHAssetCollection)!, options: nil) as? PHFetchResult<AnyObject>
        }
        
        self.jumpToImageDetailWithGroup(fetchResult: result as! PHFetchResult<PHObject>, isAnimate: true)
    }
    
}



//MARK:helper
extension LSAlbumListViewController {
    
    func jumpToImageDetailWithGroup(fetchResult: PHFetchResult<PHObject>, isAnimate: Bool) -> Void {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 2 * 2) / 3, height: (UIScreen.main.bounds.width - 2 * 2) / 3)
        layout.minimumLineSpacing = 2;
        layout.minimumInteritemSpacing = 2;
        let imageCollectionVC = LSImageCollectionViewController(collectionViewLayout: layout)
        imageCollectionVC.assetResult = fetchResult as? PHFetchResult<PHAsset>
        imageCollectionVC.rightItemTitle = self.rightTitle ?? "发送"
        imageCollectionVC.okClickComplete = self.okClickComplete
        imageCollectionVC.maxSelectedNum = self.maxSelectCount
        navigationController?.pushViewController(imageCollectionVC, animated: isAnimate)
    }
    
}
