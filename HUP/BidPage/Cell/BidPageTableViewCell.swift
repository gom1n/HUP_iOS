//
//  BidPageTableViewCell.swift
//  HUP
//
//  Created by gomin on 2022/05/16.
//

import UIKit

class BidPageTableViewCell: UITableViewCell {
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var highPriceLabel: UILabel!
    @IBOutlet weak var participantLabel: UILabel!
    @IBOutlet weak var participantsTableView: UITableView!
    @IBOutlet weak var leftTimeLabel: PaddingLabel!
    
    var itemId: Int?
    var ptData: [ParticipantData]?
    var imgUrlStr: String = ""
    
    func bidPageinit() {
        participantsTableView.delegate = self
        participantsTableView.dataSource = self
        participantsTableView.separatorStyle = .none
        
        let participantNib = UINib(nibName: "ParticipantsTableViewCell", bundle: nil)
        participantsTableView.register(participantNib, forCellReuseIdentifier: "ParticipantsTableViewCell")
        
        // DATA
        guard let itemId = self.itemId else {return}
        BidPageDataManager().participantDataManager(itemId, self)
    }
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
        
        // left time set
        let endTime = cellData.auctionClosingDate!
        let timeDif = GetTime().getTimeDif(Date(), endTime)
        leftTimeLabel.text = timeDif
        highPriceLabel.text = String(cellData.maximumPrice!) + "원"
        participantLabel.text = String(cellData.participants!) + "명"
        guard let fileNames = cellData.fileNames else {return}
        if !(fileNames.isEmpty) {
            imgUrlStr = fileNames[0]
        }
        if let url = URL(string: imgBaseURL + imgUrlStr) {
            itemImageView.kf.setImage(with: url, placeholder: UIImage(named: "hupicon"))
        }
    }
    
}
extension BidPageTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ptData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ParticipantsTableViewCell", for: indexPath) as? ParticipantsTableViewCell else {
            return UITableViewCell()
        }
        let itemIdx = indexPath.item
        if let ptArray = ptData {
            cell.setUpData(ptArray[itemIdx])
        }
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
extension BidPageTableViewCell {
    func participantSuccessAPI(_ result: BidPageModel) {
        self.ptData = result.data
        self.participantsTableView.reloadData()
    }
}
