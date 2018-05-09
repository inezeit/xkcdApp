//
//  TranscriptMessageConverter.swift
//  xkcdApp
//
//  Created by Inez Spiralska golak on 07.05.2018.
//  Copyright © 2018 in. All rights reserved.
//

import Foundation

class TranscriptMessageConverter {
    
    func convert(transcript: String) -> [Message]{
       
        var messages: [Message] = []
        let transcriptSeparated = transcript.components(separatedBy: "\n")
        
        for (index, line) in transcriptSeparated.enumerated() {
            
            var author = ""
            var text = ""
            var position = Position.left
            
            if(line.starts(with: "[") || line.starts(with: "<")){
                author = "text"
                text = line
                position = .middle
            }else{
                var lineSeaprated = line.components(separatedBy: ":")
                author = lineSeaprated[0]
                text = lineSeaprated[1]
            }
            
            let message = Message(id: index, author: author, text: text, position: position)
            print(index)
            messages.append(message)
        }
        
        return messages
    }
}