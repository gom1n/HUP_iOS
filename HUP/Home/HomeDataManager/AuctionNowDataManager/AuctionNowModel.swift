//
//  AuctionNowModel.swift
//  HUP
//
//  Created by gomin on 2022/05/19.
//

struct AuctionNowModel : Decodable {
    let currentElements: Int?
    let currentPage: Int?
    let data: [AuctionNowData]
    let hasNext: Bool?
    let hasPrevious: Bool?
    let last: Bool?
    let totalElements: Int?
    let totalPage: Int?
}
struct AuctionNowData : Decodable {
    let auctionClosingDate: String?
    let bidderUserId: Int?
    let bidderUserName: String?
    let buyDate: String?
    let category: String?
    let chatRoomId: Int?
    let description: String?
    let fileNames: [String]?
    let id: Int?
    let initPrice: Int?
    let itemName: String?
    let itemStatePoint: Int?
    let maximumPrice: Int?
    let participants: Int?
    let scrapCount: Int?
    let soldPrice: Int?
    let soldStatus: String?
    let userId: Int?
}
