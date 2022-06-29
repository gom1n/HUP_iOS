//
//  ItemListViewController.swift
//  HUP
//
//  Created by gomin on 2022/05/11.
//

import UIKit

class ItemListViewController: UIViewController {
    @IBOutlet weak var itemListTableView: UITableView!
    
    var itemListArray : [ItemListData]?
    var cellItemId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        itemListTableView.delegate = self
        itemListTableView.dataSource = self
        
        let itemNib = UINib(nibName: "ItemListTableViewCell", bundle: nil)
        itemListTableView.register(itemNib, forCellReuseIdentifier: "ItemListTableViewCell")
        
        //DATA
        ItemListDataManager().itemListDataManager("eOnGoing", self)
    }
    
}

extension ItemListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemListArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemListTableViewCell", for: indexPath) as? ItemListTableViewCell else {
            return UITableViewCell()
        }
        let itemIdx = indexPath.item
        if let cellData = self.itemListArray {
            // if data exists
            cell.setUpData(cellData[itemIdx])
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // 수정필요
        return 170
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if UIManager().isLogin() {
            let index = indexPath.item
            getItemId(index)
            
            guard let itemDetailViewController = self.storyboard?
                    .instantiateViewController(withIdentifier: "ItemDetailVC")
                    as? ItemDetailViewController else {return}
            itemDetailViewController.itemId = self.cellItemId  //itemId
            itemDetailViewController.modalPresentationStyle = .fullScreen
            self.present(itemDetailViewController, animated: true, completion: nil)
        } else {
            UIManager().showToast(message: "로그인 후 이용 가능합니다.", viewController: self)
        }
    }
}
extension ItemListViewController {
    func successAPI(_ result : ItemListModel) {
        self.itemListArray = result.data
        itemListTableView.reloadData()
    }
    func getItemId(_ index: Int) {
        if let cellData = self.itemListArray {
            // if data exists
            cellItemId = cellData[index].id
        }
    }
}
