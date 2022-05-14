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
    }
    
    @IBAction func actionIsHeart(_ sender: UIButton) {
        if heartButton.isSelected {
            heartButton.isSelected = false
        } else {
            heartButton.isSelected = true
        }
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
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemDetailContentTableViewCell", for: indexPath) as? ItemDetailContentTableViewCell else {
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
        guard let itemDetailImageTableViewCell = cell as? ItemDetailImageTableViewCell else {
            return
        }
        itemDetailImageTableViewCell.setCollectionViewDataSourceDelegate(forRow: indexPath.row)
        
    }
}
