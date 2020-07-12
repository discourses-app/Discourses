//
//  Message.swift
//  Discourses
//
//  Created by Abhishek Marda on 7/11/20.
//  Copyright © 2020 DiscoursesTeam. All rights reserved.
//

import Foundation

struct Message {
    
    init (from sender: String, on time: Date, withMessage content: String)
    {
        self.sender = sender
        self.timeSent = time
        self.content = content
    }
    
    let sender : String
    let timeSent : Date
    let content : String
}
