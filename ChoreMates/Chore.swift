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
    var title: String
    var user: User
    var days: [Day]
    let uid: String?
    // var completed: Bool
    
    init(title: String, user: User, days: [Day], uid: String? /*, completed: Bool */) {
        self.title = title
        self.user = user
        self.days = days
        self.uid = uid
        // self.completed = completed
        // let day = Day.Su
        // let rawDay = day.rawValue
    }
    
//    convenience init?(snapshot: DataSnapshot) {
//        guard let dict = snapshot.value as? [String : Any],
//            let username = dict["username"] as? String,
//            let groupID = dict["groupID"] as? String
//            else { return nil}
//        
//        self.init(uid: snapshot.key, username: username, groupID: groupID)
//    }
    
}




