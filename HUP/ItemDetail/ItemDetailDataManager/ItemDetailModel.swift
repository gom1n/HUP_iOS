//
//  ItemDetailModel.swift
//  HUP
//
//  Created by gomin on 2022/05/20.
//

struct ItemDetailModel: Decodable {
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
