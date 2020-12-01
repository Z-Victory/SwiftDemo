//
//  RecOperationCell.swift
//  SwiftDemo
//
//  Created by mana on 2020/9/14.
//  Copyright © 2020 mana. All rights reserved.
//

import UIKit

class RecOperationCell: UICollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    lazy var imageView:UIImageView = {
        var imageView = UIImageView.init()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = UIColor(red: CGFloat(arc4random()%255)/255, green: CGFloat(arc4random()%255)/255, blue: CGFloat(arc4random()%255)/255, alpha: 1)
        return imageView
    }()
    lazy var title:UILabel = {
        var title = UILabel.init()
        title.textColor = UIColor.darkGray
        title.backgroundColor = UIColor(red: CGFloat(arc4random()%255)/255, green: CGFloat(arc4random()%255)/255, blue: CGFloat(arc4random()%255)/255, alpha: 1)
        title.textAlignment = .center
        title.font = UIFont.systemFont(ofSize: 13)
        return title
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setUI() -> Void {
        self.contentView.addSubview(self.imageView)
        self.imageView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(0)
            make.top.equalToSuperview().offset(3)
            make.size.equalTo(CGSize(width: SCREEN_RATIO(x: 45), height: SCREEN_RATIO(x: 45)))
        }
        self.contentView.addSubview(self.title)
        self.title.text = "test"
        self.title.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.imageView).offset(0)
            make.top.equalTo(self.imageView.snp.bottom).offset(9)
            make.left.right.equalToSuperview().offset(0)
            
        }
    }
}
