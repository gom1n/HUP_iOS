//
//  ItemDetailContentTableViewCell.swift
//  HUP
//
//  Created by gomin on 2022/05/15.
//

import UIKit

class ItemDetailContentTableViewCell: UITableViewCell {
    var itemId: Int?
    @IBOutlet weak var sellerProfileImageView: UIImageView!
    @IBOutlet weak var sellerNameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var highPriceLabel: UILabel!
    @IBOutlet weak var participantLabel: UILabel!
    @IBOutlet weak var itemContentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    public func setUpData(_ cellData: ItemDetailModel) {
        let imgBaseURL = "https://hup-bucket.s3.ap-northeast-2.amazonaws.com/"
        
        categoryLabel.text = cellData.category!
        itemNameLabel.text = cellData.itemName!
        itemContentLabel.text = cellData.description!
        highPriceLabel.text = String(cellData.maximumPrice!) + "원"
        participantLabel.text = String(cellData.participants!) + "명"
        
//        guard let imgUrlStr =  (cellData.fileNames?[0]) else {return}
//        if let url = URL(string: imgBaseURL + imgUrlStr) {
//            imageViewHomeAuctionItem.kf.setImage(with: url, placeholder: UIImage(systemName: "photo"))
//        }
    }
    @IBAction func deleteButtonTap(_ sender: UIButton) {
    }
}
