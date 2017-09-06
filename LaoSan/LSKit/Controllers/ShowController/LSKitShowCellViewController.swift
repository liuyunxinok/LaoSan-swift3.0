//
//  LSKitShowCellViewController.swift
//  LaoSan
//
//  Created by liuyunxin on 2017/9/4.
//  Copyright © 2017年 liuyunxin. All rights reserved.
//

import UIKit

class LSKitShowCellViewController: LSBaseViewController {
    
    lazy var tableView: UITableView = {
        let view = UITableView.init(frame: self.view.bounds, style: .plain)
        view.dataSource = self
        view.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.tableView)
    }

}

extension LSKitShowCellViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}
