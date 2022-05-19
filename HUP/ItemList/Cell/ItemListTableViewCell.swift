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
        guard let itemPrice = cellData.maximumPrice else {return}
        guard let heartCount = cellData.scrapCount else {return}
        guard let participantCount = cellData.participants else {return}
//        guard let startTime = Date() else {return}
//        guard let endTime = cellData.auctionClosingDate else {return}
        guard let imgUrlStr =  (cellData.fileNames?[0]) else {return}
        
//        getTime(startTime, endTime)
        
        itemNameLabel.text = itemName
        itemPriceLabel.text = String(itemPrice)
        heartCountLabel.text = String(heartCount)
        participantCountLabel.text = String(participantCount)
        if let url = URL(string: imgBaseURL + imgUrlStr) {
            itemImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "photo"))
        }
    }
    public func getTime(_ start: String, _ end: String) {
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd HH:mm:ss"
        guard let startTime = format.date(from: start) else {return }
        guard let endTime = format.date(from: end) else {return }
        
        let timeLeft = Int(endTime.timeIntervalSince(startTime))
        leftTimeLabel.text = String(timeLeft)
    }
}
