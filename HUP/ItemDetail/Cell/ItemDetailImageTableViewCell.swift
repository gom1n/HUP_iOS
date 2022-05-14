//
//  ItemDetailImageTableViewCell.swift
//  HUP
//
//  Created by gomin on 2022/05/15.
//

import UIKit

class ItemDetailImageTableViewCell: UITableViewCell {
    @IBOutlet weak var itemDetailImageCollectionView: UICollectionView!
    
    func setCollectionViewDataSourceDelegate(forRow row: Int) {
        itemDetailImageCollectionView.delegate = self
        itemDetailImageCollectionView.dataSource = self
        itemDetailImageCollectionView.tag = row
        
        let imageNib = UINib(nibName: "ItemDetailImageCollectionViewCell", bundle: nil)
        itemDetailImageCollectionView.register(imageNib, forCellWithReuseIdentifier: ItemDetailImageCollectionViewCell.identifier)
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        flowLayout.minimumLineSpacing = 12
        
        itemDetailImageCollectionView.collectionViewLayout = flowLayout
        itemDetailImageCollectionView.reloadData()
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
extension ItemDetailImageTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 10
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemDetailImageCollectionViewCell", for: indexPath) as? ItemDetailImageCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 400, height: 300)
        }
    func collectionView(
          _ collectionView: UICollectionView,
          layout collectionViewLayout: UICollectionViewLayout,
          minimumInteritemSpacingForSectionAt section: Int
          ) -> CGFloat {
              return 0
          }
}
