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
                print(error)
            }
        }
    }
    func uploadNewItem(with model: UploadInput, _ viewController : UploadViewController, completion: @escaping ((Bool) -> Void)){
            AF.upload(multipartFormData: { (multipartFormData) in
                multipartFormData.append(Data(model.auctionClosingDate!.utf8), withName: "auctionClosingDate")
                multipartFormData.append(Data(model.buyDate!.utf8), withName: "buyDate")
                multipartFormData.append(Data(model.category!.utf8), withName: "category")
                multipartFormData.append(Data(model.description!.utf8), withName: "description")
                multipartFormData.append(Data(String(model.initPrice!).utf8), withName: "initPrice")
                multipartFormData.append(Data(model.itemName!.utf8), withName: "itemName")
                multipartFormData.append(Data(String(model.itemStatePoint!).utf8), withName: "itemStatePoint")
                multipartFormData.append(Data(String(model.userId!).utf8), withName: "userId")
                if let imageArray = model.files {
                    for images in imageArray {
                        multipartFormData.append(images, withName: "files", fileName: "item_image", mimeType: "image/jpeg")
                    }
                }
            }, to: "http://www.hurryuphup.me/api/v1/items",
                      headers: APIManager().getMultipartHeader())
            .responseDecodable(of: UploadModel.self) { response in
                switch response.result {
                case .success(let result):
                    print("upload success: ", result)
                    viewController.uploadSuccessAPI()
                case .failure(let error):
                    print(error)
                }
            }
        }
}
