//
//  Chore.swift
//  ChoreMates
//
//  Created by James Kang on 7/11/17.
//  Copyright © 2017 James Kang. All rights reserved.
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot

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
    }
    
//    convenience init?(snapshot: DataSnapshot) {
//        guard let dict = snapshot.value as? [String : Any],
//            let title = dict["title"] as? String,
//            let user = dict["user"] as? String,
//            let days = dict["days"] as? [Day],
//            let uid = dict["uid"] as? String
//
//            else { return nil}
//        
//        self.init(uid: snapshot.key, title: title, user: user)
//    }
    
}




