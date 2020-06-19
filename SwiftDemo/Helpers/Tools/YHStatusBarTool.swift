//
//  YHStatusBarTool.swift
//  SwiftDemo
//
//  Created by mana on 2020/6/19.
//  Copyright © 2020 mana. All rights reserved.
//

import UIKit

enum NetWorkType {
    case NetworkStatesNone // 没有网络
    case NetworkStates2G // 2G
    case NetworkStates3G // 3G
    case NetworkStates4G // 4G
    case NetworkStatesWIFI // WIFI
}

class YHStatusBarTool: NSObject {


    // 获取运营商 名称
//    class func serviceCompany() -> String {
//        let array :NSArray = (UIApplication.sharedApplication.valueForKeyPath("statusBar")?.valueForKeyPath("foregroundView")?.subviews)!
//
//        for info in array {
//            if info.isKindOfClass(NSClassFromString("UIStatusBarServiceItemView")!) {
//                let serverStr:String = info.valueForKeyPath("serviceString") as! String
//                return serverStr
//            }
//        }
//        return ""
//
//    }
//
//
//    // 显示系统时间
//    class func currentTimeString() -> String {
//        let array :NSArray = (UIApplication.sharedApplication().valueForKeyPath("statusBar")?.valueForKeyPath("foregroundView")?.subviews)!
//
//        for info in array {
//            if info.isKindOfClass(NSClassFromString("UIStatusBarTimeItemView")!) {
//                let timeStr:String = info.valueForKeyPath("timeString") as! String
//                return timeStr
//            }
//        }
//        return ""
//
//    }
//
//    // 检测网络状态
//    class func currentNetworkType() -> NetWorkType {
//        let array :NSArray = (UIApplication.sharedApplication().valueForKeyPath("statusBar")?.valueForKeyPath("foregroundView")?.subviews)!
//        var states :NetWorkType = .NetworkStatesNone
//        for info in array {
//            if info.isKindOfClass(NSClassFromString("UIStatusBarDataNetworkItemView")!) {
//                let networkType = info.valueForKeyPath("dataNetworkType")!.integerValue
//                switch (networkType) {
//                case 0:
//                    states = .NetworkStatesNone;
//                    //无网模式
//                    break;
//                case 1:
//                    states = .NetworkStates2G;
//                    break;
//                case 2:
//                    states = .NetworkStates3G;
//                    break;
//                case 3:
//                    states = .NetworkStates4G;
//                    break;
//                case 5:
//                    states = .NetworkStatesWIFI;
//                    break;
//                default:
//                    break;
//                }
//
//            }
//        }
//        return states
//
//    }
//
//    // 获取当前的电量信息
//    class func currentBatteryPercent() -> String {
//        let array :NSArray = (UIApplication.sharedApplication().valueForKeyPath("statusBar")?.valueForKeyPath("foregroundView")?.subviews)!
//        for info in array {
//            if info.isKindOfClass(NSClassFromString("UIStatusBarBatteryPercentItemView")!) {
//                let presentStr:String = info.valueForKeyPath("percentString") as! String
//                return presentStr
//            }
//        }
//        return ""
//
//    }
}
