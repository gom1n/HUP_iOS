//
//  ItemDetailDataManager.swift
//  HUP
//
//  Created by gomin on 2022/05/20.
//

import Foundation
import Alamofire
import Kingfisher

class ItemDetailDataManager {
    let headers = APIManager().getHeader()
    func itemDetailDataManager(_ itemId : Int, _ viewController : ItemDetailViewController) {
        AF.request("http://www.hurryuphup.me/api/v1/items/\(itemId)",
                   method: .get,
                   parameters: nil,
                   headers: headers)
            .validate()
            .responseDecodable(of: ItemDetailModel.self) { response in
                
            switch response.result {
            case .success(let result):
//                print("itemdetail success", result)
                viewController.itemDetailSuccessAPI(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    func itemDetailDataManager(_ itemId : Int, _ viewController : BidPageViewController) {
        AF.request("http://www.hurryuphup.me/api/v1/items/\(itemId)",
                   method: .get,
                   parameters: nil,
                   headers: headers)
            .validate()
            .responseDecodable(of: ItemDetailModel.self) { response in
                
            switch response.result {
            case .success(let result):
//                print("itemdetail success", result)
                viewController.bidPageSuccessAPI(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
