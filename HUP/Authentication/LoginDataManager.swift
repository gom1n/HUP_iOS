//
//  LoginDataManager.swift
//  HUP
//
//  Created by gomin on 2022/05/20.
//

import Alamofire
import Kingfisher
import UIKit

class LoginDataManager {
    // GOOGLE LOGIN
    func googleLoginDataManager(_ parameter : GoogleLoginInput) {
        AF.request("http://www.hurryuphup.me/api/v1/users/google-login",
                   method: .post,
                   parameters: parameter,
                   encoder: JSONParameterEncoder.default,
                   headers: nil)
            .validate()
            .responseDecodable(of: GoogleLoginModel.self) { response in
                
            switch response.result {
            case .success(let result):
                print("gLogin: ", result)
//                tableViewCell.bestItemSuccessAPI(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}