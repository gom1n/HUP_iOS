//
//  ItemDetailViewController.swift
//  HUP
//
//  Created by gomin on 2022/05/14.
//

import UIKit

class ItemDetailViewController: UIViewController {
    @IBOutlet weak var ItemDetailTableView: UITableView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var participateButton: UIButton!
    
    var itemId: Int?
    var itemDetailData: ItemDetailModel? = nil {
        didSet {
            ItemDetailTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bottomView.layer.shadowColor = UIColor.lightGray.cgColor
        bottomView.layer.shadowOffset = CGSize(width: 0, height: -5)
        bottomView.layer.shadowOpacity = 0.2
        ItemDetailTableView.separatorStyle = .none
        
        ItemDetailTableView.delegate = self
        ItemDetailTableView.dataSource = self
        
        let contentNib = UINib(nibName: "ItemDetailContentTableViewCell", bundle: nil)
        ItemDetailTableView.register(contentNib, forCellReuseIdentifier: "ItemDetailContentTableViewCell")
        let imageNib = UINib(nibName: "ItemDetailImageTableViewCell", bundle: nil)
        ItemDetailTableView.register(imageNib, forCellReuseIdentifier: "ItemDetailImageTableViewCell")
        
        // DATA
        guard let itemId = self.itemId else {return}
        ItemDetailDataManager().itemDetailDataManager(itemId, self)
    }
    
    @IBAction func actionIsHeart(_ sender: UIButton) {
        if heartButton.isSelected {
            heartButton.isSelected = false
        } else {
            heartButton.isSelected = true
        }
    }
    @IBAction func participateButtonDidTap(_ sender: UIButton) {
        guard let bidPageViewController = self.storyboard?
                .instantiateViewController(withIdentifier: "BidPageVC")
                as? BidPageViewController else {return}
        bidPageViewController.itemId = self.itemId  //itemId 넘기기
        bidPageViewController.modalPresentationStyle = .fullScreen
        self.present(bidPageViewController, animated: true, completion: nil)
    }
    
    @IBAction func backButtonTap(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
extension ItemDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemDetailImageTableViewCell", for: indexPath) as? ItemDetailImageTableViewCell else {
                return UITableViewCell()
            }
            // if data exists
            if let cellData = itemDetailData {
                cell.itemImgArray = cellData.fileNames
                
                // left time set
                let endTime = cellData.auctionClosingDate!
                let timeDif = GetTime().getTimeDif(Date(), endTime)
                cell.leftTimeLabel.text = timeDif
            }
            cell.selectionStyle = .none
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemDetailContentTableViewCell", for: indexPath) as? ItemDetailContentTableViewCell else {
                return UITableViewCell()
            }
            // if data exists
            if let cellData = itemDetailData {
                cell.setUpData(cellData)
                cell.itemId = self.itemId
            }
            cell.selectionStyle = .none
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {return 300}
        else {return 600}
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let itemDetailImageTableViewCell = cell as? ItemDetailImageTableViewCell else {
            return
        }
        itemDetailImageTableViewCell.setCollectionViewDataSourceDelegate(forRow: indexPath.row)
    }
}
extension ItemDetailViewController {
    func itemDetailSuccessAPI(_ result: ItemDetailModel) {
        self.itemDetailData = result
        self.ItemDetailTableView.reloadData()
    }
}
