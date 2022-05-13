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
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.row == 0 {
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: "BestItemTableViewCell", for: indexPath) as? BestItemTableViewCell else {
//                return UITableViewCell()
//            }
//            return cell
//        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AuctionNowTableViewCell", for: indexPath) as? AuctionNowTableViewCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
//        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // 수정필요
//        if indexPath.row == 0 {return 300}
//        else {return 600}
        return 600
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? AuctionNowTableViewCell else {
            return
        }
        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
    }
}

extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 10
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AuctionNowCollectionViewCell", for: indexPath) as? AuctionNowCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 180, height: 250)
        }
}
