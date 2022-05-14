//
//  HomeViewController.swift
//  HUP
//
//  Created by gomin on 2022/05/06.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var HomeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        HomeTableView.delegate = self
        HomeTableView.dataSource = self
        
        let auctionNowNib = UINib(nibName: "AuctionNowTableViewCell", bundle: nil)
        HomeTableView.register(auctionNowNib, forCellReuseIdentifier: "AuctionNowTableViewCell")
        let bestItemNib = UINib(nibName: "BestItemTableViewCell", bundle: nil)
        HomeTableView.register(bestItemNib, forCellReuseIdentifier: "BestItemTableViewCell")
    }

}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "BestItemTableViewCell", for: indexPath) as? BestItemTableViewCell else {
                return UITableViewCell()
            }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AuctionNowTableViewCell", for: indexPath) as? AuctionNowTableViewCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // 수정필요
        if indexPath.row == 0 {return 300}
        else {return 600}
//        return 600
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            guard let bestItemTableViewCell = cell as? BestItemTableViewCell else {
                return
            }
            bestItemTableViewCell.setCollectionViewDataSourceDelegate(forRow: indexPath.row)
        } else {
            guard let auctionNowTableViewCell = cell as? AuctionNowTableViewCell else {
                return
            }
            auctionNowTableViewCell.setCollectionViewDataSourceDelegate(forRow: indexPath.row)
        }
    }
}
