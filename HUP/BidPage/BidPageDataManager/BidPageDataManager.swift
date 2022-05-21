//
//  BidPageDataManager.swift
//  HUP
//
//  Created by gomin on 2022/05/22.
//
import Alamofire
import Kingfisher

class BidPageDataManager {
    let headers = APIManager().getHeader()
    func participantDataManager(_ itemId : Int, _ viewController : BidPageTableViewCell) {
        AF.request("http://www.hurryuphup.me/api/v1/priceSuggestions/\(itemId)",
                   method: .get,
                   parameters: nil,
                   headers: headers)
            .validate()
            .responseDecodable(of: BidPageModel.self) { response in
                
            switch response.result {
            case .success(let result):
//                print("participant success", result)
                viewController.participantSuccessAPI(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
