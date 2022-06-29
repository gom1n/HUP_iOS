//
//  AuctionNowTableViewCell.swift
//  HUP
//
//  Created by gomin on 2022/05/11.
//

import UIKit

class AuctionNowTableViewCell: UITableViewCell {
    @IBOutlet weak var auctionNowCollectionView: UICollectionView!
    
    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDelegate & UICollectionViewDataSource, forRow row: Int) {
        auctionNowCollectionView.delegate = dataSourceDelegate
        auctionNowCollectionView.dataSource = dataSourceDelegate
        auctionNowCollectionView.tag = row
        
        let auctionNowNib = UINib(nibName: "AuctionNowCollectionViewCell", bundle: nil)
        auctionNowCollectionView.register(auctionNowNib, forCellWithReuseIdentifier: AuctionNowCollectionViewCell.identifier)
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        flowLayout.minimumLineSpacing = 12
        
        auctionNowCollectionView.collectionViewLayout = flowLayout
        auctionNowCollectionView.reloadData()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
