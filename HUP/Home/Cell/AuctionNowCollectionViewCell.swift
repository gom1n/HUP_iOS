//
//  AuctionNowCollectionViewCell.swift
//  HUP
//
//  Created by gomin on 2022/05/10.
//

import UIKit

class AuctionNowCollectionViewCell: UICollectionViewCell {
    static let identifier = "AuctionNowCollectionViewCell"
    @IBOutlet weak var imageViewHomeAuctionItem: UIImageView!
    @IBOutlet weak var labelHomeAuctionItem: UILabel!
    @IBOutlet weak var labelItemContext: UILabel!
    @IBOutlet weak var labelItemCategory: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageViewHomeAuctionItem.clipsToBounds = true
    }
    public func setUpData(_ cellData: AuctionNowData) {
        let imgBaseURL = "https://hup-bucket.s3.ap-northeast-2.amazonaws.com/"
        
        guard let itemName = cellData.itemName else {return}
        guard let category = cellData.category else {return}
        guard let description = cellData.description else {return}
        guard let imgUrlStr =  (cellData.fileNames?[0]) else {return}
        
        labelHomeAuctionItem.text = itemName
        labelItemCategory.text = category
        labelItemContext.text = description
        if let url = URL(string: imgBaseURL + imgUrlStr) {
            imageViewHomeAuctionItem.kf.setImage(with: url, placeholder: UIImage(systemName: "photo"))
        }
    }
}
