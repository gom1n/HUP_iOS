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
    public func setUpData(_ cellData: ChannelModel) {
        let imgBaseURL = "https://hup-bucket.s3.ap-northeast-2.amazonaws.com/"
        
        guard let othersName = cellData.otherUserName else {return}
        guard let latestChatMessage = cellData.latestMessage else {return}
        guard let latestTime = cellData.latestTime else {return}
        guard let itemImgUrlStr =  (cellData.fileNames?[0]) else {return}
        
        othersNameLabel.text = othersName
        latestChatMessageLabel.text = latestChatMessage
        latestTimeLabel.text = latestTime
        if let url = URL(string: imgBaseURL + itemImgUrlStr) {
            itemImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "photo"))
        }
    }
}
