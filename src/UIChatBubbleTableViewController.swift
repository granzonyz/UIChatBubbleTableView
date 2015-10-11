//
//  UIChatBubbleTableViewController.swift
//  UIChatBubble
//
//  Created by Yang Zhen on 15/7/4.
//  Copyright (c) 2015 Yang Zhen. All rights reserved.
//

import UIKit

class UIChatBubbleTableViewController: UITableViewController
{
    var cellDataArray = [ChatBubbleCellData]()
    var ifCellRegistered = false
    
    // Load test data here
    override func viewDidLoad()
    {
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        loadTestData()
    }
    
    // Number of rows in TableView
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return cellDataArray.count
    }
    
    // Get TableViewCell here
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let data = cellDataArray[indexPath.row]
        let cell: UIChatBubbleTableViewCell
        
        if ifCellRegistered
        {
            let reusableCell: AnyObject = tableView.dequeueReusableCellWithIdentifier("UIChatBubbleTableViewCell", forIndexPath: indexPath)
            cell = reusableCell as! UIChatBubbleTableViewCell
        }
        else
        {
            let cellArray = NSBundle.mainBundle().loadNibNamed("UIChatBubbleTableViewCell", owner: self, options: nil)
            cell = cellArray[0] as! UIChatBubbleTableViewCell
            
            //register UIChatBubbleTableViewCell
            let nib = UINib(nibName: "UIChatBubbleTableViewCell", bundle: NSBundle.mainBundle())
            self.tableView.registerNib(nib, forCellReuseIdentifier: "UIChatBubbleTableViewCell")
            ifCellRegistered = true
        }
        
        cell.frame.size.width = self.tableView.frame.width
        cell.data = cellDataArray[indexPath.row]
        
        return cell
    }
    
    // TableViewCell's height
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return cellDataArray[indexPath.row].cellHeight
    }
    
    // TableView's header
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let headerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 10))
        headerLabel.font = UIFont(name: "Helvetica", size: 10.0)!
        headerLabel.text = "Messages"
        headerLabel.textAlignment = NSTextAlignment.Center
        headerLabel.textColor = UIColor.grayColor()
        return headerLabel
    }
    
    // Use this func to add message
    func addMessage(text: String, date: NSDate, type: ChatBubbleMessageType)
    {
        let message = ChatBubbleMessage(text: text, date: date, type: type)
        let ifHideDate: Bool
        if cellDataArray.count == 0 || date.timeIntervalSinceDate(cellDataArray[cellDataArray.count-1].message.date) > 60
        {
            ifHideDate = false
        }
        else
        {
            ifHideDate = true
        }
        let cellData = ChatBubbleCellData(message: message, hideDate: ifHideDate)
        cellDataArray.append(cellData)
    }
    
    // Add test data here
    func loadTestData()
    {
        addMessage("Hi!", date: NSDate(timeIntervalSinceNow: -24*60*60), type: ChatBubbleMessageType.MyMessage)
        addMessage("嗨！", date: NSDate(timeIntervalSinceNow: -24*60*60+30), type: ChatBubbleMessageType.YourMessage)
        addMessage("这是一条用来测试的中文字符串", date: NSDate(timeIntervalSinceNow: -12*60*60), type: ChatBubbleMessageType.MyMessage)
        addMessage("this is a string", date: NSDate(timeIntervalSinceNow: -12*60*60+30), type: ChatBubbleMessageType.YourMessage)
        addMessage("this is a very very very very very very very very very very very very very very very very very very very very very very very very very very very very long string", date: NSDate(timeIntervalSinceNow: -30), type: ChatBubbleMessageType.MyMessage)
        addMessage("这是一条非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常长的字符串", date: NSDate(), type: ChatBubbleMessageType.YourMessage)
    }

}

