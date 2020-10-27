//
//  RecOperationCell.swift
//  SwiftDemo
//
//  Created by mana on 2020/9/14.
//  Copyright © 2020 mana. All rights reserved.
//

import UIKit

class RecOperationCell: UICollectionViewCell {
    @IBOutlet weak var bLabel: UILabel!
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
        title.textAlignment = .center
        title.font = UIFont.systemFont(ofSize: 13)
        return title
    }()
    
    
}
