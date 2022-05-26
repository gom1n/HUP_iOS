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
    let initPrice: String?
    let itemName: String?
    let itemStatePoint: String?
    let userId: String?
}
