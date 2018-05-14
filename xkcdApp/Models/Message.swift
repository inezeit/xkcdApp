//
//  Message.swift
//  xkcdApp
//
//  Created by Inez Spiralska golak on 07.05.2018.
//  Copyright © 2018 in. All rights reserved.
//

import Foundation

enum Position {
    case left, right
}

struct Message {
    var id: Int
    var isDescription: Bool
    var author: String?
    var text : String
    var position : Position?
}
