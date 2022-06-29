//
//  ChatRoomViewController.swift
//  HUP
//
//  Created by gomin on 2022/05/23.
//

import UIKit

class ChatViewController: UIViewController {
    @IBOutlet weak var chatUserTextView: UINavigationItem!
    @IBOutlet weak var editTextField: UITextField!
    @IBOutlet weak var ChatTableView: UITableView!
    @IBOutlet weak var bottomView: UIView!
    
    var userId: Int?
    override func viewDidLoad() {
        super.viewDidLoad()

        bottomView.layer.shadowColor = UIColor.lightGray.cgColor
        bottomView.layer.shadowOffset = CGSize(width: 0, height: -5)
        bottomView.layer.shadowOpacity = 0.2
        ChatTableView.separatorStyle = .none
        
        ChatTableView.delegate = self
        ChatTableView.dataSource = self
        
        let mychatNib = UINib(nibName: "MyChatTableViewCell", bundle: nil)
        ChatTableView.register(mychatNib, forCellReuseIdentifier: "MyChatTableViewCell")
        let otherchatNib = UINib(nibName: "OtherChatTableViewCell", bundle: nil)
        ChatTableView.register(otherchatNib, forCellReuseIdentifier: "OtherChatTableViewCell")
        
        self.userId = UserDefaults.standard.integer(forKey: "userId")
    }
    
    @IBAction func sendButtonTap(_ sender: UIButton) {
    }
    
    @IBAction func backButtonTap(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyChatTableViewCell", for: indexPath) as? BestItemTableViewCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "OtherChatTableViewCell", for: indexPath) as? AuctionNowTableViewCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        guard let bidPageTableViewCell = cell as? BidPageTableViewCell else {
//            return
//        }
//        bidPageTableViewCell.bidPageinit()
//    }
}
//extension BidPageViewController {
//    func bidPageSuccessAPI(_ result: ItemDetailModel) {
//        self.itemData = result
//        self.bidPageTableView.reloadData()
//    }
//}
