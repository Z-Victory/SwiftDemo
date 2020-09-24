//
//  TestViewController.swift
//  SwiftDemo
//
//  Created by mana on 2020/9/18.
//  Copyright © 2020 mana. All rights reserved.
//

import UIKit
import JXSegmentedView

class TestViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var screenW:CGFloat?
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
//        let layout = UICollectionViewFlowLayout.init()
//        layout.minimumLineSpacing = 10.0 //每个相邻的layout的上下间隔
//
//        layout.minimumInteritemSpacing = 10.0 //每个相邻layout的左右间隔
//        screenW = UIScreen.main.bounds.size.width
//        let rect = CGRect(x: 0, y: 0, width: screenW!, height: UIScreen.main.bounds.size.height)
//        let itemW = (screenW!-50)/3
//        layout.itemSize = CGSize(width: itemW, height: itemW)
//        let collectionView = UICollectionView.init(frame: rect, collectionViewLayout: layout)
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        collectionView.backgroundColor = UIColor.white
//        collectionView.register(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "UICollectionViewCell")
//        self.view.addSubview(collectionView)
        initCollectionView()
    }
    func initCollectionView() {

    let defaultLayout = UICollectionViewFlowLayout()

    defaultLayout.scrollDirection = UICollectionView.ScrollDirection.vertical//设置垂直显示

    defaultLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)//设置边距

    defaultLayout.itemSize = CGSize(width: kScreenWidth/2, height: 50)

    defaultLayout.minimumLineSpacing = 10.0 //每个相邻的layout的上下间隔

    defaultLayout.minimumInteritemSpacing = 10.0 //每个相邻layout的左右间隔

    defaultLayout.headerReferenceSize = CGSize(width: 0, height: 0)

    defaultLayout.footerReferenceSize = CGSize(width: 0, height: 15)

    let collectionView = UICollectionView(frame: CGRect(x:0, y:0, width:kScreenWidth, height:kScreenHeight), collectionViewLayout: defaultLayout)

    collectionView.backgroundColor = UIColor.white

    collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "UICollectionViewCell")

    collectionView.dataSource = self

    collectionView.delegate = self

    self.view.addSubview(collectionView)

    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView .dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath)
        cell.backgroundColor = UIColor.lightGray
        cell.layer.cornerRadius = 5;
        cell.layer.masksToBounds = true
        return cell
    }
    
    //     MARK: - 边框距离
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return  UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)
    }
    //    MARK: - 行最小间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    //    MARK: - 列最小间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    //    MARK: - item Size
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let itemW = (screenW!-50)/3
//        return CGSize(width: itemW, height: itemW)
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension TestViewController:JXSegmentedListContainerViewListDelegate{
    func listView() -> UIView {
        return view
    }
}
