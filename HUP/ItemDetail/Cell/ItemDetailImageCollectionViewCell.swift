//
//  ItemDetailImageCollectionViewCell.swift
//  HUP
//
//  Created by gomin on 2022/05/15.
//

import UIKit

class ItemDetailImageCollectionViewCell: UICollectionViewCell {
    static let identifier = "ItemDetailImageCollectionViewCell"
    @IBOutlet weak var itemImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    public func setUpData(_ imgStr: String?) {
        let imgBaseURL = "https://hup-bucket.s3.ap-northeast-2.amazonaws.com/"
        
        guard let imgUrlStr =  imgStr else {return}
        if let url = URL(string: imgBaseURL + imgUrlStr) {
            itemImageView.kf.setImage(with: url, placeholder: UIImage(named: "hupicon"))
        }
    }
}
