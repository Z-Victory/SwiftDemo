//
//  ChatTableView.swift
//  SwiftDemo
//
//  Created by 刘亚和 on 2021/1/27.
//  Copyright © 2021 yahe Liu. All rights reserved.
//

import UIKit
protocol ChatDataSource {
    ///行数
    func rowForChatTable(tableView:UITableView) -> Int
    ///数据源
    func chatTableView(tableView:UITableView, dataForRow row:Int) -> MessageItem
}
class ChatTableView: UITableView,UITableViewDelegate,UITableViewDataSource {
    
    //用于保存所有消息
    var bubbleSection:Array<MessageItem> = []
    
    //数据源，用于与vc交换数据
    var chatDataSource:ChatDataSource?
    
    
    init(frame:CGRect) {
        //???后面加这个括号是干嘛的
        self.bubbleSection = Array<MessageItem>()
        
        super.init(frame: frame, style: .grouped)
        
        self.backgroundColor = UIColor.clear
        
        self.separatorStyle = .none
        
        self.delegate = self
        self.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    ///按日期排序方法
    func sortMessage(m1:MessageItem, m2:MessageItem) -> Bool {
        
        return m1.date!.timeIntervalSince1970  < m2.date!.timeIntervalSince1970
    }
    
    override func reloadData() {
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        
        var count = 0
        if self.chatDataSource != nil {
            count = self.chatDataSource!.rowForChatTable(tableView: self)
            if count > 0 {
                for index in 0..<count {
                    var object = self.chatDataSource!.chatTableView(tableView: self, dataForRow: index)
                    bubbleSection .append(object)
                    
                }
                bubbleSection .sort(by: sortMessage(m1:m2:))
            }
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.bubbleSection.count
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.row == 0 {
//            return 30
//        }
        var data = self.bubbleSection[indexPath.row]
        
        return max(data.inset.top + data.view.frame.size.height + data.inset.bottom, 52)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "cellid"
        
        var data = self.bubbleSection[indexPath.row]
        
        var cell = ChatCell(data: data, reuseIdentifier: cellId)
        
        return cell
        
        
    }
}
