//
//  APIManager.swift
//  HUP
//
//  Created by gomin on 2022/05/20.
//
import Foundation
import Alamofire
import Kingfisher

class APIManager {
    func getHeader() -> HTTPHeaders {
        let token = UserDefaults.standard.string(forKey: "accessToken") ?? ""
        let headers: HTTPHeaders = [
            "Authorization": "Bearer " + token,
            "Accept": "application/json"
        ]
        return headers
    }
    func getMultipartHeader() -> HTTPHeaders {
        let token = UserDefaults.standard.string(forKey: "accessToken") ?? ""
        let headers: HTTPHeaders = [
            "Authorization": "Bearer " + token,
            "Content-Type": "multipart/form-data"
        ]
        return headers
    }
}
