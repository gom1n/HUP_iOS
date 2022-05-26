//
//  UploadContentTableViewCell.swift
//  HUP
//
//  Created by gomin on 2022/05/13.
//

import UIKit
import Cosmos

class UploadContentTableViewCell: UITableViewCell {
    @IBOutlet weak var itemNameText: UITextField!
    @IBOutlet weak var itemCategoryText: UITextField!
    @IBOutlet weak var itemPriceText: UITextField!
    @IBOutlet weak var itemBuyPriceText: UITextField!
    @IBOutlet weak var itemEndDateText: UITextField!
    @IBOutlet weak var itemDescriptionText: UITextView!
    @IBOutlet weak var itemEndTimeText: UITextField!
    @IBOutlet weak var itemStatusView: CosmosView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        itemDescriptionText.layer.borderColor = UIColor.systemGray5.cgColor
        itemDescriptionText.layer.borderWidth = 1.0
        
        // 별점 set
        itemStatusView.rating = 1
        itemStatusView.settings.updateOnTouch = true
        itemStatusView.settings.fillMode = .full
        itemStatusView.settings.starSize = 30
        itemStatusView.settings.starMargin = 5
        itemStatusView.settings.filledColor = UIColor(named: "HupColor") ?? UIColor.gray
        itemStatusView.settings.emptyBorderColor = UIColor(named: "HupColor") ?? UIColor.gray
        itemStatusView.settings.filledBorderColor = UIColor(named: "HupColor") ?? UIColor.gray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
