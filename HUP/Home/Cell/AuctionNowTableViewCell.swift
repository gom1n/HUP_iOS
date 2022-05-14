//
//  AuctionNowTableViewCell.swift
//  HUP
//
//  Created by gomin on 2022/05/11.
//

import UIKit

class AuctionNowTableViewCell: UITableViewCell {
    @IBOutlet weak var auctionNowCollectionView: UICollectionView!
    
    func setCollectionViewDataSourceDelegate(forRow row: Int) {
        auctionNowCollectionView.delegate = self
        auctionNowCollectionView.dataSource = self
        auctionNowCollectionView.tag = row
        
        let auctionNowNib = UINib(nibName: "AuctionNowCollectionViewCell", bundle: nil)
        auctionNowCollectionView.register(auctionNowNib, forCellWithReuseIdentifier: AuctionNowCollectionViewCell.identifier)
        
        let flowLayout = UICollectionViewFlowLayout()
//        flowLayout.scrollDirection = .horizontal
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
extension AuctionNowTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 10
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AuctionNowCollectionViewCell", for: indexPath) as? AuctionNowCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 180, height: 250)
        }
}
