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
    @IBOutlet weak var uploadButton: UIBarButtonItem!
    
    let imagePickerController = UIImagePickerController()
    
    var userId: Int = UserDefaults.standard.integer(forKey: "userId")
    var itemContent: UploadContent?
    var itemName: String = ""
    var itemCategory: String = ""
    var itemPrice: Int = 0
    var itemDescription: String = ""
    var itemStatus: Int = 0
    var buyDate: String = ""
    var endDateTime: String = ""
    
    var selectedPhoto: [UIImage] = []
    var selectedPhotoUrl: [URL] = []
    var cateStr = "카테고리 선택"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        uploadTableView.delegate = self
        uploadTableView.dataSource = self
        imagePickerController.delegate = self
        
        let uploadPhotoNib = UINib(nibName: "UploadPhotoTableViewCell", bundle: nil)
        uploadTableView.register(uploadPhotoNib, forCellReuseIdentifier: "UploadPhotoTableViewCell")
        let uploadContentNib = UINib(nibName: "UploadContentTableViewCell", bundle: nil)
        uploadTableView.register(uploadContentNib, forCellReuseIdentifier: "UploadContentTableViewCell")
        
        uploadButton.isEnabled = (userId == -1) ? false : true
    }
    // MARK: - Actions: button tap
    @IBAction func uploadButtonTap(_ sender: UIButton) {
        let uploadInput = UploadInput(auctionClosingDate: self.endDateTime, buyDate: self.buyDate, category: self.itemCategory, description: self.itemDescription, files: self.selectedPhotoUrl, initPrice: self.itemPrice, itemName: self.itemName, itemStatePoint: self.itemStatus, userId: self.userId)
        UploadDataManager().uploadNewItem(with: uploadInput, self) { result in
            
//            switch result {
//            case .success(let msg):
//                print("success", msg)
//            case .requestErr(let msg):
//                print("requestERR", msg)
//            case .pathErr:
//                print("pathERR")
//            case .serverErr:
//                print("serverERR")
//            case .networkFail:
//                print("networkFail")
//            }
        }
//        UploadDataManager().uploadDataManager(uploadInput, self)
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
        self.itemPrice = (text=="") ? 0 : Int(text)!
    }
    @objc func buyDatePickerHandle(_ sender: UIDatePicker) {
        let date = sender.date
        let buyDateStr = date.toString()
        let localDate = buyDateStr.replacingOccurrences(of: " ", with: "T")
        self.buyDate = localDate
//        print("buyDate: ", self.buyDate)
    }
    @objc func endDateTimePickerHandle(_ sender: UIDatePicker) {
        let date = sender.date
        let endDateStr = date.toString()
        let localDate = endDateStr.replacingOccurrences(of: " ", with: "T")
        self.endDateTime = localDate
//        print("endDateTime: ", self.endDateTime)
    }
    @objc func selectPhotoButtonTap(_ sender: Any) {
        self.imagePickerController.sourceType = .photoLibrary
        self.present(imagePickerController, animated: true, completion: nil)
    }
    @objc func itemCategoryChooseTap(_ sender: UIButton) {
        self.cateStr = makeAlertDialog()
        print(self.cateStr)
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
            cell.photoCountLabel.text = String(self.selectedPhoto.count) + " / 10"
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
            cell.itemCategoryText.addTarget(self, action: #selector(itemCategoryChooseTap(_:)), for: .touchUpInside)
            cell.itemCategoryText.setTitle(self.cateStr, for: .normal)
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
            return selectedPhoto.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UploadPhotoCollectionViewCell", for: indexPath) as? UploadPhotoCollectionViewCell else {
                return UICollectionViewCell()
            }
            let index = indexPath.item
            cell.setUpPhoto(self.selectedPhoto[index])
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
        selectedPhoto.removeAll()
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.selectedPhoto.append(image)
            print("count: ", self.selectedPhoto.count)
//            print(info)
        }
        if let imageUrl = info[UIImagePickerController.InfoKey.imageURL] as? URL{
            let urlStr = imageUrl.absoluteString
            self.selectedPhotoUrl.append(imageUrl)
            print(urlStr)
        }
        uploadTableView.reloadData()
        self.dismiss(animated: true, completion: nil)
    }
}
// MARK: -  alert sheet dialog - choose category
extension UploadViewController {
    func makeAlertDialog() -> String {
        let actionsheetController = UIAlertController(title: "카테고리 선택", message: "제품의 카테고리를 선택하세요.", preferredStyle: .actionSheet)

        let LIST_MENU: [String] = ["디지털 기기", "생활가전", "가구/인테리어", "유아동", "생활/가공식품"
                    ,"유아도서", "스포츠/레저", "여성잡화", "여성의류", "남성패션/잡화", "게임/취미", "뷰티/미용",
                    "반려동물용품", "도서/티켓/음반", "식물"]

        // UIAlertAction 설정
        // handler : 액션 발생시 호출
        let eDigital = UIAlertAction(title: LIST_MENU[0], style: .default) { action in
            self.cateStr = LIST_MENU[0]
            self.uploadTableView.reloadData()
        }
        let eHouseHoldAppliance = UIAlertAction(title: LIST_MENU[1], style: .default) { action in self.cateStr = LIST_MENU[1];self.uploadTableView.reloadData()}
        let eFurnitureAndInterior = UIAlertAction(title: LIST_MENU[2], style: .default) { action in self.cateStr = LIST_MENU[2];self.uploadTableView.reloadData()}
        let eChildren = UIAlertAction(title: LIST_MENU[3], style: .default) { action in self.cateStr = LIST_MENU[3];self.uploadTableView.reloadData()}
        let eDailyLifeAndProcessedFood = UIAlertAction(title: LIST_MENU[4], style: .default) { action in self.cateStr = LIST_MENU[4];self.uploadTableView.reloadData()}
        let eChildrenBooks = UIAlertAction(title: LIST_MENU[5], style: .default) { action in self.cateStr = LIST_MENU[5];self.uploadTableView.reloadData()}
        let eSportsAndLeisure = UIAlertAction(title: LIST_MENU[6], style: .default) { action in self.cateStr = LIST_MENU[6];self.uploadTableView.reloadData()}
        let eMerchandiseForWoman = UIAlertAction(title: LIST_MENU[7], style: .default) { action in self.cateStr = LIST_MENU[7];self.uploadTableView.reloadData()}
        let eWomenClothing = UIAlertAction(title: LIST_MENU[8], style: .default) { action in self.cateStr = LIST_MENU[8];self.uploadTableView.reloadData()}
        let eManFashionAndMerchandise = UIAlertAction(title: LIST_MENU[9], style: .default) { action in self.cateStr = LIST_MENU[9];self.uploadTableView.reloadData()}
        let eGameAndHabit = UIAlertAction(title: LIST_MENU[10], style: .default) { action in self.cateStr = LIST_MENU[10];self.uploadTableView.reloadData()}
        let eBeauty = UIAlertAction(title: LIST_MENU[11], style: .default) { action in self.cateStr = LIST_MENU[11];self.uploadTableView.reloadData()}
        let ePetProducts = UIAlertAction(title: LIST_MENU[12], style: .default) { action in self.cateStr = LIST_MENU[12];self.uploadTableView.reloadData()}
        let eBookTicketAlbum = UIAlertAction(title: LIST_MENU[13], style: .default) { action in self.cateStr = LIST_MENU[13];self.uploadTableView.reloadData()}
        let ePlant = UIAlertAction(title: LIST_MENU[14], style: .default) { action in self.cateStr = LIST_MENU[14];self.uploadTableView.reloadData()}

        // **cancel 액션은 한개만 됩니닷 !!
        let actionCancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)

        actionsheetController.addAction(eDigital)
        actionsheetController.addAction(eHouseHoldAppliance)
        actionsheetController.addAction(eFurnitureAndInterior)
        actionsheetController.addAction(eChildren)
        actionsheetController.addAction(eDailyLifeAndProcessedFood)
        actionsheetController.addAction(eChildrenBooks)
        actionsheetController.addAction(eSportsAndLeisure)
        actionsheetController.addAction(eMerchandiseForWoman)
        actionsheetController.addAction(eWomenClothing)
        actionsheetController.addAction(eManFashionAndMerchandise)
        actionsheetController.addAction(eGameAndHabit)
        actionsheetController.addAction(eBeauty)
        actionsheetController.addAction(ePetProducts)
        actionsheetController.addAction(eBookTicketAlbum)
        actionsheetController.addAction(ePlant)
        actionsheetController.addAction(actionCancel)
        
        // 화면에 출력
        self.present(actionsheetController, animated: true, completion: nil)
        
        return cateStr
    }
}
extension UploadViewController {
    func uploadSuccessAPI() {
        self.dismiss(animated: true, completion: nil)
    }
}
