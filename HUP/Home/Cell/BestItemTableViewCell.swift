//
//  BestItemTableViewCell.swift
//  HUP
//
//  Created by gomin on 2022/05/11.
//

import UIKit

class BestItemTableViewCell: UITableViewCell {
    @IBOutlet weak var bestItemCollectionView: UICollectionView!
    
    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDelegate & UICollectionViewDataSource, forRow row: Int) {
        bestItemCollectionView.delegate = dataSourceDelegate
        bestItemCollectionView.dataSource = dataSourceDelegate
        bestItemCollectionView.tag = row
        
        let bestItemNib = UINib(nibName: "BestItemCollectionViewCell", bundle: nil)
        bestItemCollectionView.register(bestItemNib, forCellWithReuseIdentifier: "BestItemCollectionViewCell")
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        flowLayout.minimumLineSpacing = 12
        
        bestItemCollectionView.collectionViewLayout = flowLayout
        bestItemCollectionView.reloadData()
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
