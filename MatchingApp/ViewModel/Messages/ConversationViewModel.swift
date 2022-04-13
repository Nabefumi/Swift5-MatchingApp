//
//  ConversationViewModel.swift
//  MatchingApp
//
//  Created by Takafumi Watanabe on 2022-04-08.
//

import Foundation

struct ConversationViewModel {
    
    private let conversation: Conversation
    
    var profileImageUrl: URL? {
        return URL(string: conversation.user.imageURLs.first!)
    }
    
    var messageText: String
    var usernameText: String
    
    var timestamp: String {
        let date = conversation.message.timestamp.dateValue()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        return dateFormatter.string(from: date)
    }
    
    init(conversation: Conversation) {
        self.conversation = conversation
        
        messageText = conversation.message.text
        usernameText = conversation.user.name
    }
}
