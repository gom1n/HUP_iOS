//
//  UploadModel.swift
//  HUP
//
//  Created by gomin on 2022/05/27.
//

struct UploadModel: Decodable {
    let auctionClosingDate: String?
    let buyDate: String?
    let category: String?
    let description: String?
    let fileNames: [String]?
    let id: Int?
    let initPrice: Int?
    let itemName: String?
    let itemStatePoint: Int?
    let soldStatus: String?
    let userId: Int?
  }
