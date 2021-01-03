//
//  VideoPlayCell.swift
//  SwiftDemo
//
//  Created by mana on 2020/6/19.
//  Copyright © 2020 mana. All rights reserved.
//

import UIKit

class VideoPlayCell: UITableViewCell {
//    @IBOutlet weak var shadowView : UIView!
//    @IBOutlet weak var thumb : UIImageView!
//    @IBOutlet weak var videoNameLabel : UILabel!
//    @IBOutlet weak var avatarButton : UIButton!
//    @IBOutlet weak var watchNumLabel : UILabel!
//    @IBOutlet weak var headphotoImg : UIImageView!
//    @IBOutlet weak var organizerNameLabel : UILabel!
//    @IBOutlet weak var professionalTagLabel : UILabel!
//    @IBOutlet weak var timeLabel : UILabel!
//    @IBOutlet weak var likeButton : UIButton!
//    @IBOutlet weak var shareButton : UIButton!
//    @IBOutlet weak var playButton : UIButton!
//    @IBOutlet weak var recSeparatorLine : UIView!
//    @IBOutlet weak var eyeImg : UIImageView!
//    @IBOutlet weak var verticalLineImg : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    ///封面图
    lazy var thumb = {()-> UIImageView in
        let imageView = UIImageView.init()
        imageView.layer.cornerRadius = 8.0
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "image2")
        return imageView
    }()
    
    //标题
    lazy var title = { () -> UILabel in
        let label  = UILabel.init()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.textColor = UIColor.darkGray
        label.text = "测试"
        return label
    }()
    
    //小眼睛
    lazy var eyeImage = {()-> UIImageView in
        let imageView = UIImageView.init()
        imageView.image = UIImage.init(named: "eye")
        return imageView
    }()
    
    //浏览量
    lazy var viewCount = { () -> UILabel in
        let label  = UILabel.init()
        label.text = "9999"
        return label
    }()
    
    ///头像
    lazy var avata = {()-> UIButton in
        let button = UIButton.init()
        button.setImage(UIImage.init(named: "image3"), for: .normal)
        return button
    }()
    
    ///昵称
    lazy var nickName = { () -> UILabel in
        let label  = UILabel.init()
        label.text = "张三"
        return label
    }()
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addUI() -> Void {
        self.addSubview(self.thumb)
        self.thumb.snp.makeConstraints{
            $0.top.left.right.equalTo(self).inset(UIEdgeInsets(top: 15, left: 15, bottom: 0, right: 15))
            $0.height.equalTo((kScreenWidth - 30)*0.562)
        }
        
        
//        shadowView.snp.makeConstraints{
//            $0.top.left.bottom.right.equalTo(thumb)
//        }
//        shadowView.layer.shadowColor = UIColor.black.cgColor
//        shadowView.layer.shadowOffset = CGSize(width: 2, height: 2)
//        shadowView.layer.shadowRadius = 8.0
//        shadowView.layer.shadowOpacity = 0.4
//        shadowView.layer.cornerRadius = 8
            
        self.thumb.layer.cornerRadius = 8
        self.thumb.isUserInteractionEnabled = true
            
//        self.timeLabel.snp.makeConstraints{
//            $0.right.equalTo(self.thumb.snp.right).offset(-6)
//            $0.bottom.equalTo(self.thumb.snp.bottom).offset(-10)
//            $0.size.equalTo(CGSize(width: 44, height: 16))
//        }
//
//        self.timeLabel.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        
        self.addSubview(self.title)
        self.title.snp.makeConstraints{
            $0.left.right.equalTo(self.thumb)
            $0.top.equalTo(self.thumb.snp_bottomMargin).offset(15)
        }

        self.addSubview(self.eyeImage)
        self.eyeImage.snp.makeConstraints{
            $0.left.equalTo(self.thumb)
            $0.top.equalTo(self.title.snp.bottom).offset(10)
            $0.size.equalTo(CGSize(width: 14, height: 10))
        }
        
        self.addSubview(self.viewCount)
        self.viewCount.snp.makeConstraints{
            $0.left.equalTo(eyeImage.snp.right).offset(3)
            $0.centerY.equalTo(eyeImage)
            $0.width.equalTo(44)
        }

//        verticalLineImg.snp.makeConstraints{
//            $0.left.equalTo(self.watchNumLabel.snp.right).offset(10)
//            $0.centerY.equalTo(eyeImg)
//            $0.size.equalTo(CGSize(width: 1, height: 10))
//    //        $0.right.equalTo(self.professionalTagLabel.left).offset(-10)
//        }

//        self.professionalTagLabel.snp.makeConstraints{
//            $0.left.equalTo(verticalLineImg.snp.right).offset(10)
//    //        $0.left.equalTo(self.thumb)
//            $0.centerY.equalTo(eyeImg)
//            $0.right.equalTo(self.thumb)
//        }
        self.addSubview(self.avata)
        self.avata.snp.makeConstraints{
            $0.size.equalTo(CGSize(width: 26, height: 26))
            $0.left.equalTo(self.thumb)
            $0.top.equalTo(eyeImage.snp.bottom).offset(7)
        }

//        self.shareButton.snp.makeConstraints{
//            $0.right.equalTo(0)
//            $0.centerY.equalTo(self.headphotoImg)
//            $0.size.equalTo(CGSize(width: 45, height: 26))
//        }
//        self.likeButton.snp.makeConstraints{
//            $0.right.equalTo(self.shareButton.snp.left).offset(0)
//            $0.centerY.equalTo(self.headphotoImg)
//            $0.size.equalTo(CGSize(width: 45, height: 26))
//        }
//        let color = UIColor.hexStringColor(hexString: "#F6F6F6")
//        self.headphotoImg.layer.borderColor =  color.cgColor
//        self.headphotoImg.layer.borderWidth = 1.0
        
        self.addSubview(self.nickName)
        self.nickName.snp.makeConstraints{
            $0.left.equalTo(self.avata.snp.right).offset(5)
//            $0.right.equalTo(self.likeButton.snp.left).offset(-8*SCREEN_X)
            $0.right.equalTo(-8)
            $0.centerY.equalTo(self.avata)
        }
//        self.avatarButton.snp.makeConstraints{
//            $0.left.top.bottom.equalTo(self.headphotoImg)
//            $0.right.equalTo(self.thumb)
//        }
        self.avata.layer.cornerRadius = self.avata.width/2
    }
    
    override func layoutSubviews() {
        print(self.frame)
    }
}
