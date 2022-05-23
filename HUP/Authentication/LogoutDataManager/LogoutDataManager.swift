//
//  LogoutDataManager.swift
//  HUP
//
//  Created by gomin on 2022/05/23.
//
import Alamofire

class LogoutDataManager {
    let headers = APIManager().getHeader()
    func logoutDataManager(_ parameter: LogoutInput, _ viewController : MyPageViewController) {
        AF.request("http://www.hurryuphup.me/api/v1/users/logout",
                   method: .post,
                   parameters: parameter,
                   encoder: JSONParameterEncoder.default,
                   headers: headers)
            .validate()
            .responseDecodable(of: LogoutModel.self) { response in
                
            switch response.result {
            case .success(let result):
                print("logout success", result)
                viewController.logoutSuccessAPI(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
