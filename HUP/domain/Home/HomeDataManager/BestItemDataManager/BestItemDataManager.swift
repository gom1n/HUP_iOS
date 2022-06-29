//
//  BestItemDataManager.swift
//  HUP
//
//  Created by gomin on 2022/05/20.
//

import Alamofire
import Kingfisher
import UIKit

class BestItemDataManager {
    func bestItemDataManager(_ itemSoldStatus: String, _ tableViewCell : BestItemTableViewCell) {
        AF.request("http://www.hurryuphup.me/api/v1/items/statuses/hearts/\(itemSoldStatus)",
                   method: .get,
                   parameters: nil)
            .validate()
            .responseDecodable(of: [BestItemModel].self) { response in
                
            switch response.result {
            case .success(let result):
//                print("DEBUG: ", result)
                tableViewCell.bestItemSuccessAPI(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
