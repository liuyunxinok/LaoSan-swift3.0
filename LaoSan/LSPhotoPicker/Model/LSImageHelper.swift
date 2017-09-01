//
//  LSImageHelper.swift
//  LaoSan
//
//  Created by liuyunxin on 2017/9/1.
//  Copyright © 2017年 liuyunxin. All rights reserved.
//

import Foundation
import Photos

class LSImageModel {
    var identifier: String? //图片标识
    var index: Int? //选中的索引
    var thumbImage: UIImage? //图片
    var asset: PHAsset?
}

class LSImageHelper {

    /// 获取相册
    ///
    /// - Parameter complete:返回结果
    class func getAlbumList(complete: (([PHFetchResult<PHObject>]) -> Void)?) -> Void {
        let allPhotosOptions = PHFetchOptions()
        let sortDescriptor1 = NSSortDescriptor(key: "creationDate", ascending: false)
        allPhotosOptions.sortDescriptors = [sortDescriptor1]
        //所有图片的集合
        let allPhotos = PHAsset.fetchAssets(with: .image, options: allPhotosOptions)
        //自定义
        let option = PHFetchOptions()
        option.predicate = NSPredicate(format: "estimatedAssetCount > 0")
        let sortDescriptor2 = NSSortDescriptor(key: "startDate", ascending: true)
        option.sortDescriptors = [sortDescriptor2]
        let result = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .albumRegular, options: option)
        let  list = [allPhotos,result]
        guard complete == nil else {
            complete!(list as! [PHFetchResult<PHObject>])
            return
        }
    }
    
    
    /// 获取图片
    ///
    /// - Parameters:
    ///   - asset: asset
    ///   - complete: 回调
    class func getImageWithAsset(asset: PHAsset, complete: ((UIImage) -> Void)?) ->Void {
        
        let option = PHImageRequestOptions()
        option.isSynchronous = true
        PHImageManager.default().requestImageData(for: asset, options: option) { (imageData: Data?, dataUTI: String?, orientation: UIImageOrientation, info: [AnyHashable:Any]?) in
            if let aImageData = imageData {
                let image = UIImage(data: aImageData)
                if complete != nil {
                    complete!(image!)
                }
            }
            
        }
        
    }
    
    /// 检测是否打开访问相册权限
    ///
    /// - Returns: 结果
    class func isOpenAuthority() -> Bool {
        
        return PHPhotoLibrary.authorizationStatus() != .denied
    }
    
    
    /// 跳转系统设置
    class func jumpToSetting() -> Void {
        if UIApplication.shared.canOpenURL(URL(string: UIApplicationOpenSettingsURLString)!) {
            UIApplication.shared.open(URL(string: UIApplicationOpenSettingsURLString)!, options: [ : ], completionHandler: nil)
        }
    }

}
