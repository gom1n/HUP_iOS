//
//  UploadPhotoTableViewCell.swift
//  HUP
//
//  Created by gomin on 2022/05/13.
//

import UIKit

class UploadPhotoTableViewCell: UITableViewCell {
    @IBOutlet weak var uploadPhotoCollectionView: UICollectionView!
    @IBOutlet weak var photoCountLabel: UILabel!
    @IBOutlet weak var selectPhotoButton: UIButton!
    
    
    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDelegate & UICollectionViewDataSource, forRow row: Int) {
        uploadPhotoCollectionView.delegate = dataSourceDelegate
        uploadPhotoCollectionView.dataSource = dataSourceDelegate
        uploadPhotoCollectionView.tag = row
        
        let auctionNowNib = UINib(nibName: "UploadPhotoCollectionViewCell", bundle: nil)
        uploadPhotoCollectionView.register(auctionNowNib, forCellWithReuseIdentifier: UploadPhotoCollectionViewCell.identifier)
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        flowLayout.minimumLineSpacing = 12
        
        uploadPhotoCollectionView.collectionViewLayout = flowLayout
        uploadPhotoCollectionView.reloadData()
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
