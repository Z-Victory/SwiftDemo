//
//  RecBusinessCell.swift
//  SwiftDemo
//
//  Created by mana on 2020/10/26.
//  Copyright © 2020 mana. All rights reserved.
//

import UIKit

class RecBusinessCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource {
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 50, height: 50)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 50), collectionViewLayout: layout)
        collectionView.register(UINib.init(nibName: "RecOperationCell", bundle: Bundle.main), forCellWithReuseIdentifier: "RecOperationCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        self.addSubview(collectionView)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellid = "RecOperationCell"
        let cell:RecOperationCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellid, for: indexPath) as! RecOperationCell
        return cell
    }
}
