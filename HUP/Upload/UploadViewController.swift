//
//  UploadViewController.swift
//  HUP
//
//  Created by gomin on 2022/05/13.
//

import UIKit
import CoreMIDI

class UploadViewController: UIViewController {
    @IBOutlet weak var uploadTableView: UITableView!
    
    let imagePickerController = UIImagePickerController()
    
    var itemContent: UploadContent?
    var itemName: String = ""
    var itemCategory: String = ""
    var itemPrice: Int = 0
    var itemDescription: String = ""
    var itemStatus: Int = 0
    var buyDate: String = ""
    var endDateTime: String = ""
    var selectedPhoto: [UIImage]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        uploadTableView.delegate = self
        uploadTableView.dataSource = self
        imagePickerController.delegate = self
        
        let uploadPhotoNib = UINib(nibName: "UploadPhotoTableViewCell", bundle: nil)
        uploadTableView.register(uploadPhotoNib, forCellReuseIdentifier: "UploadPhotoTableViewCell")
        let uploadContentNib = UINib(nibName: "UploadContentTableViewCell", bundle: nil)
        uploadTableView.register(uploadContentNib, forCellReuseIdentifier: "UploadContentTableViewCell")
    }
    // MARK: - Actions: button tap
    @IBAction func uploadButtonTap(_ sender: UIButton) {
        //        let uploadInput = UploadInput(auctionClosingDate: <#T##String?#>, buyDate: <#T##String?#>, category: <#T##String?#>, description: <#T##String?#>, files: <#T##[String]?#>, initPrice: <#T##String?#>, itemName: <#T##String?#>, itemStatePoint: <#T##String?#>, userId: <#T##String?#>)
    }
    @IBAction func dismissButtonTap(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    // MARK: - Actions: add target
    @objc func itemNameTextEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.itemName = text
    }
    @objc func itemCategoryTextEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.itemCategory = text
    }
    @objc func itemPriceTextEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.itemPrice = Int(text)!
    }
    @objc func buyDatePickerHandle(_ sender: UIDatePicker) {
        let date = sender.date
        self.buyDate = date.toString()
//        print("buyDate: ", self.buyDate)
    }
    @objc func endDateTimePickerHandle(_ sender: UIDatePicker) {
        let date = sender.date
        self.endDateTime = date.toString()
//        print("endDateTime: ", self.endDateTime)
    }
    @objc func selectPhotoButtonTap(_ sender: Any) {
        self.imagePickerController.sourceType = .photoLibrary
        self.present(imagePickerController, animated: true, completion: nil)
    }
}
// MARK: - tableView (itemContent) delegate
extension UploadViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UploadPhotoTableViewCell", for: indexPath) as? UploadPhotoTableViewCell else {
                return UITableViewCell()
            }
            cell.selectPhotoButton.addTarget(self, action: #selector(selectPhotoButtonTap(_:)), for: .touchUpInside)
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UploadContentTableViewCell", for: indexPath) as? UploadContentTableViewCell else {
                return UITableViewCell()
            }
            cell.itemNameText.addTarget(self, action: #selector(itemNameTextEditingChanged(_:)), for: .editingChanged)
            cell.itemCategoryText.addTarget(self, action: #selector(itemCategoryTextEditingChanged(_:)), for: .editingChanged)
            cell.itemPriceText.addTarget(self, action: #selector(itemPriceTextEditingChanged(_:)), for: .editingChanged)
            self.itemStatus = Int(cell.itemStatusView.rating)
            cell.buyDatePicker.addTarget(self, action: #selector(buyDatePickerHandle(_:)), for: .valueChanged)
            cell.endDateTimePicker.addTarget(self, action: #selector(endDateTimePickerHandle(_:)), for: .valueChanged)
//            cell.itemDescriptionText.addTarget(self, action: #selector(itemDescriptionTextEditingChanged(_:)), for: .editingChanged)
            
            cell.selectionStyle = .none
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // 수정필요
        if indexPath.row == 0 {return 150}
        else {return 850}
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? UploadPhotoTableViewCell else {
            return
        }
        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
    }
}
// MARK: - collectionView(selected Imgs) delegate
extension UploadViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return selectedPhoto?.count ?? 0
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UploadPhotoCollectionViewCell", for: indexPath) as? UploadPhotoCollectionViewCell else {
                return UICollectionViewCell()
            }
            let index = indexPath.item
            if let photoArray = self.selectedPhoto {
                cell.setUpPhoto(photoArray[index])
            }
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 120, height: 120)
        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    func collectionView(
          _ collectionView: UICollectionView,
          layout collectionViewLayout: UICollectionViewLayout,
          minimumInteritemSpacingForSectionAt section: Int
          ) -> CGFloat {
              return 15
          }
}
// MARK: - finish selecting photo
extension UploadViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.selectedPhoto?.append((image) as (UIImage))
            print("count: ", self.selectedPhoto?.count ?? 0)
            print(info)
            
        }
        self.dismiss(animated: true, completion: nil)
    }
}
