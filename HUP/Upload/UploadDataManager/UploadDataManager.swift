//
//  UploadDataManager.swift
//  HUP
//
//  Created by gomin on 2022/05/27.
//

import Alamofire
import Kingfisher

class UploadDataManager {
    let headers = APIManager().getHeader()
    func uploadDataManager(_ parameter: UploadInput, _ viewController : UploadViewController) {
        AF.request("http://www.hurryuphup.me/api/v1/items",
                   method: .post,
                   parameters: parameter,
                   encoder: JSONParameterEncoder.default,
                   headers: headers)
            .validate()
            .responseDecodable(of: UploadModel.self) { response in
                
            switch response.result {
            case .success(let result):
                print("upload success: ", result)
//                viewController.registerEmailSuccessAPI(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
