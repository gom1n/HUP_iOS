//
//  ItemListTableViewCell.swift
//  HUP
//
//  Created by gomin on 2022/05/11.
//

import UIKit

class ItemListTableViewCell: UITableViewCell {
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    @IBOutlet weak var leftTimeLabel: UILabel!
    @IBOutlet weak var heartCountLabel: UILabel!
    @IBOutlet weak var participantCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        itemImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    public func setUpData(_ cellData: ItemListData) {
        let imgBaseURL = "https://hup-bucket.s3.ap-northeast-2.amazonaws.com/"
        
        guard let itemName = cellData.itemName else {return}
        guard let heartCount = cellData.scrapCount else {return}
        guard let participantCount = cellData.participants else {return}
//        guard let startTime = Date() else {return}
//        guard let endTime = cellData.auctionClosingDate else {return}
        guard let imgUrlStr =  (cellData.fileNames?[0]) else {return}
        guard let initPrice = cellData.initPrice else {return}
        guard let maximumPrice = cellData.maximumPrice else {return}
        
        if maximumPrice == 0 {
            itemPriceLabel.text = String(initPrice)
        } else {
            itemPriceLabel.text = String(maximumPrice)
        }
        
        // left time set
        let endTime = cellData.auctionClosingDate!
        let timeDif = GetTime().getTimeDif(Date(), endTime)
        leftTimeLabel.text = timeDif
        
        itemNameLabel.text = itemName
        heartCountLabel.text = String(heartCount)
        participantCountLabel.text = String(participantCount)
        if let url = URL(string: imgBaseURL + imgUrlStr) {
            itemImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "photo"))
        }
    }
}
