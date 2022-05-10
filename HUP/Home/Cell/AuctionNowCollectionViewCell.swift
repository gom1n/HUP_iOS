//
//  AuctionNowCollectionViewCell.swift
//  HUP
//
//  Created by gomin on 2022/05/10.
//

import UIKit

class AuctionNowCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageViewHomeAuctionItem: UIImageView!
    @IBOutlet weak var labelHomeAuctionItem: UILabel!
    @IBOutlet weak var labelItemDate: UILabel!
    @IBOutlet weak var labelItemContext: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageViewHomeAuctionItem.clipsToBounds = true
    }

}
