//
//  Chore.swift
//  ChoreMates
//
//  Created by James Kang on 7/11/17.
//  Copyright © 2017 James Kang. All rights reserved.
//

import Foundation
enum Day {
    case Su, M, Tu, W, Th, F, S
}

class Chore {
    
    // all the things that can be edited for the chore, such as date
    // assignable user, the title of the chore
    var chore: String
    var user: User
    var days: [Day]
    
    init(chore: String, user: User, days: [Day]) {
            self.chore = chore
            self.user = user
            self.days = days
    }
}

