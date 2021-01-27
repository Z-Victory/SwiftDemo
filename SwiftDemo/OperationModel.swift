//
//  OperationModel.swift
//  SwiftDemo
//
//  Created by mana on 2020/12/4.
//  Copyright © 2020 mana. All rights reserved.
//

import UIKit
import HandyJSON

//class OperationImageModel: HandyJSON {
    
//    var imageId : NSInteger?
//    let sequence : NSInteger?
//    let locationId : NSInteger?
//    let imageLength : NSInteger?
//    let imageWidth : NSInteger?
//    let key : String?
//    let width : NSInteger?
//    let height : NSInteger?
//
//    //2.实现函数 mapping方法
//    //mutating
//    func mapping(mapper: HelpingMapper) {
//        //3. 使用specify(property:)自定义字段内容
//        mapper.specify(property: &imageId, name: "id")
//    }
//
//    required init() {}
//}

//class OperationModel: HandyJSON {
//    ///主键
//    var operationId : NSInteger = 0
//    ///类型 1运营 2广告
//    let type : String = ""
//    ///位置id
//    let locationId : NSInteger = 0
//    ///排序
//    let sort : NSInteger = 0
//    let opStartTime : NSInteger = 0      //投放开始日期
//    let opEndTime : NSInteger = 0        //投放结束日期
//    let maType : String = ""              //物料类型 1.视频 2.创作者 3.文章 4.活动 5.频道 6.直播 7.自定义
//    let maTemplate : String = ""          //纯图片/模板 0 纯图片 1 模板
//    let maId : NSInteger = 0             //如果选择的为非自定义的
//    let link : String = ""               //链接视频标题/创作者昵称/频道名称/活动名称/文章标题 自定义则给与填写的链接
//    let title : String = ""
//    let enTitle : String = ""            //英文标题
//    let subTitle : String = ""
//    let enSubTitle : String = ""         //英文副标题
//    let image : [OperationImageModel]   //图片
//    let remark : String = ""             //备注
//    let status : NSInteger = 0          //状态 0下线1上线
//    let createTime : NSInteger = 0      //创建时间
//    let updateTime : NSInteger = 0      //更新时间
//
//    //2.实现函数 mapping方法
//    //增加 mutating方法报错
////    func mapping(mapper: HelpingMapper) {
//        //3. 使用specify(property:)自定义字段内容
////        mapper.specify(property: &operationId, name: "id")
////        mapper.specify(property: &parent) { (rawString) -> (String, String) in
////                    let parentNames = rawString.characters.split{$0 == "/"}.map(String.init)
////                    return (parentNames[0], parentNames[1])
////                }
////    }
//
//    required init() {}
//}
