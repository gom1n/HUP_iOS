//
//  ItemListDataManager.swift
//  HUP
//
//  Created by gomin on 2022/05/20.
//

import Alamofire
import Kingfisher

class ItemListDataManager {
    func itemListDataManager(_ itemSoldStatus: String, _ viewController : ItemListViewController) {
        AF.request("http://www.hurryuphup.me/api/v1/items/statuses/\(itemSoldStatus)",
                   method: .get,
                   parameters: nil)
            .validate()
            .responseDecodable(of: ItemListModel.self) { response in
                
            switch response.result {
            case .success(let result):
//                print("DEBUG: ", result)
                viewController.successAPI(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
