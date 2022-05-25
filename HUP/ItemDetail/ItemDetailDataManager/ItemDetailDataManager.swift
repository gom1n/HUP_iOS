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
    // MARK: get item detail view
    func itemDetailDataManager(_ itemId : Int, _ viewController : ItemDetailViewController) {
        AF.request("http://www.hurryuphup.me/api/v1/items/\(itemId)",
                   method: .get,
                   parameters: nil,
                   headers: headers)
            .validate()
            .responseDecodable(of: ItemDetailModel.self) { response in
                
            switch response.result {
            case .success(let result):
                viewController.itemDetailSuccessAPI(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    // MARK: get item detail on bid page
    func itemDetailDataManager(_ itemId : Int, _ viewController : BidPageViewController) {
        AF.request("http://www.hurryuphup.me/api/v1/items/\(itemId)",
                   method: .get,
                   parameters: nil,
                   headers: headers)
            .validate()
            .responseDecodable(of: ItemDetailModel.self) { response in
                
            switch response.result {
            case .success(let result):
                viewController.bidPageSuccessAPI(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    // MARK: get seller info on itemDetail page
    func getSellerInfoDataManager(_ userId : Int, _ viewController : ItemDetailContentTableViewCell) {
        AF.request("http://www.hurryuphup.me/api/v1/users/\(userId)",
                   method: .get,
                   parameters: nil,
                   headers: headers)
            .validate()
            .responseDecodable(of: MyInfoModel.self) { response in
                
            switch response.result {
            case .success(let result):
                viewController.sellerInfoSuccessAPI(result)
            case .failure(let error):
                print("myinfo fail")
                print(error.localizedDescription)
            }
        }
    }
}
