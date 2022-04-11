//
//  Message.swift
//  MatchingApp
//
//  Created by Takafumi Watanabe on 2022-04-07.
//

import Firebase

struct Message {
    let text: String
    let fromId: String
    let toId: String
    let timestamp: Timestamp
    
    let isFromCurrentUser: Bool
    
    var chatPartnerId: String {
        return isFromCurrentUser ? toId : fromId
    }
    
    init(dictionary: [String: Any]) {
        self.text = dictionary["text"] as? String ?? ""
        self.fromId = dictionary["fromId"] as? String ?? ""
        self.toId = dictionary["toId"] as? String ?? ""
        self.timestamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())
        
        self.isFromCurrentUser = Auth.auth().currentUser?.uid == self.fromId
    }
}

struct Conversation {
    let user: User
    let message: Message
}
