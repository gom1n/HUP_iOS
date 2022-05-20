//
//  DefaultTableViewCell.swift
//  HUP
//
//  Created by gomin on 2022/05/20.
//

import UIKit

class DefaultTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func goLoginButtonTap(_ sender: UIButton) {
        let mypage = MyPageViewController()
        mypage.goLogin()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
