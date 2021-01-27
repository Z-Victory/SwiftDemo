//
//  ChatViewController.swift
//  SwiftDemo
//
//  Created by 刘亚和 on 2021/1/24.
//  Copyright © 2021 yahe Liu. All rights reserved.
//

import UIKit
import JXSegmentedView

class ChatViewController: UIViewController,ChatDataSource {
    
    var chats:NSArray?
    
    var chatTable:ChatTableView?
    
    let tableView = UITableView(frame: .zero, style: .grouped)
    var chatDataArray : NSArray?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupChatTable()
//        setUI()
//        var bgImgView:UIImageView = UIImageView(frame: CGRect(x: 20, y: 100, width: 300, height: 300))
//        
//        var frameImg1:UIImage = UIImage(named: "气泡左")!
//        let top:CGFloat = frameImg1.size.height/2+30 // 顶端盖高度
//        let bottom:CGFloat = 30 ; // 底端盖高度
//        let left:CGFloat = 100; // 左端盖宽度
//        let right:CGFloat = 30; // 右端盖宽度
//        let insets:UIEdgeInsets  = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
//        
//        frameImg1 = frameImg1.resizableImage(withCapInsets: insets, resizingMode: .stretch)
//        
//        bgImgView.image = frameImg1
//            
//        self.view.addSubview(bgImgView)
    }
    func setupData() {
        var me = "image3"
        
        var item1 = MessageItem.init(body: "你好，I am trying to make the navigation bar transpare", logo: me, date: NSDate(timeIntervalSinceNow: -600), mtype: ChatType.Mine)
        
        var item2 = MessageItem.init(image: UIImage(named: "image1")!, logo: me, date: NSDate(timeIntervalSinceNow: -580), mtype: ChatType.Mine)
        
        var item3 = MessageItem.init(body: "引发了一连串爆笑事件。", logo: me, date: NSDate(timeIntervalSinceNow: -60), mtype: ChatType.Mine)
        
        var item4 = MessageItem.init(body: "伊藤为人处世相对正经，有时候甚至会慢半拍，也因此常常被三桥利用且被蒙在鼓里，而在打架方面，他战斗力超群，有着不服输的信念。两个人一起挑战校内校外的不良少年，引发了一连串爆笑事件。", logo: me, date: NSDate(timeIntervalSinceNow: -20), mtype: ChatType.SomeOne)
        
        var item5 = MessageItem.init(body: "为了能在同学中获得存在感，他还特地去发廊弄了一头金色卷发。而和他转到同一所学校的伊藤也有同样的想法。", logo: me, date: NSDate(timeIntervalSinceNow: -20), mtype: ChatType.Mine)
        
        var item6 = MessageItem.init(body: "伊藤为人处世相对正经，有时候甚至会慢半拍，也因此常常被三桥利用且被蒙在鼓里，而在打架方面，他战斗力超群，有着不服输的信念。两个人一起挑战校内校外的不良少年，引发了一连串爆笑事件。", logo: me, date: NSDate(timeIntervalSinceNow: -20), mtype: ChatType.SomeOne)
        chatDataArray = [item1,item2,item3,item4,item5,item6]
        print(chatDataArray)
    }
    
    
    func setupChatTable() {
        self.chatTable = ChatTableView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight-Height_Tabbar - 57 - CGFloat(Height_StatusBar)))
        self.chatTable!.register(ChatCell.self, forCellReuseIdentifier: "cellId")
        
        var me = "image3"
        
        self.chatTable!.chatDataSource = self
        
        self.tableView.reloadData()
        
        self.view.addSubview(self.chatTable!)
    }
    
    func rowForChatTable(tableView: UITableView) -> Int {
        return chatDataArray?.count ?? 0
    }
    
    func chatTableView(tableView: UITableView, dataForRow row: Int) -> MessageItem {
        return chatDataArray?[row] as! MessageItem
    }
    
    
    
    
    /*
    func setUI() -> Void {
        tableView.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight-Height_Tabbar - 57 - CGFloat(Height_StatusBar))
        
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatDataArray!.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let data:MessageItem = chatDataArray![indexPath.row] as! MessageItem
        return max(data.inset.top + data.view.frame.size.height + data.inset.bottom, 52)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(kScreenWidth)
        let data:MessageItem = chatDataArray![indexPath.row] as! MessageItem
        var cellId = "ChatCell"
        
//        var videoCell : ChatCell! = tableView.dequeueReusableCell(withIdentifier:cellId)as?ChatCell
//        if videoCell == nil {
        var  videoCell = ChatCell.init(data: data, reuseIdentifier: cellId)
//        }
        return videoCell
    }
 */

}


extension ChatViewController: JXSegmentedListContainerViewListDelegate {
    func listView() -> UIView {
        return view
    }
}
