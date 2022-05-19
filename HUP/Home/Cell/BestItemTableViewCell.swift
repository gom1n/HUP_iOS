//
//  BestItemTableViewCell.swift
//  HUP
//
//  Created by gomin on 2022/05/11.
//

import UIKit

class BestItemTableViewCell: UITableViewCell {
    @IBOutlet weak var bestItemCollectionView: UICollectionView!
    
    var bestItemArray : [BestItemModel]?
    
    func setCollectionViewDataSourceDelegate(forRow row: Int) {
        bestItemCollectionView.delegate = self
        bestItemCollectionView.dataSource = self
        bestItemCollectionView.tag = row
        
        let bestItemNib = UINib(nibName: "BestItemCollectionViewCell", bundle: nil)
        bestItemCollectionView.register(bestItemNib, forCellWithReuseIdentifier: BestItemCollectionViewCell.identifier)
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        flowLayout.minimumLineSpacing = 0
        
        bestItemCollectionView.collectionViewLayout = flowLayout
        bestItemCollectionView.reloadData()
        
        //DATA
        BestItemDataManager().bestItemDataManager("eOnGoing", self)
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
extension BestItemTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bestItemArray?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BestItemCollectionViewCell", for: indexPath) as? BestItemCollectionViewCell else {
            return UICollectionViewCell()
        }
        let itemIdx = indexPath.item
        if let cellData = self.bestItemArray {
            // if data exists
            cell.setUpData(cellData[itemIdx])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = collectionView.frame.width
        return CGSize(width: w, height: 280)
    }
}
extension BestItemTableViewCell {
    func bestItemSuccessAPI(_ result : [BestItemModel]) {
        self.bestItemArray = result
        bestItemCollectionView.reloadData()
    }
}
