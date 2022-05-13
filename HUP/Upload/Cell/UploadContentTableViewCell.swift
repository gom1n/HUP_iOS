//
//  UploadContentTableViewCell.swift
//  HUP
//
//  Created by gomin on 2022/05/13.
//

import UIKit

class UploadContentTableViewCell: UITableViewCell {
    @IBOutlet weak var itemNameText: UITextField!
    @IBOutlet weak var itemCategoryText: UITextField!
    @IBOutlet weak var itemPriceText: UITextField!
    @IBOutlet weak var itemBuyPriceText: UITextField!
    @IBOutlet weak var itemEndDateText: UITextField!
    @IBOutlet weak var itemContentText: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
