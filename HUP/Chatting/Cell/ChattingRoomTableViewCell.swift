//
//  ChattingRoomTableViewCell.swift
//  HUP
//
//  Created by gomin on 2022/05/11.
//

import UIKit

class ChattingRoomTableViewCell: UITableViewCell {
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var othersNameLabel: UILabel!
    @IBOutlet weak var latestChatMessageLabel: UILabel!
    @IBOutlet weak var latestTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        itemImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
