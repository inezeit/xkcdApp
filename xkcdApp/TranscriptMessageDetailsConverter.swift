//
//  TranscriptMessageConverter.swift
//  xkcdApp
//
//  Created by Inez Spiralska golak on 07.05.2018.
//  Copyright © 2018 in. All rights reserved.
//

import Foundation

class TranscriptMessageDetailsConverter {
    
    func convert(transcript: String) -> [Message]{
       
        var messages: [Message] = []
        let transcriptSeparated = transcript.components(separatedBy: "\n")
        
        var author = ""
        var text = ""
        var isDescription = false
        var position = Position.left
        
        for (index, line) in transcriptSeparated.enumerated() {
        
            if(line.starts(with: "[") || line.starts(with: "<")){
                isDescription = true
                text = line
            }else if(line.starts(with: "{{")){
                continue
            }else{
                isDescription = false
                let lineSeaprated = line.components(separatedBy: ":")
                if(lineSeaprated.last! == ""){
                    continue
                }
                if (author != lineSeaprated.first!){
                    position = position == .left ? .right : .left
                }
                author = lineSeaprated.first!
                text = lineSeaprated.last!
            }
            
            let message = Message(id: index, isDescription: isDescription, author: author, text: text, position: position)
            messages.append(message)
        }
        
        return messages
    }
}
