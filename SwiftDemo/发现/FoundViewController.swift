//
//  FoundViewController.swift
//  SwiftDemo
//
//  Created by 刘亚和 on 2020/9/12.
//  Copyright © 2020 mana. All rights reserved.
//

import UIKit

class FoundViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate {
    

    lazy var tableView:UITableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight), style: .plain)
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "发现"
        tableView.dataSource = self
        tableView.delegate = self
        if #available(iOS 11, *) {
            tableView.estimatedSectionHeaderHeight = 0
            tableView.estimatedSectionFooterHeight = 0
        }
//        guard #available(iOS 12, *) else {
//            tableView.estimatedSectionHeaderHeight = 0
//            tableView.estimatedSectionFooterHeight = 0
//            return
//        }
        
        view.addSubview(tableView)
        
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellid : String = "cell"
        var cell:UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: cellid)as? UITableViewCell
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: cellid)
        }
        cell.textLabel?.text = "第\(indexPath.row)行"
        return cell
    }
}
