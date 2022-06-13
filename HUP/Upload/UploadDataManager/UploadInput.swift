//
//  UploadInput.swift
//  HUP
//
//  Created by gomin on 2022/05/27.
//

struct UploadInput: Encodable {
    let auctionClosingDate: String?
    let buyDate: String?
    let category: String?
    let description: String?
    let files: [String]?
    let initPrice: Int?
    let itemName: String?
    let itemStatePoint: Int?
    let userId: Int?
}
