//
//  HomeViewController.swift
//  SwiftDemo
//
//  Created by mana on 2020/6/11.
//  Copyright © 2020 mana. All rights reserved.
//

import UIKit
import JXSegmentedView
import SwiftyJSON
import Alamofire
import HandyJSON

class HomeViewController: UIViewController, JXSegmentedViewDelegate, JXSegmentedListContainerViewDataSource {
    var a:Int?
    
    var segmentedView = JXSegmentedView()
    var segmentedDataSource = JXSegmentedTitleDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        let _: CGFloat = 150
        let titles = ["推荐","关注","科技","VR","MAPPING","艺术展","奥特曼"]
        //1.初始化JXSegmentedView
        segmentedView = JXSegmentedView()
        segmentedView.delegate = self
        
        //2.初始化dataSource
        //segmentedDataSource一定要通过属性强持有，不然会被释放掉
        segmentedDataSource = JXSegmentedTitleDataSource()
        //配置数据源相关配置属性
//        segmentedDataSource.item = totalItemWidth/CGFloat(titles.count)
        segmentedDataSource.titles = titles
        segmentedDataSource.isTitleMaskEnabled = false
        segmentedDataSource.titleNormalColor = UIColor.hexStringColor(hexString: "#999999")
        segmentedDataSource.titleSelectedColor = UIColor.hexStringColor(hexString: "#1A1A1A")
        segmentedDataSource.itemSpacing = 0
        segmentedDataSource.isItemWidthZoomEnabled = true
        segmentedDataSource.titleSelectedZoomScale = 1.85
        segmentedDataSource.itemWidthSelectedZoomScale = 1.85
        segmentedDataSource.isSelectedAnimable = true
        segmentedDataSource.titleNormalFont = UIFont.systemFont(ofSize: 14)
        segmentedDataSource.titleSelectedFont = UIFont.systemFont(ofSize: 26)
        //关联dataSource
        segmentedView.dataSource = self.segmentedDataSource
        
        //3.初始化指示器indicator
        let indicator = JXSegmentedIndicatorLineView()
        indicator.indicatorWidth = 20
        segmentedView.indicators = [indicator]
        
        //4.可选实现JXSegmentedViewDelegate代理
        
        
        segmentedView.frame = CGRect(x: 0, y: StatusBar_Height, width: kScreenWidth, height: 60)
//        segmentedView.layer.masksToBounds = true
//        segmentedView.layer.cornerRadius = 15
//        segmentedView.layer.borderColor = UIColor.red.cgColor
//        segmentedView.layer.borderWidth = 1/UIScreen.main.scale
        
        view.addSubview(self.segmentedView)
        let listContainerView = JXSegmentedListContainerView(dataSource: self)
        listContainerView.frame = CGRect(x: 0, y: StatusBar_Height+60, width: view.bounds.size.width, height: view.bounds.size.height - StatusBar_Height - 60)
        view.addSubview(listContainerView)
        segmentedView.listContainer = listContainerView
//        setUI()
        getTags()
    }
func getTags() -> Void {
    /*
    AF.request(URL(string: urls)!, method: .get, parameters: nil)
                    .responseString { (responses) in
        let ste:String = responses.value ?? ""
        print(ste)
    }
 */
    let  tagUrl = BASE_URL + khomeTagList
    
    AF.request(URL(string: tagUrl)!, method: .get).responseString { (response) in
        let ste:String = response.value ?? ""
        let jsonString = JSON(ste)
        print(jsonString)
        if let tagList = JSONDeserializer<PageTagModel>.deserializeFrom(json: jsonString){
            print(tagList)
        }
    }
}
    
    // MARK: segmentView代理方法
    //点击选中或者滚动选中都会调用该方法。适用于只关心选中事件，而不关心具体是点击还是滚动选中的情况。
    func segmentedView(_ segmentedView: JXSegmentedView, didSelectedItemAt index: Int) {
//        var vc = UIViewController.init()
//        if index == 0 {
//            vc = RecViewController.init()
//        }else{
//            vc = CommonViewController.init()
//        }
//        let childViews = self.view.subviews
//        for child in childViews {
//            child.removeFromSuperview()
//        }
//        self.view.addSubview(vc.view)
    }
    // 点击选中的情况才会调用该方法
    func segmentedView(_ segmentedView: JXSegmentedView, didClickSelectedItemAt index: Int) {
        
    }
    // 滚动选中的情况才会调用该方法
    func segmentedView(_ segmentedView: JXSegmentedView, didScrollSelectedItemAt index: Int) {
        
    }
    // 正在滚动中的回调
    func segmentedView(_ segmentedView: JXSegmentedView, scrollingFrom leftIndex: Int, to rightIndex: Int, percent: CGFloat) {
        
    }
    
    
    func testExternRelationship() -> Void {
        
        let stu1 = Student.init()
        let stu2 = Student2.init()
        stu1.printt()
        stu2.printt()

        let stu3:Person = Student.init()
        let stu4:Person = Student2.init()
        stu3.printt()
        stu4.printt()
    }
    //MARK: - JXSegmentedListContainerViewDataSource
    //返回列表的数量
    func numberOfLists(in listContainerView: JXSegmentedListContainerView) -> Int {
        return segmentedDataSource.titles.count
    }
    //返回遵从`JXSegmentedListContainerViewListDelegate`协议的实例
    func listContainerView(_ listContainerView: JXSegmentedListContainerView, initListAt index: Int) -> JXSegmentedListContainerViewListDelegate {
        if index == 0 {
            return RecViewController()
        }
        return CommonViewController()
    }
    //MARK: - JXSegmentedListContainerViewListDelegate
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
