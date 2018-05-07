//
//  MessageTableViewCell.swift
//  xkcdApp
//
//  Created by Inez Spiralska golak on 07.05.2018.
//  Copyright © 2018 in. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {

    @IBOutlet weak var messageText: UILabel!

    var item: Message? {
        didSet {
            if item == nil {
                messageText.text = ""
            } else {
                messageText.text = item?.text
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
       // iconView.layer.cornerRadius = 4
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.item = nil
    }
}
