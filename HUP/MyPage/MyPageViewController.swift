//
//  MyPageViewController.swift
//  HUP
//
//  Created by gomin on 2022/05/11.
//

import UIKit

class MyPageViewController: UIViewController {
    @IBOutlet weak var mypageTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mypageTableView.delegate = self
        mypageTableView.dataSource = self
        
        let mypageNib = UINib(nibName: "MyPageTableViewCell", bundle: nil)
        mypageTableView.register(mypageNib, forCellReuseIdentifier: "MyPageTableViewCell")
        
        mypageTableView.separatorStyle = .none
    }
}

extension MyPageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyPageTableViewCell", for: indexPath) as? MyPageTableViewCell else {
            return UITableViewCell()
        }
        switch indexPath.row {
        case 0:
            cell.iconImageView.image = UIImage(named:"heartx")
            cell.contentLabel.text = "스크랩 내역"
        case 1:
            cell.iconImageView.image = UIImage(named:"interest")
            cell.contentLabel.text = "관심 카테고리"
        case 2:
            cell.iconImageView.image = UIImage(named:"notify")
            cell.contentLabel.text = "공지사항"
        case 3:
            cell.iconImageView.image = UIImage(named:"safety")
            cell.contentLabel.text = "안전거래설정"
        default:
            cell.iconImageView.image = UIImage(named: "category_white")
        }
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        guard let tableViewCell = cell as? ChattingRoomTableViewCell else {
//            return
//        }
//        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
    }
}
