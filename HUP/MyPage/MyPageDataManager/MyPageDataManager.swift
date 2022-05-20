//
//  MyPageDataManager.swift
//  HUP
//
//  Created by gomin on 2022/05/20.
//
import Alamofire
import Kingfisher

class MyPageDataManager {
    // 1)
    let token = UserDefaults.standard.string(forKey: "accessToken") ?? ""
    
    func myInfoDataManager(_ userId : Int, _ viewController : MyPageViewController) {
        let headers: HTTPHeaders = APIManager().getHeader()
        AF.request("http://www.hurryuphup.me/api/v1/users/\(userId)",
                   method: .get,
                   parameters: nil,
                   headers: headers)
            .validate()
            .responseDecodable(of: MyInfoModel.self) { response in
                
            switch response.result {
            case .success(let result):
                print("myInfo success", result)
                viewController.myPageSuccessAPI(result)
            case .failure(let error):
                print("myinfo fail")
                print(error.localizedDescription)
            }
        }
    }
}
