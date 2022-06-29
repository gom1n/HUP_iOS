//
//  BestItemCollectionViewCell.swift
//  HUP
//
//  Created by gomin on 2022/05/13.
//

import UIKit

class BestItemCollectionViewCell: UICollectionViewCell {
    static let identifier = "BestItemCollectionViewCell"
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var buyDateLabel: UILabel!
    @IBOutlet weak var initPriceLabel: UILabel!
    
    var imgUrlStr: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    public func setUpData(_ cellData: BestItemModel) {
        let imgBaseURL = "https://hup-bucket.s3.ap-northeast-2.amazonaws.com/"
        
        guard let itemName = cellData.itemName else {return}
        guard let buydate = cellData.buyDate else {return}
        guard let initPrice = cellData.initPrice else {return}
        guard let fileNames = cellData.fileNames else {return}
        if !(fileNames.isEmpty) {
            imgUrlStr = fileNames[0]
        }
        
        // buy date
        let buydateRange = buydate.index(buydate.startIndex, offsetBy: 0) ... buydate.index(buydate.endIndex, offsetBy: -10)
        
        itemNameLabel.text = itemName
        buyDateLabel.text = String(buydate[buydateRange])
        initPriceLabel.text = String(initPrice)
        if let url = URL(string: imgBaseURL + imgUrlStr) {
            itemImageView.kf.setImage(with: url, placeholder: UIImage(named: "hupicon"))
        }
    }
}
