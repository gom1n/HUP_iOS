//
//  ChattingViewController.swift
//  HUP
//
//  Created by gomin on 2022/05/11.
//

import UIKit

class ChannelViewController: UIViewController {
    @IBOutlet weak var chattingRoomTableView: UITableView!
    
    var channelArray: [ChannelModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        chattingRoomTableView.delegate = self
        chattingRoomTableView.dataSource = self
        
        let chatRoomNib = UINib(nibName: "ChattingRoomTableViewCell", bundle: nil)
        chattingRoomTableView.register(chatRoomNib, forCellReuseIdentifier: "ChattingRoomTableViewCell")
        let chatRoomAdverNib = UINib(nibName: "ChattingRoomAdverImageTableViewCell", bundle: nil)
        chattingRoomTableView.register(chatRoomAdverNib, forCellReuseIdentifier: "ChattingRoomAdverImageTableViewCell")
        
        //DATA
        ChannelDataManager().channelDataManager(self)
    }
}

extension ChannelViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return channelArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChattingRoomAdverImageTableViewCell", for: indexPath) as? ChattingRoomAdverImageTableViewCell else {
                return UITableViewCell()
            }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChattingRoomTableViewCell", for: indexPath) as? ChattingRoomTableViewCell else {
                return UITableViewCell()
            }
            let itemIdx = indexPath.item
            if let cellData = self.channelArray {
                // if data exists
                cell.setUpData(cellData[itemIdx])
            }
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 { return 110}
        else { return 135 }
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        guard let tableViewCell = cell as? ChattingRoomTableViewCell else {
//            return
//        }
//        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
    }
}
extension ChannelViewController {
    func channelSuccessAPI(_ result: [ChannelModel]) {
        self.channelArray = result
    }
}
