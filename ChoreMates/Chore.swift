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
    
    init(chore: String, user: User, days: [Day]) {
        self.chore = chore
        self.user = user
        self.days = days
        
        let day = Day.Su
        let rawDay = day.rawValue
    }
}

