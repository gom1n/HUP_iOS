//
//  BidPageViewController.swift
//  HUP
//
//  Created by gomin on 2022/05/16.
//

import UIKit

class BidPageViewController: UIViewController {
    @IBOutlet weak var bidPageTableView: UITableView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var editPrice: UITextField!
    @IBOutlet weak var bidButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bottomView.layer.shadowColor = UIColor.lightGray.cgColor
        bottomView.layer.shadowOffset = CGSize(width: 0, height: -5)
        bottomView.layer.shadowOpacity = 0.2
        bidPageTableView.separatorStyle = .none
        
        bidPageTableView.delegate = self
        bidPageTableView.dataSource = self
        
        let contentNib = UINib(nibName: "BidPageTableViewCell", bundle: nil)
        bidPageTableView.register(contentNib, forCellReuseIdentifier: "BidPageTableViewCell")
    }
}

extension BidPageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BidPageTableViewCell", for: indexPath) as? BidPageTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 800
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let bidPageTableViewCell = cell as? BidPageTableViewCell else {
            return
        }
        bidPageTableViewCell.bidPageinit()
        
    }
}
