//
//  RecViewController.swift
//  SwiftDemo
//
//  Created by mana on 2020/6/11.
//  Copyright © 2020 mana. All rights reserved.
//

import UIKit
import JXSegmentedView

class RecViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    let tableView = UITableView(frame: .zero, style: .grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI() -> Void {
        //搜索view
        let textfieldView = UIView.init(frame: CGRect(x: 15, y: 5, width: kScreenWidth - 30, height: 34))
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

}

extension RecViewController: JXSegmentedListContainerViewListDelegate {
    func listView() -> UIView {
        return view
    }
}
