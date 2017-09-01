//
//  LSImageExtension.swift
//  LaoSan
//
//  Created by liuyunxin on 2017/8/31.
//  Copyright © 2017年 liuyunxin. All rights reserved.
//

import UIKit

extension UIImage {
    
    func imageCompressForTargetSize(size: CGSize) -> UIImage? {
        var newImage: UIImage?
        let imageSize = self.size
        let width = imageSize.width
        let height = imageSize.height
        let targetWidth = size.width
        let targetHeight = size.height
        var scaleFactor: CGFloat = 0.0
        var scaleWidth = targetWidth
        var scaleHeight = targetHeight
        var thumbnailPoint = CGPoint(x: 0, y: 0)
        if imageSize.equalTo(size) == false {
            let widthFactor = targetWidth / width
            let heightFactor = targetHeight / height
            if widthFactor > heightFactor {
                scaleFactor = widthFactor
            }
            else{
                scaleFactor = heightFactor
            }
            scaleWidth = width * scaleFactor
            scaleHeight = height * scaleFactor
            if(widthFactor > heightFactor){
                thumbnailPoint.y = (targetHeight - scaleHeight) * 0.5
            }else if(widthFactor < heightFactor){
                thumbnailPoint.x = (targetWidth - scaleWidth) * 0.5;
            }
        }
        UIGraphicsBeginImageContext(size);
        var thumbnailRect = CGRect.zero
        thumbnailRect.origin = thumbnailPoint;
        thumbnailRect.size.width = scaleWidth;
        thumbnailRect.size.height = scaleHeight;
        self.draw(in: thumbnailRect)
        newImage = UIGraphicsGetImageFromCurrentImageContext();
        if(newImage == nil){
            print("scale image fail")
        }
        UIGraphicsEndImageContext();
        return newImage;
    }
 
}
