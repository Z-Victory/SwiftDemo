//
//  FoundMainCell.swift
//  SwiftDemo
//
//  Created by 刘亚和 on 2020/9/12.
//  Copyright © 2020 mana. All rights reserved.
//

import UIKit

class FoundMainCell: UITableViewCell {
    lazy var leftLabel = { () -> UILabel in
        let label = UILabel.init()
        label.textColor = UIColor.blue
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .left
        label.text = "test"
        return label
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class func cellWithTableView(tableView:UITableView, cellid:String) -> FoundMainCell{
//        let cellid : String = "cell"
        var cell:FoundMainCell! = tableView.dequeueReusableCell(withIdentifier: cellid)as? FoundMainCell
        if cell == nil {
//            init
            cell = FoundMainCell.init(style: .default, reuseIdentifier: cellid)
        }
        return cell
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
          super.init(style: style, reuseIdentifier: reuseIdentifier)
          self.addUI()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }

    func addUI() {
          self.addSubview(self.leftLabel)
          //添加约束
          self.leftLabel.snp.makeConstraints { (make) in
              make.top.leading.equalTo(self).offset(16)
              make.height.equalTo(26)
          }
      }
}
