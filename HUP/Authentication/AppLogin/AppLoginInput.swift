//
//  AppLoginInput.swift
//  HUP
//
//  Created by gomin on 2022/05/20.
//

struct AppLoginInput : Encodable {
    let loginId: String?
    let password: String?
    let targetToken: String?
}
