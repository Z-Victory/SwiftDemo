//
//  MainViewController.swift
//  SwiftDemo
//
//  Created by mana on 2020/6/11.
//  Copyright © 2020 mana. All rights reserved.
//

import UIKit
//Tabbar 图片偏移量
let StandOutHeight:CGFloat = 20
let kScreenWidth = UIScreen.main.bounds.size.width
let kScreenHeight = UIScreen.main.bounds.size.height
let Height_Tabbar = UITabBarController.init().tabBar.bounds.height
let IS_IPhoneX_All = (kScreenHeight == 812 || kScreenHeight == 896)

// Tabbar safe bottom margin.
let TabbarSafeBottomMargin = (IS_IPhoneX_All ? 34 : 0)

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.insertSubview(drawTabbarBgImageView(), at: 0)
        self .addChildVCWithImage(childVC: HomeViewController(), childName: "主页", image: "home_Selected", selectImage: "home_Selected", index: 0)
        self .addChildVCWithImage(childVC: HomeViewController(), childName: "发现", image: "discover", selectImage: "discover_Selected", index: 1)
        self .addChildVCWithImage(childVC: HomeViewController(), childName: "发布", image: "add_video", selectImage: "add_video", index: 2)
        self .addChildVCWithImage(childVC: HomeViewController(), childName: "消息", image: "event", selectImage: "event_Selected", index: 3)
        self .addChildVCWithImage(childVC: HomeViewController(), childName: "我的", image: "me", selectImage: "me_Selected", index: 4)
        //设置选中颜色
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.init(red: 247/255.0, green: 195/255.0, blue: 55/255.0, alpha: 1)], for: UIControl.State.selected)
        //设置未选中颜色
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.gray], for: UIControl.State.normal)
        //设置背景色
        UITabBar.appearance().isTranslucent = false
        self.tabBar.barTintColor = UIColor.yellow
        self.tabBar.tintColor = UIColor.black
    }
    func addChildVCWithImage(childVC:UIViewController,childName:String,image:String,selectImage:String,index:Int) -> Void {
        let nav = UINavigationController(rootViewController: childVC)
        nav.title = childName
        nav.tabBarItem.image = UIImage(named: image)
        nav.tabBarItem.selectedImage = UIImage(named: selectImage)
        nav.tabBarItem.tag = index
        self.addChild(nav)
        if childName == "发布" {
            nav.tabBarItem.imageInsets = UIEdgeInsets(top: -StandOutHeight/1.5, left: 1, bottom: StandOutHeight/1.5, right: 0);
        }
    }
    func drawTabbarBgImageView() -> UIImageView {
        let radius:CGFloat = 26
        let allFloat:CGFloat = CGFloat(pow(radius, 2)-pow(radius-CGFloat(StandOutHeight), 2));
        let ww = sqrtf(Float(allFloat))
        let imageView = UIImageView.init(frame: CGRect(x: 0, y: Int(-StandOutHeight), width: Int(kScreenWidth), height: Int(Height_Tabbar+StandOutHeight+CGFloat(TabbarSafeBottomMargin))))
        let size = imageView.frame.size
        let layer = CAShapeLayer.init()
        let path = UIBezierPath.init()
        path.move(to: CGPoint(x: size.width/2 - CGFloat(ww), y: StandOutHeight))
        let angleH = 0.5*((radius-StandOutHeight)/radius)
        let startAngle = (1+angleH)*CGFloat(Double.pi)
        let endAngle = (2-angleH)*CGFloat(Double.pi)
        path.addArc(withCenter: CGPoint(x: size.width/2, y: radius), radius: radius, startAngle: CGFloat(startAngle), endAngle: CGFloat(endAngle), clockwise: true)
        path.addLine(to: CGPoint(x: size.width/2+CGFloat(ww), y: StandOutHeight))
        path.addLine(to: CGPoint(x: size.width, y: StandOutHeight))
        path.addLine(to: CGPoint(x: size.width, y: size.height))
        path.addLine(to: CGPoint(x: 0, y: size.height))
        path.addLine(to: CGPoint(x: 0, y: StandOutHeight))
        path.addLine(to: CGPoint(x: size.width/2-CGFloat(ww), y: StandOutHeight))
        layer.path = path.cgPath
        layer.fillColor = UIColor.white.cgColor// 整个背景的颜色
        layer.strokeColor = UIColor.white.cgColor//边框线条的颜色
        layer.lineWidth = 0.5//边框线条的宽
        imageView.layer.addSublayer(layer)
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowRadius = 6
        imageView.layer.shadowOffset = CGSize(width: 0, height: 0)
        imageView.layer.shadowOpacity = 0.1
        return imageView
    }

}
