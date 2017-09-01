//
//  LSFilePreviewViewController.swift
//  LaoSan
//
//  Created by liuyunxin on 2017/9/1.
//  Copyright © 2017年 liuyunxin. All rights reserved.
//

import UIKit
import QuickLook

class LSFilePreviewViewController: UIViewController {

    var filePath: String = ""
    
    lazy var filePreviewVC: QLPreviewController = {
        let previewVC = QLPreviewController()
        previewVC.dataSource = self
        previewVC.delegate = self
        previewVC.hidesBottomBarWhenPushed = true
        previewVC.view.frame = CGRect(x: 0, y: 64, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - 64)
        previewVC.view.backgroundColor = .white
        return previewVC
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = LSFileManager.getFileNameByPath(filePath: self.filePath)
        self.addChildViewController(self.filePreviewVC)
        self.view.addSubview(self.filePreviewVC.view)
    }

}

extension LSFilePreviewViewController: QLPreviewControllerDataSource,QLPreviewControllerDelegate {
    
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return 1
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        
        return URL(fileURLWithPath: self.filePath) as QLPreviewItem
    }
    
}
