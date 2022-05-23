//
//  ChannelDataManager.swift
//  HUP
//
//  Created by gomin on 2022/05/23.
//

import Foundation
import Alamofire
import Kingfisher

class ChannelDataManager {
    let headers = APIManager().getHeader()
    let userId = UserDefaults.standard.integer(forKey: "userId")
    func channelDataManager(_ viewController : ChannelViewController) {
        AF.request("http://www.hurryuphup.me/api/v1/chatRooms/\(userId)",
                   method: .get,
                   parameters: nil,
                   headers: headers)
            .validate()
            .responseDecodable(of: [ChannelModel].self) { response in
                
            switch response.result {
            case .success(let result):
//                print("get channels success", result)
                viewController.channelSuccessAPI(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
