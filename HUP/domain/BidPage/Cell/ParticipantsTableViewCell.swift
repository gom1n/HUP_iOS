//
//  ParticipantsTableViewCell.swift
//  HUP
//
//  Created by gomin on 2022/05/16.
//

import UIKit

class ParticipantsTableViewCell: UITableViewCell {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var participantNameLabel: UILabel!
    @IBOutlet weak var bidPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    public func setUpData(_ ptData: ParticipantData?) {
        print("여기는 participant tableview cell : ", ptData!)
//        let imgBaseURL = "https://hup-bucket.s3.ap-northeast-2.amazonaws.com/"
        
        guard let ptName =  ptData?.userName else {return}
        guard let ptPrice =  ptData?.suggestionPrice else {return}
        guard let profilImg =  ptData?.picture else {return}
        
        participantNameLabel.text = ptName
        bidPriceLabel.text = String(ptPrice)
        if let url = URL(string: profilImg) {
            profileImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "photo"))
        }
    }
}
