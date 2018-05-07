//
//  MessageStore.swift
//  xkcdApp
//
//  Created by Inez Spiralska golak on 07.05.2018.
//  Copyright © 2018 in. All rights reserved.
//

import Foundation

class MessageStore {
    
    static let sharedInstance: MessageStore = {
        let instance = MessageStore()
        return instance
    }()
    
    var messages: [Message] = []
    
    func add(message: Message) {
        messages.append(message)
    }
    
    func edit(message: Message) {
        if let index = messages.index(where: {$0.id == message.id}) {
            messages[index] = message
        }
    }
    
    func remove(message: Message) {
        if let index = messages.index(where: {$0.id == message.id}) {
            messages.remove(at: index)
        }
    }
}
