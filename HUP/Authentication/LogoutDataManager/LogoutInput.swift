//
//  LogoutInput.swift
//  HUP
//
//  Created by gomin on 2022/05/23.
//

struct LogoutInput: Encodable {
    let accessToken: String?
    let refreshToken: String?
}
