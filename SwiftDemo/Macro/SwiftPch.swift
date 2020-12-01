//
//  SwiftPch.swift
//  SwiftDemo
//
//  Created by mana on 2020/6/19.
//  Copyright © 2020 mana. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import Alamofire
import SwiftyJSON
import HandyJSON

//网络请求类型
let kHTTPMethodGet:HTTPMethod = HTTPMethod.get
let kHTTPMethodPost:HTTPMethod = HTTPMethod.post

let kScreenWidth = UIScreen.main.bounds.size.width
let kScreenHeight = UIScreen.main.bounds.size.height
let SCREEN_X = kScreenWidth/375.0
func SCREEN_RATIO(x:CGFloat)->CGFloat {
        return (x*(kScreenWidth/375.0))
    }
let TabBar_Height =  44
let NavBar_Height =  44

let StatusBar_Height = UIApplication.shared.statusBarFrame.size.height
/** 状态栏、导航栏、标签栏高度 */
let Height_NavContentBar = 44.0

let IS_IPhoneX_All = (UIScreen.main.bounds.size.height == 812 || UIScreen.main.bounds.size.height == 896)

let Height_StatusBar = (IS_IPhoneX_All ? 44.0 : 20.0)

let Height_NavBar = (IS_IPhoneX_All ? 88.0 : 64.0)

let Height_TopBar = (Height_StatusBar + Height_NavContentBar)

let Height_Tabbar = UITabBarController.init().tabBar.bounds.height

let SafeAreaTopHeight = (IS_IPhoneX_All ? 88 : 64)

// Tabbar safe bottom margin.
let TabbarSafeBottomMargin = (IS_IPhoneX_All ? 34.0 : 0.0)

//Tabbar 图片偏移量
let StandOutHeight:CGFloat = 20

//let UIColorFromRGB(rgbValue:Float) = UIColor(red: Float((rgbValue & 0xFF0000) >> 16)/255.0, green: Float((rgbValue & 0xFF00) >> 8)/255.0, blue: Float(rgbValue & 0xFF)/255.0, alpha: 1.0)

//let kGrayColor = UIColorFromRGB(0x999999)
