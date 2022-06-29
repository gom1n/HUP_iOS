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
    @IBOutlet weak var labelItemPrice: UILabel!
    
    var imgUrlStr: String = ""
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageViewHomeAuctionItem.clipsToBounds = true
    }
    public func setUpData(_ cellData: AuctionNowData) {
        let imgBaseURL = "https://hup-bucket.s3.ap-northeast-2.amazonaws.com/"
        
        guard let itemName = cellData.itemName else {return}
        guard let category: String = cellData.category else {return}
//        let categoryStr = GetCategory().getCategory(category)
        guard let description = cellData.description else {return}
        guard let initPrice = cellData.initPrice else {return}
        guard let maximumPrice = cellData.maximumPrice else {return}
        guard let fileNames = cellData.fileNames else {return}
        if !(fileNames.isEmpty) {
            imgUrlStr = fileNames[0]
        }
        
        if maximumPrice == 0 {
            labelItemPrice.text = String(initPrice) + "원"
            labelItemPrice.textColor = UIColor(named: "HupColor")
        } else {
            labelItemPrice.text = String(maximumPrice) + "원"
            labelItemPrice.textColor = .red
        }
        labelHomeAuctionItem.text = itemName
        labelItemCategory.text = category
        labelItemContext.text = description
        if let url = URL(string: imgBaseURL + imgUrlStr) {
            imageViewHomeAuctionItem.kf.setImage(with: url, placeholder: UIImage(named: "hupicon"))
        }
    }
}
