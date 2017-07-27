//
//  Chore.swift
//  ChoreMates
//
//  Created by James Kang on 7/11/17.
//  Copyright © 2017 James Kang. All rights reserved.
//

import Foundation

enum Day: String {
    case Su, M, Tu, W, Th, F, S
}

class Chore {
    var chore: String
    var user: User
    var days: [Day]
    var completed: Bool
    
    init(chore: String, user: User, days: [Day], completed: Bool) {
        self.chore = chore
        self.user = user
        self.days = days
        self.completed = completed
        
        let day = Day.Su
        let rawDay = day.rawValue
    }
}

