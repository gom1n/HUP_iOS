//
//  AppLoginModel.swift
//  HUP
//
//  Created by gomin on 2022/05/20.
//

struct AppLoginModel : Decodable {
    let accessToken: String?
    let refreshToken: String?
    let userId: Int?
}
