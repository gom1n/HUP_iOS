//
//  UploadPhotoCollectionViewCell.swift
//  HUP
//
//  Created by gomin on 2022/05/13.
//

import UIKit

class UploadPhotoCollectionViewCell: UICollectionViewCell {
    static let identifier = "UploadPhotoCollectionViewCell"
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setUpPhoto(_ photo: UIImage) {
        photoImageView.image = photo
    }
}
