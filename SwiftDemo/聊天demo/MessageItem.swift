//
//  MessageItem.swift
//  SwiftDemo
//
//  Created by 刘亚和 on 2021/1/24.
//  Copyright © 2021 yahe Liu. All rights reserved.
//

import Foundation
enum ChatType {
    case Mine
    case SomeOne
}
class MessageItem {
    
    //头像
    var logo:String = ""
    //消息时间
    var date:NSDate?
    //消息类型
    var mtype:ChatType?
    //内容视图，标签或者图片
    var view:UIView!
    //边距
    var inset:UIEdgeInsets

    //设置我的文本消息边距
    class func getTextInsetsMine() -> UIEdgeInsets{
        return UIEdgeInsets(top: 5, left: 10, bottom: 11, right: 17)
    }

    //设置他人的文本消息边距
    class func  getTextInsetsSomeone() -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 15, bottom: 11, right: 10)
    }

    //设置我的图片消息边距
    class func  getPicturesInsetsMine() -> UIEdgeInsets {
        return UIEdgeInsets(top: 11, left: 13, bottom: 16, right: 22)
    }


    //设置他人图片消息边距
    class func  getPicturesInsetsSomeone() -> UIEdgeInsets {
        return UIEdgeInsets(top: 11, left: 13, bottom: 16, right: 22)
    }
    
    //构造文本消息体
    
    /*
        convenience:便利，使用convenience修饰的构造函数叫做便利构造函数
        便利构造函数通常用在对系统的类进行构造函数的扩充时使用。
        便利构造函数的特点：
        1、便利构造函数通常都是写在extension里面
        2、便利函数init前面需要加载convenience
        3、在便利构造函数中需要明确的调用self.init()
       
        */
    convenience init(body:NSString, logo:String, date:NSDate, mtype:ChatType){
        
        let font = UIFont.boldSystemFont(ofSize: 12)
        
        let width = 225, height = 10000.0
        
        var atts = NSMutableDictionary()
        
        atts.setObject(font, forKey: "NSFontAttributeName" as NSCopying)
        
        //这里string没有办法使用boundingRect，需要转化成NSString
//        let tempBody:NSString = body as NSString
        
        //计算行高
        var size = body.boundingRect(with: CGSize(width: CGFloat(width), height: CGFloat(height)), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: atts as? [NSAttributedString.Key : Any], context: nil)
        
        var label = UILabel(frame: CGRect(x: 0, y: 0, width: size.size.width, height: size.size.height))
        
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.text = (body.length != 0 ? body as? String : "")
        label.font = font
        label.backgroundColor = UIColor.clear
        
        var insets:UIEdgeInsets = (mtype == ChatType.Mine ? MessageItem.getTextInsetsMine() : MessageItem.getTextInsetsSomeone())
        
        self.init(logo:logo, date:date, mtype:mtype, view:label, insets: insets)
    }
    
    //构造图片消息体
    convenience init(image:UIImage, logo:String, date:NSDate, mtype:ChatType){
        var size = image.size
        //等比缩放
        if size.width > 220 {
            size.height /= (size.width / 220)
            size.width = 220
        }
        
        var imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        imageView.image = image
        imageView.layer.cornerRadius = 5.0
        imageView.layer.masksToBounds = true
        
        
        var insets:UIEdgeInsets = (mtype == ChatType.Mine ? MessageItem.getPicturesInsetsMine() : MessageItem.getPicturesInsetsSomeone())
        
        self.init(logo:logo, date:date, mtype:mtype, view:imageView, insets: insets)
    }
    
    init(logo:String, date:NSDate, mtype:ChatType, view:UIView, insets: UIEdgeInsets) {
        self.view = view
        self.logo = logo
        self.date = date
        self.mtype = mtype
        self.inset = insets
    }
    
}

