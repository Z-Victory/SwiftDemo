//
//  VideoPlayCell.swift
//  SwiftDemo
//
//  Created by mana on 2020/6/19.
//  Copyright © 2020 mana. All rights reserved.
//

import UIKit

class VideoPlayCell: UITableViewCell {
    @IBOutlet weak var shadowView : UIView!
    @IBOutlet weak var thumb : UIImageView!
    @IBOutlet weak var videoNameLabel : UILabel!
    @IBOutlet weak var avatarButton : UIButton!
    @IBOutlet weak var watchNumLabel : UILabel!
    @IBOutlet weak var headphotoImg : UIImageView!
    @IBOutlet weak var organizerNameLabel : UILabel!
    @IBOutlet weak var professionalTagLabel : UILabel!
    @IBOutlet weak var timeLabel : UILabel!
    @IBOutlet weak var likeButton : UIButton!
    @IBOutlet weak var shareButton : UIButton!
    @IBOutlet weak var playButton : UIButton!
    @IBOutlet weak var recSeparatorLine : UIView!
    @IBOutlet weak var eyeImg : UIImageView!
    @IBOutlet weak var verticalLineImg : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func layoutSubviews() {
        print(self.frame)
        self.thumb.snp.makeConstraints{
            $0.top.left.right.equalTo(self).inset(UIEdgeInsets(top: 15, left: 15, bottom: 0, right: 15))
            $0.height.equalTo((kScreenWidth - 30)*0.562)
        }
        shadowView.snp.makeConstraints{
            $0.top.left.bottom.right.equalTo(thumb)
        }
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 2, height: 2)
        shadowView.layer.shadowRadius = 8.0
        shadowView.layer.shadowOpacity = 0.4
        shadowView.layer.cornerRadius = 8
            
        self.thumb.layer.cornerRadius = 8
        self.thumb.isUserInteractionEnabled = true
            
        self.timeLabel.snp.makeConstraints{
            $0.right.equalTo(self.thumb.snp.right).offset(-6)
            $0.bottom.equalTo(self.thumb.snp.bottom).offset(-10)
            $0.size.equalTo(CGSize(width: 44, height: 16))
        }
        
        self.timeLabel.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        
        self.videoNameLabel.snp.makeConstraints{
            $0.left.right.equalTo(self.thumb)
            $0.top.equalTo(self.thumb.snp_bottomMargin).offset(15)
        }

        self.eyeImg.snp.makeConstraints{
            $0.left.equalTo(self.thumb)
            $0.top.equalTo(self.videoNameLabel.snp.bottom).offset(10)
            $0.size.equalTo(CGSize(width: 14, height: 10))
        }
        self.watchNumLabel.snp.makeConstraints{
            $0.left.equalTo(eyeImg.snp.right).offset(3)
            $0.centerY.equalTo(eyeImg)
            $0.width.equalTo(44)
        }

        verticalLineImg.snp.makeConstraints{
            $0.left.equalTo(self.watchNumLabel.snp.right).offset(10)
            $0.centerY.equalTo(eyeImg)
            $0.size.equalTo(CGSize(width: 1, height: 10))
    //        $0.right.equalTo(self.professionalTagLabel.left).offset(-10)
        }

        self.professionalTagLabel.snp.makeConstraints{
            $0.left.equalTo(verticalLineImg.snp.right).offset(10)
    //        $0.left.equalTo(self.thumb)
            $0.centerY.equalTo(eyeImg)
            $0.right.equalTo(self.thumb)
        }

        self.headphotoImg.snp.makeConstraints{
            $0.size.equalTo(CGSize(width: 26, height: 26))
            $0.left.equalTo(self.thumb)
            $0.top.equalTo(eyeImg.snp.bottom).offset(7)
        }

        self.shareButton.snp.makeConstraints{
            $0.right.equalTo(0)
            $0.centerY.equalTo(self.headphotoImg)
            $0.size.equalTo(CGSize(width: 45, height: 26))
        }
        self.likeButton.snp.makeConstraints{
            $0.right.equalTo(self.shareButton.snp.left).offset(0)
            $0.centerY.equalTo(self.headphotoImg)
            $0.size.equalTo(CGSize(width: 45, height: 26))
        }
        let color = UIColor.hexStringColor(hexString: "#F6F6F6")
        self.headphotoImg.layer.borderColor =  color.cgColor
        self.headphotoImg.layer.borderWidth = 1.0

        self.organizerNameLabel.snp.makeConstraints{
            $0.left.equalTo(self.headphotoImg.snp.right).offset(5)
            $0.right.equalTo(self.likeButton.snp.left).offset(-8*SCREEN_X)
            $0.centerY.equalTo(self.headphotoImg)
        }
        self.avatarButton.snp.makeConstraints{
            $0.left.top.bottom.equalTo(self.headphotoImg)
            $0.right.equalTo(self.thumb)
        }
        self.headphotoImg.layer.cornerRadius = self.headphotoImg.width/2
    }
}
