//
//  ItemListModel.swift
//  HUP
//
//  Created by gomin on 2022/05/20.
//

struct ItemListModel : Decodable {
    let currentElements: Int?
    let currentPage: Int?
    let data: [ItemListData]
    let hasNext: Bool?
    let hasPrevious: Bool?
    let last: Bool?
    let totalElements: Int?
    let totalPage: Int?
}
struct ItemListData : Decodable {
    let auctionClosingDate: String?
    let bidderUserId: Int?
    let bidderUserName: String?
    let buyDate: String?
    let category: String?
    let chatRoomId: UInt64?
    let description: String?
    let fileNames: [String]?
    let id: UInt64?
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
