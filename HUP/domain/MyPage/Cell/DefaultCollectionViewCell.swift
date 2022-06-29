//
//  DefaultCollectionViewCell.swift
//  HUP
//
//  Created by gomin on 2022/05/20.
//

import UIKit

class DefaultCollectionViewCell: UICollectionViewCell {
    static let identifier = "DefaultCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func goLoginButtonTap(_ sender: UIButton) {
        let mypage = MyPageViewController()
        mypage.goLogin()
    }
}
