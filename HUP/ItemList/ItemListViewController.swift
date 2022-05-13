//
//  ItemListViewController.swift
//  HUP
//
//  Created by gomin on 2022/05/11.
//

import UIKit

class ItemListViewController: UIViewController {
    @IBOutlet weak var itemListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        itemListTableView.delegate = self
        itemListTableView.dataSource = self
        
        let itemNib = UINib(nibName: "ItemListTableViewCell", bundle: nil)
        itemListTableView.register(itemNib, forCellReuseIdentifier: "ItemListTableViewCell")
    }
    
}

extension ItemListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemListTableViewCell", for: indexPath) as? ItemListTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // 수정필요
        return 170
    }
}
