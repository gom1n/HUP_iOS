//
//  ChannelModel.swift
//  HUP
//
//  Created by gomin on 2022/05/23.
//

struct ChannelModel: Decodable {
    let fileNames: [String]?
    let id: Int?
    let itemId: Int?
    let latestMessage: String?
    let latestTime: String?
    let otherUserId: Int?
    let otherUserName: String?
}
