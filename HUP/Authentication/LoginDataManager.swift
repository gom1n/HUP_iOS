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
    // APP LOGIN
    func appLoginDataManager(_ parameter : AppLoginInput, _ viewController : LoginViewController) {
        AF.request("http://www.hurryuphup.me/api/v1/users/login",
                   method: .post,
                   parameters: parameter,
                   encoder: JSONParameterEncoder.default,
                   headers: nil)
            .validate()
            .responseDecodable(of: AppLoginModel.self) { response in
                
            switch response.result {
            case .success(let result):
                print("appLogin success")
                print("accessToken: ", result.accessToken!)
                print("refreshToken: ", result.refreshToken!)
                
                //User Default에 유저 토큰 넣어주기
                UserDefaults.standard.set(result.accessToken!, forKey: "accessToken")
                UserDefaults.standard.set(result.refreshToken!, forKey: "refreshToken")
                
                viewController.goBack()
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
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
