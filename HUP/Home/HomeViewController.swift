//
//  HomeViewController.swift
//  HUP
//
//  Created by gomin on 2022/05/06.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var HomeTableView: UITableView!
    
    var auctionNowArray : [AuctionNowData]?
    var cellItemId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        HomeTableView.delegate = self
        HomeTableView.dataSource = self
        
        HomeTableView.separatorStyle = .none
        
        let auctionNowNib = UINib(nibName: "AuctionNowTableViewCell", bundle: nil)
        HomeTableView.register(auctionNowNib, forCellReuseIdentifier: "AuctionNowTableViewCell")
        let bestItemNib = UINib(nibName: "BestItemTableViewCell", bundle: nil)
        HomeTableView.register(bestItemNib, forCellReuseIdentifier: "BestItemTableViewCell")
        
        //DATA
        AuctionNowDataManager().auctionNowDataManager("eOnGoing", self)
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
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {return 300}
        else {return 600}
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
            auctionNowTableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
        }
    }
}
extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = auctionNowArray?.count ?? 0
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AuctionNowCollectionViewCell", for: indexPath) as? AuctionNowCollectionViewCell else {
            return UICollectionViewCell()
        }
        let itemIdx = indexPath.item
        if let cellData = self.auctionNowArray {
            // if data exists
            self.cellItemId = cellData[itemIdx].id
            cell.setUpData(cellData[itemIdx])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 250)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let itemDetailViewController = self.storyboard?
                .instantiateViewController(withIdentifier: "ItemDetailVC")
                as? ItemDetailViewController else {return}
        itemDetailViewController.itemId = cellItemId  //itemId
        itemDetailViewController.modalPresentationStyle = .fullScreen
        self.present(itemDetailViewController, animated: true, completion: nil)
    }
}
extension HomeViewController {
    func auctionNowSuccessAPI(_ result : AuctionNowModel) {
        self.auctionNowArray = result.data
        HomeTableView.reloadData()
    }
}
