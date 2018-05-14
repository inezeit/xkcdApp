//
//  MessageTableViewCell.swift
//  xkcdApp
//
//  Created by Inez Spiralska golak on 07.05.2018.
//  Copyright © 2018 in. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {

    @IBOutlet weak var messageText: UITextView!
    @IBOutlet weak var bubble: UIView!
    
    let leftBubbleColor = UIColor.init(red: 0.1, green: 0.4, blue: 0.9, alpha: 0.1)
    let rightBubbleColor = UIColor.init(red: 0.1, green: 0.4, blue: 1.0, alpha: 0.3)
    let middleBubbleColor = UIColor.init(red: 0.1, green: 0.4, blue: 0.9, alpha: 0.3)
    
    var item: Message? {
        didSet {
            if item == nil {
                messageText.text = ""
            } else {
                messageText.text = item?.text
                setBubble()
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.item = nil
    }
    
    func setBubble(){
        bubble.layer.cornerRadius = 15
        
        switch(item?.position){
        case .left?: bubble.backgroundColor = leftBubbleColor
        case .right?: bubble.backgroundColor = rightBubbleColor
        case .none: break
        }
        
        if(item?.isDescription)!{
            bubble.backgroundColor = middleBubbleColor
        }
        
        messageText.font = UIFont.systemFont(ofSize: 18)
        messageText.backgroundColor = UIColor.clear
    }
}
