//
//  ChatBubbleMessage.swift
//  UIChatBubble
//
//  Created by Yang Zhen on 15/7/4.
//  Copyright (c) 2015 Yang Zhen. All rights reserved.
//  GitHub: https://github.com/heavenopener/UIChatBubbleTableView
//

import Foundation


enum ChatBubbleMessageType
{
    case MyMessage
    case YourMessage
}

class ChatBubbleMessage
{
    let date: NSDate
    let text: String
    let type: ChatBubbleMessageType
    
    init(text: String, date: NSDate, type: ChatBubbleMessageType)
    {
        self.date = date
        self.text = text
        self.type = type
    }
}