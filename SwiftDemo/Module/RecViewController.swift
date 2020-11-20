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

class RecViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    let tableView = UITableView(frame: .zero, style: .grouped)
    var rollView : LYHCycleScrollView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI() -> Void {
        //搜索view
//        let textfieldView = UIView.init(frame: CGRect(x: 15, y: 5, width: kScreenWidth - 30, height: 34))
//        textfieldView.backgroundColor = UIColor.lightGray
//        textfieldView.layer.cornerRadius = 8.0;
//        self.view.addSubview(textfieldView)
//
//        //搜索图🔍
//        let searchImage = UIImageView()
//        searchImage.image = UIImage.init(named: "search_small")
//        textfieldView.addSubview(searchImage)
//        searchImage.snp.makeConstraints {
//            $0.size.equalTo(CGSize(width: 12, height: 12))
//            $0.left.equalTo(11)
//            $0.centerY.equalTo(textfieldView)
//        }
//
//        let searchLabel = UILabel()
//        searchLabel.textColor = UIColor.hexStringColor(hexString: "#CCCCCC")
//        searchLabel.font = UIFont.systemFont(ofSize: 14)
//        searchLabel.text = "搜索作品/艺术家"
//        self.view.addSubview(searchLabel)
//        searchLabel.snp.makeConstraints{
//            $0.left.equalTo(searchImage.snp_rightMargin).offset(11)
//            $0.centerY.equalTo(textfieldView)
//        }
//        UITapGestureRecognizer * searchTap = [[UITapGestureRecognizer alloc] initWithActionBlock:^(id  _Nonnull sender) {
//            //跳转搜索界面
//            [DKJumpManager pushSearchVC:self];
//        }];
//        searchTap.numberOfTapsRequired = 1;
//        searchTap.numberOfTouchesRequired = 1;
////        [textfield addGestureRecognizer:searchTap];
//        let bannerImagesArray = NSMutableArray(array: ["http://image.manamana.net/1592364690215_8wBMeQ4n",
//                                                       "http://image.manamana.net/1591597041882_G1sMUmnY",
//                                                       "http://image.manamana.net/1592274629585_p88gztyX",
//                                                       "http://image.manamana.net/1591927948714_cCOrIk0W"])
//
//        bannerView = LYHCycleScrollView.init(frame: CGRect(x: 0, y: textfieldView.bottom, width: kScreenWidth, height: kScreenWidth*0.46), addImageArray: bannerImagesArray)
//        bannerView.backgroundColor = UIColor.white
//        self.view.addSubview(bannerView)
//        bannerView.imageArray = bannerImagesArray
//        bannerView.reloadImage();
        
        tableView.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight-Height_Tabbar - 57 - CGFloat(Height_StatusBar))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableHeaderView = self.testHeader()
        self.view.addSubview(tableView)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        }
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 230
        }
        return 320
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        if section == 0 {
//            return 0.01
//        }
        return 44
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView.init(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        view.backgroundColor = UIColor.red
        
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
        if indexPath.section == 0 && indexPath.row == 0 {
            var operationCell : RecMainCell! = tableView.dequeueReusableCell(withIdentifier: "RecMainCell")as?RecMainCell
            if operationCell == nil {
                operationCell = RecMainCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "RecMainCell")
                operationCell.setupItemSize(tempItemSize: CGSize(width: 90, height: 131))
                operationCell.setupUI()
            }
            operationCell.items = ["1","2","3"]
            operationCell.reloadCollCell()
            return operationCell
        }
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
            videoCell = VideoPlayCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "VideoPlayCell")
//            videoCell = Bundle.main.loadNibNamed("VideoPlayCell", owner: nil, options: nil)?.first as? VideoPlayCell
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

}

extension RecViewController: JXSegmentedListContainerViewListDelegate {
    func listView() -> UIView {
        return view
    }
}
