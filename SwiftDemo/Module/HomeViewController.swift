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
    ///所有page模型
//    var allTagModel:[Any] = []
    ///所有page的title
    lazy var allTitleArray:[String]? = []
    ///page对应的VC名称
    lazy var allPageVCName:[String]? = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        getTags { (result) in
            print(result)
            self.setUI()
        }
    }
    //MARK: - 初始化UI
    func setUI() {
        let _: CGFloat = 150
        //1.初始化JXSegmentedView
        segmentedView = JXSegmentedView()
        segmentedView.delegate = self
        
        //2.初始化dataSource
        //segmentedDataSource一定要通过属性强持有，不然会被释放掉
        segmentedDataSource = JXSegmentedTitleDataSource()
        //配置数据源相关配置属性
//        segmentedDataSource.item = totalItemWidth/CGFloat(titles.count)
        segmentedDataSource.titles = self.allTitleArray!
        segmentedDataSource.isTitleMaskEnabled = false
        segmentedDataSource.titleNormalColor = UIColor.hexStringColor(hexString: "#999999")
        segmentedDataSource.titleSelectedColor = UIColor.hexStringColor(hexString: "#1A1A1A")
//        segmentedDataSource.itemSpacing = 0
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
    }
    
    //MARK: - 网络请求
    func getTags(finish: @escaping (_ result:String)->()){
        let  tagUrl = BASE_URL + khomeTagList
        
        AF.request(URL(string: tagUrl)!, method: .get).responseString { (response) in
            let ste:String = response.value ?? ""
            //通常我们拿到数据会进行非常麻烦的Optinonal（可选类型）进行拆包（Wrapping）操作，SwiftyJSON内部会自动对Optinonal进行拆包，大大简化了代码，解析非常方便
            //如果是字典或者数组类型的字符串
            let jsonString = JSON(ste)
    //        如果是JSON格式的字符串
    //        let jsonString2 = JSON(parseJSON: ste)
    //        print(jsonString.stringValue)
    //        let jsonString3 = "{\"doubleOptional\":1.1,\"stringImplicitlyUnwrapped\":\"hello\",\"int\":1}"
            
    //        解析方法1
    //        if let tagList = JSONDeserializer<PageTagModel>.deserializeFrom(json: jsonString.stringValue){
    //            print(tagList)
    //        }
            
    //        解析方法2
            if let tagList = PageTagModel.deserialize(from: jsonString.stringValue, designatedPath: "data"){
//                print(tagList)
                if tagList.professionList!.count > 0 {
                    //遍历方法1 不需要获取下标
                    tagList.professionList?.forEach({ (item) in
                        let professionItem:ProfessionListItem = item
                        //判断中英文
                        if true {
                            self.allTitleArray?.append(professionItem.title)
                        }else{
//                            self.allTitleArray?.append(professionItem.titleEn)
                        }
                        self.allPageVCName?.append("CommonPageVC")
                    })
                    tagList.industryList?.forEach({ (item) in
                        let industryItem:IndustryListItem = item
                        //判断中英文
                        if true {
                            self.allTitleArray?.append(industryItem.title)
                        }else{
//                            self.allTitleArray?.append(professionItem.titleEn)
                        }
                        self.allPageVCName?.append("CommonPageVC")
                    })
                    
                    tagList.hotTagsList?.forEach({ (item) in
                        let hotItem:HotTagsListItem = item
                        //判断中英文
                        if true {
                            self.allTitleArray?.append(hotItem.title)
                        }else{
//                            self.allTitleArray?.append(professionItem.titleEn)
                        }
                        self.allPageVCName?.append("CommonPageVC")
                    })
                    self.allTitleArray?.insert("推荐", at: 0)
                    self.allPageVCName?.insert("RecViewController", at: 0)
                    print("遍历结束")
                    ///遍历方法2 可以获取下标和元素
//                    for (index,item) in tagList.professionList!.enumerated() {
//
//                    }
                    
                    ///遍历方法3 迭代器遍历
//                    var listIterator = tagList.professionList?.makeIterator()
//                    while let item = listIterator?.next() {
//
//                    }
                    
                    ///遍历方法3 使用indices获取数组的索引区间
//                    for item in tagList.professionList?.indices {
//
//                    }
                    
                    //初始化UI
//                    self.setUI()
                    finish("测试")
                }
            }
        }
}
    
    // MARK: - segmentView代理方法
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
        
        let stu1 = Student.init(name: "")
        let stu2 = Student2.init(name: "")
        stu1.printt()
        stu2.printt()

        let stu3:Person = Student.init(name: "")
        let stu4:Person = Student2.init(name: "")
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
        let classNameStr = self.allPageVCName?[index] ?? ""
        if classNameStr == "RecViewController" {
            return RecViewController()
        }else if index == 1{
            return ChatViewController()
        }else{
            return CommonViewController()
        }
    }
    /// 通过ClassName动态创建ViewController
       /// - Parameter className: calssName
       /// - Returns: ViewController
      class func getViewControllerWithCalssName(_ className: String) -> UIViewController {
           
           // 准备工作: 命名空间: 必须指定那个bundle(包)
           // 从Info.plist中获取bundle的名字
           let namespace = Bundle.main.infoDictionary!["CFBundleName"] as! String
           // 0.将控制器的字符串转成控制器类型
           let classFromStr: AnyClass? = NSClassFromString(namespace + "." + className)
           let viewControllerClass = classFromStr as! UIViewController.Type
           // 1.创建控制器对象
           let viewController = viewControllerClass.init()
           
           return viewController;
           
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
