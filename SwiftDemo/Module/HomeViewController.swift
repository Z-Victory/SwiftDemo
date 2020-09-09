//
//  HomeViewController.swift
//  SwiftDemo
//
//  Created by mana on 2020/6/11.
//  Copyright © 2020 mana. All rights reserved.
//

import UIKit
import JXSegmentedView
import Alamofire

class HomeViewController: UIViewController, JXSegmentedViewDelegate,UITableViewDelegate,UITableViewDataSource, JXSegmentedListContainerViewDataSource {
    var a:Int?
    
    var segmentedView = JXSegmentedView()
    var segmentedDataSource = JXSegmentedTitleDataSource()
    
    let tableView = UITableView(frame: .zero, style: .grouped)
    
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
//        getData()
    }
func getData() -> Void {

        let para = ["pageSize":String(50),"pageIndex":String(1)]
    let request = AF.request("https://www.manamana.net/api/mobile/2.0/recommend/hotVideoList",method: .get,parameters:para,encoder: URLEncodedFormParameterEncoder(destination: .httpBody),headers: ["Content-Type":"application/json"])

        request.responseJSON { (dataResponse) in
    //        print("访问的Url地址 = " + baseUrl + loginUrl)
            let resultDict = dataResponse.value as! [String:Any]
            if dataResponse.error == nil{
                ///请求成功
                let resultDict = dataResponse.value as! [String:Any]
                print(resultDict)
            }else{
                print(dataResponse.error!)
            }
        }
    //        let para:[String:Any] = ["pageSize":String(50),"pageIndex":String(1)]
    //        let header:HTTPHeaders = ["Accept": "*/*", "X-Requested-With": "APP"]
    //        AF.request("https://www.manamana.net/api/mobile/2.0/recommend/hotVideoList",
    //                   method: HTTPMethod.get,
    //                   parameters: para,
    //                   encoding: URLEncoding.default ,
    //                   headers: header).responseJSON { (dataResponse) in
    //            debugPrint("debugPrint \(dataResponse)")
    //            if dataResponse.value != nil{
    //                let values = dataResponse.result as! NSDictionary
    //                let messageDic = values["message"] as! NSDictionary
    //                let questionContentArr = messageDic["questionContent"] as! [[String : Any]]
    //                if questionContentArr.count != 0 {
    //                }
    //            }
    //        }
}
    func setUI() -> Void {
        //搜索view
        let textfieldView = UIView.init(frame: CGRect(x: 15, y: segmentedView.bottom + 5, width: kScreenWidth - 30, height: 34))
        textfieldView.backgroundColor = UIColor.lightGray
        textfieldView.layer.cornerRadius = 8.0;
        self.view.addSubview(textfieldView)
        
        //搜索图🔍
        let searchImage = UIImageView()
        searchImage.image = UIImage.init(named: "search_small")
        textfieldView.addSubview(searchImage)
        searchImage.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: 12, height: 12))
            $0.left.equalTo(11)
            $0.centerY.equalTo(textfieldView)
        }
        
        let searchLabel = UILabel()
        searchLabel.textColor = UIColor.hexStringColor(hexString: "#CCCCCC")
        searchLabel.font = UIFont.systemFont(ofSize: 14)
        searchLabel.text = "搜索作品/艺术家"
        self.view.addSubview(searchLabel)
        searchLabel.snp.makeConstraints{
            $0.left.equalTo(searchImage.snp_rightMargin).offset(11)
            $0.centerY.equalTo(textfieldView)
        }
//        UITapGestureRecognizer * searchTap = [[UITapGestureRecognizer alloc] initWithActionBlock:^(id  _Nonnull sender) {
//            //跳转搜索界面
//            [DKJumpManager pushSearchVC:self];
//        }];
//        searchTap.numberOfTapsRequired = 1;
//        searchTap.numberOfTouchesRequired = 1;
//        [textfield addGestureRecognizer:searchTap];
        let bannerImagesArray = NSMutableArray(array: ["http://image.manamana.net/1592364690215_8wBMeQ4n",
                                                       "http://image.manamana.net/1591597041882_G1sMUmnY",
                                                       "http://image.manamana.net/1592274629585_p88gztyX",
                                                       "http://image.manamana.net/1591927948714_cCOrIk0W"])
        
        let bannerView = LYHCycleScrollView.init(frame: CGRect(x: 0, y: textfieldView.bottom, width: kScreenWidth, height: kScreenWidth*0.46), addImageArray: bannerImagesArray)
        bannerView.backgroundColor = UIColor.white
        self.view.addSubview(bannerView)
        bannerView.imageArray = bannerImagesArray
        bannerView.reloadImage();
        
        tableView.frame = CGRect(x: 0, y: bannerView.bottom, width: kScreenWidth, height: kScreenHeight - bannerView.bottom)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 320
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView.init(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        view.backgroundColor = UIColor.red
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.item == 0 {
//          let headerCell = VideoPlayCell()
//          headerCell.todayCell.todayItem = todayItem
//          headerCell.todayCell.layer.cornerRadius = 0
//          headerCell.clipsToBounds = true
//          headerCell.todayCell.backgroundView = nil
//          return headerCell
//        }
//        let headerCell = VideoPlayCell()
        var videoCell : VideoPlayCell! = tableView.dequeueReusableCell(withIdentifier: "VideoPlayCell")as?VideoPlayCell
        if videoCell == nil {
//            videoCell = VideoPlayCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "VideoPlayCell")
            videoCell = Bundle.main.loadNibNamed("VideoPlayCell", owner: nil, options: nil)?.first as? VideoPlayCell
        }
        return videoCell
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
