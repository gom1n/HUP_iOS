//
//  UploadViewController.swift
//  HUP
//
//  Created by gomin on 2022/05/13.
//

import UIKit

class UploadViewController: UIViewController {
    @IBOutlet weak var uploadTableView: UITableView!
    
    let imagePickerController = UIImagePickerController()
    
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
    
    @IBAction func uploadButtonTap(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func dismissButtonTap(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension UploadViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UploadPhotoTableViewCell", for: indexPath) as? UploadPhotoTableViewCell else {
                return UITableViewCell()
            }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UploadContentTableViewCell", for: indexPath) as? UploadContentTableViewCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // 수정필요
        if indexPath.row == 0 {return 150}
        else {return 700}
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? UploadPhotoTableViewCell else {
            return
        }
        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
    }
}

extension UploadViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 5
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UploadPhotoCollectionViewCell", for: indexPath) as? UploadPhotoCollectionViewCell else {
                return UICollectionViewCell()
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
extension UploadViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
//            let imageString = ""
//            let input = FeedUploadInput(content: "안녕하세요", postImgUrl: [imageString])
//            FeedUploadDataManager().posts(self, input)
            
            self.dismiss(animated: true, completion: nil)
        }
    }
