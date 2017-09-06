//
//  LSBaseViewController.swift
//  LaoSan
//
//  Created by liuyunxin on 2017/9/1.
//  Copyright © 2017年 liuyunxin. All rights reserved.
//

import UIKit

class LSBaseViewController: UIViewController {
    
    
    //MARK:viewController life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //打印
        print("init: ",self)
        
        //设置基本背景色
        self.view.backgroundColor = .white
        
    }
    
    deinit {
        print("dealloc: ",self)
    }
    
}
//MARK:几个设置left - right item的public方法
extension LSBaseViewController {
    
    public func setRightItemWithTitle(title: String) -> Void {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: title, style: .plain, target: self, action: #selector(LSBaseViewController.didClickRightBarButtonItem))
    }
    
    public func setRightItemWithImage(imageName: String) -> Void {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: UIImage(named: imageName), style: .plain, target: self, action: #selector(LSBaseViewController.didClickRightBarButtonItem))
    }
    
    public func setLeftItemWithTitle(title: String) -> Void {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: title, style: .plain, target: self, action: #selector(LSBaseViewController.didClickLeftBarButtonItem))
    }
    
    public func setLeftItemWithImage(imageName: String) -> Void {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage(named: imageName), style: .plain, target: self, action: #selector(LSBaseViewController.didClickLeftBarButtonItem))
    }
    
    
    /// 点击右侧导航button
    public func didClickRightBarButtonItem() -> Void {
        
    }
    
    /// 点击左侧导航button
    public func didClickLeftBarButtonItem() -> Void {
        
    }
}

//MARK:跳转
extension LSBaseViewController {

    public func popToRootViewControllerAndDismissTopViewController() -> Void {
        let topVC = navigationController?.viewControllers.first
        navigationController?.popToViewController(topVC!, animated: false)
        if (topVC != nil) {
            topVC?.dismiss(animated: false, completion: nil)
        }
    }
    
    public func popOrDissmissCurrentViewControllerAnimate(isAnimate: Bool) -> Void {
        let viewControllers = navigationController?.viewControllers
        if (viewControllers?.count)! > 1 {
            if viewControllers?.ls_objectWithIndex(index: (viewControllers?.count)! - 1) as? UIViewController  == self {
                navigationController?.popViewController(animated: isAnimate)
            }
        }else{
            navigationController?.dismiss(animated: isAnimate, completion: nil)
        }
    }
}

//MARK:顶部弹出错误提示
extension LSBaseViewController {

    public func showErrorFromTop(errorDes: String) -> Void {
        let label = UILabel(text: errorDes, fontSize: 16, textColor: .white)
        label.backgroundColor = .red
        label.textAlignment = .center
        label.frame = CGRect.init(x: 0, y: -64, width: SCREEN_WIDTH, height: 64)
        UIApplication.shared.keyWindow?.addSubview(label)
        UIApplication.shared.keyWindow?.bringSubview(toFront: label)
        UIView.animate(withDuration: 0.25, animations: { 
            label.ls_y = 0
        }) { (isFinish) in
            if isFinish {
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3 , execute: {
                    UIView.animate(withDuration: 0.25, animations: {
                        label.ls_y = -64
                    }, completion: { (isFinish) in
                        if isFinish {
                            label.removeFromSuperview()
                        }
                    })
                })
            }
        }
        
    }
}



