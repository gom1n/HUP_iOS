//
//  RegisterEmailDataManager.swift
//  HUP
//
//  Created by gomin on 2022/05/26.
//

import Alamofire
import Kingfisher

class EmailDataManager {
    func registerEmailDataManager(_ parameter: RegisterEmailInput, _ viewController : RegisterViewController) {
        AF.request("http://www.hurryuphup.me/api/v1/email/send/activate-user",
                   method: .post,
                   parameters: parameter,
                   encoder: JSONParameterEncoder.default,
                   headers: nil)
            .validate()
            .responseDecodable(of: RegisterEmailModel.self) { response in
                
            switch response.result {
            case .success(let result):
                viewController.registerEmailSuccessAPI(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
