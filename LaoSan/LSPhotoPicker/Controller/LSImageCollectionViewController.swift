//
//  LSImageCollectionViewController.swift
//  LaoSan
//
//  Created by liuyunxin on 2017/9/1.
//  Copyright © 2017年 liuyunxin. All rights reserved.
//

import UIKit
import Photos

private let reuseIdentifier = "TCZImageCollectionViewCell"
class LSImageCollectionViewController: UICollectionViewController {
    
    var assetResult: PHFetchResult<PHAsset>? {
        didSet{
            self.collectionView?.reloadData()
        }
    }
    
    /// 点击ok的回调
    var okClickComplete: (([LSImageModel]) -> Void)?
    
    /// 图片的可选数量,default = 9
    var maxSelectedNum: Int = 9
    var rightItemTitle: String?
    
    /// 选中的数组
    var selectArray: [LSImageModel] = []
    
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
        self.collectionView?.register(LSImageCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView?.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "相机胶卷"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: self.rightItemTitle, style: .done, target: self, action: #selector(rightBarButtonItemDidClick))
        self.changeRightItemState()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.removeNotification()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if PHPhotoLibrary.authorizationStatus() == .notDetermined {
            self.registerNotification()
        }
    }
    
    /// 点击rightItemTitle
    func rightBarButtonItemDidClick() -> Void {
        
        if self.okClickComplete != nil {
            self.okClickComplete!(self.selectArray)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    
    /// 更改rightItemTitle
    func changeRightItemState() -> Void {
        let imageCount = self.selectArray.count
        if imageCount > 0 {
            self.navigationItem.rightBarButtonItem?.title = String(format: "发送(%d)", imageCount)
            self.navigationItem.rightBarButtonItem?.isEnabled = true
        }else{
            self.navigationItem.rightBarButtonItem?.title = self.rightItemTitle
            self.navigationItem.rightBarButtonItem?.isEnabled = false
        }
    }
    
    
    /// 注册通知
    func registerNotification() -> Void {
        NotificationCenter.default.addObserver(self, selector: #selector(appDidBecomeActive), name: NSNotification.Name.UIApplicationDidBecomeActive, object: nil)
    }
    
    
    /// 移除通知
    func removeNotification() -> Void {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIApplicationDidBecomeActive, object: nil)
    }
    
    
    /// app恢复active
    func appDidBecomeActive() -> Void {
        
        if PHPhotoLibrary.authorizationStatus() == .authorized {
            navigationController?.popViewController(animated: false)
        }else if PHPhotoLibrary.authorizationStatus() == .denied {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.assetResult?.count ?? 0 + 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: LSImageCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! LSImageCollectionViewCell
        if indexPath.item == 0 {
            cell.imageView.image = UIImage(named: "ch_camera_photo")
            cell.selectImageView.isHidden = true
            cell.indexLabel.isHidden = true
        }else{
            let asset = self.assetResult?[indexPath.item - 1]
            cell.selectArray = self.selectArray
            cell.asset = asset!
        }
        return cell
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let itemWidth = (UIScreen.main.bounds.width - 2 * 2) / 3
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    
    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == 0 {
            if self.selectArray.count >= self.maxSelectedNum {
                let alert = UIAlertController(title: nil, message: String(format: "最多只能选择%d张图片", self.maxSelectedNum), preferredStyle: .alert)
                let actionButton = UIAlertAction(title: "确定", style: .destructive, handler: { (UIAlertAction) in
                    alert.dismiss(animated: true, completion: nil)
                })
                alert.addAction(actionButton)
                self.present(alert, animated: true, completion: nil)
                return
            }
            let imagePickerVC = UIImagePickerController()
            imagePickerVC.delegate = self
            imagePickerVC.allowsEditing = false
            imagePickerVC.sourceType = .camera
            self.present(imagePickerVC, animated: true, completion: nil)
        }else{
            let cell: LSImageCollectionViewCell = collectionView.cellForItem(at: indexPath) as! LSImageCollectionViewCell
            if (cell.asset?.isSelected)! {
                for (index, value) in self.selectArray.enumerated() {
                    if value.identifier == cell.asset?.localIdentifier {
                        self.selectArray.remove(at: index)
                    }
                }
            }else {
                
                if self.selectArray.count >= self.maxSelectedNum {
                    let alert =  UIAlertController(title: nil, message: String(format: "最多只能选择%d张图片", self.maxSelectedNum), preferredStyle: .alert)
                    let actionButton = UIAlertAction(title: "确定", style: .destructive, handler: { (UIAlertAction) in
                        alert.dismiss(animated: true, completion: nil)
                    })
                    alert.addAction(actionButton)
                    self.present(alert, animated: true, completion: nil)
                    return
                }
                
                let imageModel = LSImageModel()
                imageModel.identifier = cell.asset?.localIdentifier
                imageModel.asset = cell.asset
                self.selectArray.append(imageModel)
                
            }
            for (index, value) in self.selectArray.enumerated() {
                value.index = index
            }
            self.changeCurrentSelectedItemIndex(cell: cell)
        }
    }
    
    func changeCurrentSelectedItemIndex(cell: LSImageCollectionViewCell) -> Void {
        self.collectionView?.isUserInteractionEnabled = false
        cell.selectImageView.isHidden = !cell.selectImageView.isHidden
        cell.indexLabel.isHidden = !cell.indexLabel.isHidden
        cell.asset?.isSelected = !(cell.asset?.isSelected)!
        cell.indexLabel.text = String(format: "%d", self.selectArray.count)
        self.changeRightItemState()
        cell.updateImageIsSelected(isSelected: !cell.selectImageView.isHidden) { (isFinish) in
            self.collectionView?.isUserInteractionEnabled = true
            self.collectionView?.reloadData()
        }
    }
}

extension LSImageCollectionViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
}
