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
        messageText.font = UIFont.systemFont(ofSize: 18)
        messageText.backgroundColor = UIColor.clear
    }
}
