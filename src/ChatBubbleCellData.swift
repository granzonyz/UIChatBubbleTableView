//
//  ChatBubbleCellData.swift
//  UIChatBubble
//
//  Created by Yang Zhen on 15/7/4.
//  Copyright (c) 2015 Yang Zhen. All rights reserved.
//

import Foundation
import UIKit


class ChatBubbleCellData
{
    let message: ChatBubbleMessage
    
    let hideDate: Bool
    let dateFont: UIFont
    let dateLabelHeight: CGFloat

    let messageFont: UIFont
    let messageLabelSize: CGSize
    
    private let spacing:CGFloat = 15
    let cellHeight: CGFloat

    
    init(message: ChatBubbleMessage, hideDate: Bool)
    {
        self.message = message
        
        self.hideDate = hideDate
        self.dateLabelHeight = hideDate ? 0 : 20
        self.dateFont = UIFont(name: "Helvetica", size: 10.0)!
        
        self.messageFont = UIFont(name: "Helvetica", size: 14.0)!
        let messageLabel = UILabel(frame: CGRectMake(0, 0, 260, CGFloat.max))
        messageLabel.numberOfLines = 0
        messageLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        messageLabel.font = messageFont
        messageLabel.text = message.text
        messageLabel.sizeToFit()
        self.messageLabelSize = messageLabel.frame.size
        
        self.cellHeight = self.messageLabelSize.height + dateLabelHeight + spacing
    }
}