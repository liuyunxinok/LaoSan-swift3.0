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
//        view.register(LSBaseTableCell.classForCoder(), forCellReuseIdentifier: NSStringFromClass(LSBaseTableCell.classForCoder()))
        view.separatorStyle = .none
        return view
    }()
    
    let sectionTitles = ["left&Right-title","left - title","left-image&title","textField","left-title right-switch","top&bottom-title","top-title bottom-switch"]
    
    var dataSource: [LSTabelViewData] {
        get{
            var tmpArray:[LSTabelViewData] = []
            for index in  0...self.sectionTitles.count {
                switch index {
                case 0:
                    var data: LSTabelViewData = LSTabelViewData(type: .leftRightTitle)
                    data.titleString = "leftTitle"
                    data.rightTitleString = "rightTitle"
                    tmpArray.append(data)
                    break
                case 1:
                    var data: LSTabelViewData = LSTabelViewData(type: .title)
                    data.titleString = "leftTitle"
                    tmpArray.append(data)
                    break
                case 2:
                    var data: LSTabelViewData = LSTabelViewData(type: .imageTitle)
                    data.titleString = "leftTitle"
                    data.imageName = ""
                    tmpArray.append(data)
                    break
                case 3:
                    let data: LSTabelViewData = LSTabelViewData(type: .textfield)
                    tmpArray.append(data)
                    break
                case 4:
                    var data: LSTabelViewData = LSTabelViewData(type: .leftTitleRightSwitch)
                    data.titleString = "leftTitle"
                    tmpArray.append(data)
                    break
                case 5:
                    var data: LSTabelViewData = LSTabelViewData(type: .topBottomTitle)
                    data.titleString = "leftTitle"
                    data.bottomTitleString = "bottomTitle"
                    tmpArray.append(data)
                    break
                case 6:
                    var data: LSTabelViewData = LSTabelViewData(type: .topTitleBottomTextField)
                    data.titleString = "leftTitle"
                    tmpArray.append(data)
                    break
                default:
                    break
                }
            }
            return tmpArray
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.tableView)
    }
    
}

extension LSKitShowCellViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sectionTitles.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: LSBaseTableCell
        switch indexPath.section {
        case 0:
            cell = LSLeftTitleRightTitleCell()
            break
        case 1:
            cell = LSLeftTitleCell()
            break
        case 2:
            cell = LSleftImageTitleCell()
            break
        case 3:
            cell = LSTextFiledCell()
            break
        case 4:
            cell = LSLeftTitleRightSwitchCell()
            break
        case 5:
            cell = LSTopBottomTitleCell()
            break
        case 6:
            cell = LSTopTitleBottomTextFiledCell()
            break
        default:
           cell = LSBaseTableCell()
        }
        cell.loadTableData(data: self.dataSource[indexPath.section])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sectionTitles[section]
    }
    
    
}
