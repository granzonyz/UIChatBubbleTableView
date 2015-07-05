//
//  UIChatBubbleTableViewCell.swift
//  UIChatBubble
//
//  Created by Yang Zhen on 15/7/4.
//  Copyright (c) 2015 Yang Zhen. All rights reserved.
//

import UIKit

class UIChatBubbleTableViewCell: UITableViewCell
{
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var bubbleImageView: UIImageView!

    let imageWidthIncrease: CGFloat = 30
    let imageHeightIncrease: CGFloat = 10
    let imageMargin: CGFloat = 10
    let messageXOffset: CGFloat = 18
    let messageYOffset: CGFloat = 5
    
    var data: ChatBubbleCellData?
    {
        didSet
        {
            updateCellUI()
        }
    }

    func updateCellUI()
    {
        if let cellData = data
        {
            var dateLabelOffset: CGFloat = 0
            dateLabel.hidden = cellData.hideDate
            if cellData.hideDate == false
            {
                dateLabel.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: cellData.dateLabelHeight)
                dateLabel.textAlignment = NSTextAlignment.Center
                
                let dateFormatter = NSDateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                dateLabel.text = dateFormatter.stringFromDate(cellData.message.date)
                
                dateLabel.textColor = UIColor.grayColor()
                dateLabel.font = cellData.dateFont
                dateLabelOffset = cellData.dateLabelHeight
            }
            
            messageLabel.text = cellData.message.text
            messageLabel.font = cellData.messageFont
            messageLabel.numberOfLines = 0
            messageLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
            
            let bubbleBackgroundImageSize = CGSize(width: cellData.messageLabelSize.width + imageWidthIncrease,
                height: cellData.messageLabelSize.height + imageHeightIncrease)
            
            switch cellData.message.type
            {
            case .MyMessage:
                messageLabel.frame = CGRect(origin: CGPoint(x: self.frame.width - cellData.messageLabelSize.width - messageXOffset - imageMargin, y: dateLabelOffset + messageYOffset), size: cellData.messageLabelSize)
                messageLabel.textColor = UIColor.whiteColor()
                
                bubbleImageView.frame = CGRect(origin: CGPoint(x: self.frame.width - bubbleBackgroundImageSize.width - imageMargin, y: dateLabelOffset), size: bubbleBackgroundImageSize)
                bubbleImageView.image = UIImage(named: "myBubble")?.stretchableImageWithLeftCapWidth(15, topCapHeight: 12)
                
            case .YourMessage:
                messageLabel.frame = CGRect(origin: CGPoint(x: messageXOffset + imageMargin, y: dateLabelOffset + messageYOffset), size: cellData.messageLabelSize)
                messageLabel.textColor = UIColor.blackColor()
                
                bubbleImageView.frame = CGRect(origin: CGPoint(x: imageMargin, y: dateLabelOffset), size: bubbleBackgroundImageSize)
                bubbleImageView.image = UIImage(named: "yourBubble")?.stretchableImageWithLeftCapWidth(20, topCapHeight: 12)
            }
        }
    }
}
