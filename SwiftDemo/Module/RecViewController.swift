//
//  RecViewController.swift
//  SwiftDemo
//
//  Created by mana on 2020/6/11.
//  Copyright © 2020 mana. All rights reserved.
//

import UIKit
import JXSegmentedView
import SnapKit
import Alamofire

class RecViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    let tableView = UITableView(frame: .zero, style: .grouped)
    var rollView : LYHCycleScrollView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        self.request()
    }
    func setUI() -> Void {
        tableView.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight-Height_Tabbar - 57 - CGFloat(Height_StatusBar))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableHeaderView = self.testHeader()
        self.view.addSubview(tableView)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //RecCellStyleOperation
        if indexPath.section == 0 {
            return SCREEN_RATIO(x: 45)+34+14
        }
        //RecCellStyleLive == 44
        
        return 320
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0.01
        }
        return 44
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return nil
        }
        let view = UIView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 45))
        
        //热门视频
        let titleLabel = UILabel.init()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.text = "热门视频"
        titleLabel.textColor = UIColor.black

        titleLabel.frame = CGRect(x: 15, y: 13, width:kScreenWidth-30 , height: 38)
        view.addSubview(titleLabel)
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath.section,indexPath.row)
        if indexPath.section == 0 && indexPath.row == 0 {
            var operationCell : RecMainCell! = tableView.dequeueReusableCell(withIdentifier: "RecMainCell")as?RecMainCell
            if operationCell == nil {
                operationCell = RecMainCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "RecMainCell")
                operationCell.setupItemSize(tempItemSize: CGSize(width: SCREEN_RATIO(x: 45), height: SCREEN_RATIO(x: 45)+34))
                operationCell.setupUI()
            }
            operationCell.items = ["1","2","3"]
            operationCell.reloadCollCell()
            return operationCell
        }
        var videoCell : VideoPlayCell! = tableView.dequeueReusableCell(withIdentifier: "VideoPlayCell")as?VideoPlayCell
        if videoCell == nil {
            videoCell = VideoPlayCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "VideoPlayCell")
        }
        return videoCell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
    
    func testHeader() -> UIView {
        let headerView = UIView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 500))
        headerView.backgroundColor = UIColor.white
        headerView.layer.cornerRadius = 8
        
        let textfield = UIView.init(frame: CGRect(x: 15, y: 5, width: kScreenWidth - 30, height: 34))
        textfield.backgroundColor = UIColor.lightGray
        textfield.layer.cornerRadius = 8
        headerView.addSubview(textfield)
        
        let searchImage:UIImageView = UIImageView()
        searchImage.image = UIImage(named: "search_small")
        textfield.addSubview(searchImage)
        
        searchImage.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(CGSize(width: 12, height: 12))
            make.left.equalTo(11)
            make.centerY.equalTo(textfield)
        }
        
        
        let searchLabel = UILabel()
        searchLabel.textColor = UIColor.darkGray
        searchLabel.font = UIFont.systemFont(ofSize: 14)
        searchLabel.text = "搜索作品/艺术家"
        textfield.addSubview(searchLabel)
        searchLabel.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(searchImage.snp.right).offset(11)
            make.centerY.equalTo(searchImage)
        }
        
        
        let bannerImagesArray = NSMutableArray(array: ["http://image.manamana.net/1592364690215_8wBMeQ4n",
                                                       "http://image.manamana.net/1591597041882_G1sMUmnY",
                                                       "http://image.manamana.net/1592274629585_p88gztyX",
                                                       "http://image.manamana.net/1591927948714_cCOrIk0W"])
        
        let bannerView = LYHCycleScrollView.init(frame: CGRect(x: 0, y: textfield.bottom, width: kScreenWidth, height: kScreenWidth*0.46), addImageArray: bannerImagesArray)
        bannerView.backgroundColor = UIColor.white
        bannerView.imageArray = bannerImagesArray
        bannerView.reloadImage()
        rollView = bannerView
        headerView.addSubview(bannerView)
        headerView.height = bannerView.bottom
        
        return headerView
    }
    
    //MARK: - 网络请求
    //post请求,后台接收from表单,encoding要为URLEncoding.queryString
    func request() -> Void {
        //接口地址
        let urls:String = "https://www.manamana.net/api/common/categoryAllList"
        //参数
//        let parameters:Dictionary = ["type":"1","name":"customer","password":"123456"]
        //Alamofire 请求实例
        AF.request(URL(string: urls)!, method: .get, parameters: nil)
                        .responseString { (responses) in
            let ste:String = responses.value ?? ""
            print(ste)
        }
    }
    
}

extension RecViewController: JXSegmentedListContainerViewListDelegate {
    func listView() -> UIView {
        return view
    }
}
