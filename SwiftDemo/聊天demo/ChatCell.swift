//
//  File.swift
//  SwiftDemo
//
//  Created by 刘亚和 on 2021/1/24.
//  Copyright © 2021 yahe Liu. All rights reserved.
//

import Foundation
class ChatCell: UITableViewCell {
    var customView : UIView!
    var bubbleImage : UIImageView!
    var avatar : UIImageView!
    var msgItem : MessageItem!
    
    init(data:MessageItem, reuseIdentifier cellId:String) {
        self.msgItem = data
        super.init(style: .default, reuseIdentifier: cellId)
        rebuildUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func rebuildUI() {
        self.selectionStyle = .none
        if self.bubbleImage == nil {
            self.bubbleImage = UIImageView()
            self.addSubview(self.bubbleImage)
        }
        
        var type = self.msgItem.mtype
        var width = self.msgItem.view.frame.size.width
        var height = self.msgItem.view.frame.size.height
        
        var x = (type == ChatType.SomeOne) ? 0 :kScreenWidth - width - self.msgItem.inset.left - self.msgItem.inset.right
        
        var y:CGFloat = 0
        if self.msgItem.logo != "" {
            var logo = self.msgItem.logo
            
            self.avatar = UIImageView(image: UIImage(named: logo))
            
            self.avatar.layer.cornerRadius = 9.0
            self.avatar.layer.masksToBounds = true
            self.avatar.layer.borderColor = UIColor(white: 0.0, alpha: 0.2).cgColor
            
            self.avatar.layer.borderWidth = 1.0
            
            //别人头像在左边，我的头像在右边
            var avatarX = (type == ChatType.SomeOne) ? 2 : kScreenWidth - 52
            
            //头像居于消息底部
            var avatarY = self.msgItem.inset.top
            
            self.avatar.frame = CGRect(x: avatarX, y: avatarY, width: 50, height: 50)
            self.addSubview(self.avatar)
            
            var delta = self.frame.size.height - (self.msgItem.inset.top + self.msgItem.inset.bottom + height)
            
            if delta > 0 {
                y = delta
            }
            
            if type == ChatType.SomeOne {
                x += 54
            }
            
            if type == ChatType.Mine    {
                x -= 54
            }
            self.customView = self.msgItem.view
            self.customView.frame = CGRect(x: x + self.msgItem.inset.left, y: y + self.msgItem.inset.top, width: width, height: height)
            self.addSubview(self.customView)
            
            self.bubbleImage.frame = CGRect(x: x, y: y, width: width + self.msgItem.inset.left + self.msgItem.inset.right, height:  height + self.msgItem.inset.top + self.msgItem.inset.bottom)
            //别人的消息在左边，自己的消息在右边
            if type == ChatType.SomeOne {
                //首先定义一张图片
                var frameImg1 = UIImage(named: "气泡左")!
                let top:CGFloat = frameImg1.size.height/2+30 // 顶端盖高度
                let bottom:CGFloat = 30 ; // 底端盖高度
                let left:CGFloat = 100; // 左端盖宽度
                let right:CGFloat = 30; // 右端盖宽度s
                let insets:UIEdgeInsets  = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
                
                frameImg1 = frameImg1.resizableImage(withCapInsets: insets, resizingMode: .stretch)
                
                self.bubbleImage.image = frameImg1
            }else{
                //首先定义一张图片
                var frameImg1 = UIImage(named: "气泡右")!
                let top:CGFloat = frameImg1.size.height/2+20 // 顶端盖高度
                let bottom:CGFloat = 10 ; // 底端盖高度
                let left:CGFloat = 10; // 左端盖宽度
                let right:CGFloat = 50; // 右端盖宽度s
                let insets:UIEdgeInsets  = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
                
                frameImg1 = frameImg1.resizableImage(withCapInsets: insets, resizingMode: .stretch)
                self.bubbleImage.image = frameImg1
            }
            
        }
        
        
    }
    
    
}
