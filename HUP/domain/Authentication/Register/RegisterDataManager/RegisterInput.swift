//
//  RegisterInput.swift
//  HUP
//
//  Created by gomin on 2022/05/24.
//

struct RegisterInput : Encodable {
    let email: String?
    let loginId: String?
    let password: String?
    let phoneNumber: String?
    let username: String?
}
