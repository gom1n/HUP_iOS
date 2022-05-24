//
//  RegisterDataManager.swift
//  HUP
//
//  Created by gomin on 2022/05/24.
//
import Alamofire
import Kingfisher

class RegisterDataManager {
    func registerDataManager(_ parameter: RegisterInput, _ viewController : RegisterViewController) {
        AF.request("http://www.hurryuphup.me/api/v1/users",
                   method: .post,
                   parameters: parameter,
                   encoder: JSONParameterEncoder.default,
                   headers: nil)
            .validate()
            .responseDecodable(of: RegisterModel.self) { response in
                
            switch response.result {
            case .success(let result):
                viewController.registerSuccessAPI(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    func idCheckDataManager(_ loginId: String, _ viewController : RegisterViewController) {
        AF.request("http://www.hurryuphup.me/api/v1/users/check/\(loginId)",
                   method: .get,
                   parameters: nil,
                   headers: nil)
            .validate()
            .responseDecodable(of: IdCheckModel.self) { response in
                
            switch response.result {
            case .success(let result):
                viewController.idCheckSuccessAPI(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
