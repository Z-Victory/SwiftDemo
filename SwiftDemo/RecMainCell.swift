//
//  RecMainCell.swift
//  SwiftDemo
//
//  Created by mana on 2020/9/14.
//  Copyright © 2020 mana. All rights reserved.
//

import UIKit

class RecMainCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var collectView:UICollectionView?
    var itemSize:CGSize?
    var items:[String] = []
    var layout:UICollectionViewFlowLayout?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
//    class func horizonalCell(tableView:UITableView, style: UITableViewCell.CellStyle, reuseIdentifier: String?){
//
//    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupUI() {
        //设置内边距
//        let insets:UIEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        //设置itemsize
//        let itemSize:CGSize = CGSize(width: itemSize., height: 100)
        //初始化layout
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = itemSize ?? CGSize(width: 0, height: 0)
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        
        //创建collectionView
        let newCollectView = UICollectionView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: itemSize!.height+20), collectionViewLayout: layout)
        newCollectView.backgroundColor = UIColor.yellow
        newCollectView.delegate = self
        newCollectView.dataSource = self
//        newCollectView.inset
        newCollectView.register(UINib.init(nibName: "RecOperationCell", bundle: .main), forCellWithReuseIdentifier: "RecOperationCell")
        self.addSubview(newCollectView)
        collectView = newCollectView
    }
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 2
//    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let id = "RecOperationCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: id, for: indexPath) as! RecOperationCell
    //检查cell中是否有tag为1的ImageView，没有创建一个
//    let imageView:UIImageView? = (cell.viewWithTag(1) as? UIImageView)
//    if imageView == nil{
//        let image = UIImage(named: "")
//        let imageView = UIImageView(image: image)
//        imageView.frame = CGRect(x: 0, y: 0, width: 150, height: 135)
//        imageView.tag = 1
//        cell.addSubview(imageView)
//    }else{
//        imageView?.image = UIImage(named: "")
//    }
        cell.layer.cornerRadius = 8
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 2, height: 2)
        cell.layer.shadowRadius = 8
        cell.layer.shadowOpacity = 0.1
        cell.layer.masksToBounds = false
//        cell.bLabel.text = items[indexPath.row]
        return cell
    }
    //     MARK: - 边框距离
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return  UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)
    }
    //    MARK: - 行最小间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    //    MARK: - 列最小间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    func setupItemSize(tempItemSize:CGSize) -> Void {
        itemSize = tempItemSize
    }
    func reloadCollCell() -> Void {
        if items.count > 0{
            collectView?.reloadData()
        }
    }
    
}
