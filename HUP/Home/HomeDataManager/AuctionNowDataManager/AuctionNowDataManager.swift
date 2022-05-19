//
//  AuctionNowDataManager.swift
//  HUP
//
//  Created by gomin on 2022/05/19.
//

import Alamofire
import Kingfisher

class AuctionNowDataManager {
    func auctionNowDataManager(_ itemSoldStatus: String, _ viewController : HomeViewController) {
        AF.request("http://www.hurryuphup.me/api/v1/items/statuses/\(itemSoldStatus)",
                   method: .get,
                   parameters: nil)
            .validate()
            .responseDecodable(of: AuctionNowModel.self) { response in
                
            switch response.result {
            case .success(let result):
//                print("DEBUG: ", result)
                viewController.auctionNowSuccessAPI(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
