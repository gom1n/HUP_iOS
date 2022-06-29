//
//  PriceSuggestionStomp.swift
//  HUP
//
//  Created by gomin on 2022/06/29.
//

import Foundation
import StompClientLib

class PriceSuggestionStomp {
    // Socket Client instance
    var socketClient = StompClientLib()
    // Socket Connection URL
    private let url = URL(string: "ws://www.hurryuphup.me/websocket/websocket")!
    
    let accessToken = UserDefaults.standard.string(forKey: "accessToken")
    var itemId: Int = -1
    var suggestionPrice: Int = 0

    // CONNECT
    func registerSockect(itemId: Int) {
        socketClient.openSocketWithURLRequest(
            request: NSURLRequest(url: url),
            delegate: self,
            connectionHeaders: [ "Authorization" : "Bearer " + accessToken! ]
        )
        self.itemId = itemId
    }
    // SUBSCRIBE
    func subscribe() {
        socketClient.subscribe(destination: "/sub/priceSuggestions/\(self.itemId)")
    }
    // SEND
    func sendMessage() {
//        var payloadObject : [String : Any] = ["" : ""]
    
        socketClient.sendJSONForDict(
                        dict: suggestionPrice as AnyObject,
                        toDestination: "/pub/priceSuggestions")
    }
    // DISCONNECT
    func disconnect() {
        socketClient.disconnect()
    }
}
extension PriceSuggestionStomp: StompClientLibDelegate {
    // DELEGATE
    func stompClient(client: StompClientLib!, didReceiveMessageWithJSONBody jsonBody: AnyObject?, akaStringBody stringBody: String?, withHeader header: [String : String]?, withDestination destination: String) {
        if stringBody == nil {return}
        guard let data = stringBody!.data(using: .utf8) else {return}
        print("** pricesuggest DATA: ", data)

//        guard let innerJSON_Message = JSON ["message"] else {return}
//        guard let innerJSON_Member = JSON ["member"] else {return}
//
//        let newMsg = Message(
//            member:
//                Sender(
//                    memberId: innerJSON_Member["memberId"] as? Int ?? -1,
//                    username: innerJSON_Member["username"] as? String ?? "",
//                    description: innerJSON_Member["description"] as? String ?? "",
//                    profileImage: innerJSON_Member["profileImage"] as? String ?? ""
//                ),
//            message :
//                MessageContents(
//                    messageId: lastMessageId + 1,
//                    message: innerJSON_Message["message"] as? String ?? "",
//                    image: innerJSON_Message["image"] as? String ?? "",
//                    createdAt: "\(Date(timeIntervalSinceNow: 32400))"
//                )
//        )
//        lastMessageId += 1
//        MessageList.append(newMsg)
    }
    
    func stompClientDidDisconnect(client: StompClientLib!) {
        print("Socket is Disconnected")
    }
    
    func stompClientDidConnect(client: StompClientLib!) {
        print("Socket is connected")

        subscribe()
    }
    
    func serverDidSendReceipt(client: StompClientLib!, withReceiptId receiptId: String) {
        print("Receipt : \(receiptId)")
    }
    
    func serverDidSendError(client: StompClientLib!, withErrorMessage description: String, detailedErrorMessage message: String?) {
        print("Error Send : \(String(describing: message))")
//        if(!socketClient.isConnected()){
//            reconnect()
//        }
    }
    func serverDidSendPing() {
        print("Server ping")
    }
}
