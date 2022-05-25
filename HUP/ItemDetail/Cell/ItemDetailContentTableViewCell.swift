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
    @IBOutlet weak var deleteButton: UIButton!
    
    var sellerName: String?
    var sellerProfilImg: String?
    let imgBaseURL = "https://hup-bucket.s3.ap-northeast-2.amazonaws.com/"
    let myUserId = UserDefaults.standard.integer(forKey: "userId")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    public func setUpData(_ cellData: ItemDetailModel) {
        categoryLabel.text = cellData.category!
        itemNameLabel.text = cellData.itemName!
        itemContentLabel.text = cellData.description!
        highPriceLabel.text = String(cellData.maximumPrice!) + "원"
        participantLabel.text = String(cellData.participants!) + "명"
        
        guard let sellerId = cellData.userId else {return}
        ItemDetailDataManager().getSellerInfoDataManager(sellerId, self)
        
        if sellerId == self.myUserId {
            deleteButton.isHidden = true
        } else {
            deleteButton.isHidden = false
        }
    }
    // MARK: item delete method
    @IBAction func deleteButtonTap(_ sender: UIButton) {
        
    }
}
extension ItemDetailContentTableViewCell {
    func sellerInfoSuccessAPI(_ result: MyInfoModel) {
        self.sellerName = result.username
        self.sellerProfilImg = result.picture
        
        if self.sellerName == "adminName" {
           sellerNameLabel.text = "관리자"
        } else {
            sellerNameLabel.text = self.sellerName
        }
        guard let imgUrlStr =  self.sellerProfilImg else {return}
        if let url = URL(string: imgBaseURL + imgUrlStr) {
            sellerProfileImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "photo"))
        }
    }
}
