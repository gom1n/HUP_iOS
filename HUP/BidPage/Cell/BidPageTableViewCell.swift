//
//  BidPageTableViewCell.swift
//  HUP
//
//  Created by gomin on 2022/05/16.
//

import UIKit

class BidPageTableViewCell: UITableViewCell {
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemState: UIButton!
    @IBOutlet weak var highPriceLabel: UILabel!
    @IBOutlet weak var participantLabel: UILabel!
    @IBOutlet weak var participantsTableView: UITableView!
    
    func bidPageinit() {
        participantsTableView.delegate = self
        participantsTableView.dataSource = self
        participantsTableView.separatorStyle = .none
        
        let participantNib = UINib(nibName: "ParticipantsTableViewCell", bundle: nil)
        participantsTableView.register(participantNib, forCellReuseIdentifier: "ParticipantsTableViewCell")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension BidPageTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ParticipantsTableViewCell", for: indexPath) as? ParticipantsTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
