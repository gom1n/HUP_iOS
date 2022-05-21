//
//  BidPageModel.swift
//  HUP
//
//  Created by gomin on 2022/05/22.
//

struct BidPageModel: Decodable {
    let currentElements: Int?
    let currentPage: Int?
    let data: [ParticipantData]
    let hasNext: Bool?
    let hasPrevious: Bool?
    let last: Bool?
    let totalElements: Int?
    let totalPage: Int?
}
struct ParticipantData: Decodable {
    let acceptState: Bool?
    let auctionClosingDate: String?
    let chatRoomId: Int?
    let fileNames: [String]?
    let itemId: Int?
    let itemName: String?
    let picture: String?
    let priceSuggestionId: Int?
    let sellerUserId: Int?
    let sellerUserName: String?
    let suggestionPrice: Int?
    let userId: Int?
    let userName: String?
}
