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
    var key: String?
    let uid: String?
    var title: String
    var user: User
    var days: [Day]
    
    // var completed: Bool
    
    var dictValue: [String: Any] {
        let userDict = ["uid": user.uid,
                        "username": user.username]
        return [ //"key": key,
            "title": title,
            "user": user,
            "days": days,
            // "completed": completed,
            "user": userDict]
    }
    
    init(title: String, user: User, days: [Day], uid: String? /*, completed: Bool */) {
        self.uid = uid
        self.title = title
        self.user = User.currentUser!
        self.days = days
        
        // self.completed = completed
    }
    
//    init?(snapshot: DataSnapshot) {
//        guard let dict = snapshot.value as? [String : Any],
//            let title = dict["title"] as? String,
//            let user = dict["user"] as? User,
//            let days = dict["days"] as? [Day],
//            let uid = dict["uid"] as? String,
//            let completed = dict["completed"] as? Bool,
//            let userDict = dict["user"] as? [String: Any],
//            let username = userDict["username"] as? String
//            
//            else { return nil}
//        
//        self.key = snapshot.key
//        self.title = title
//        self.user = user
//        self.days = days
//        self.completed = completed
//        // where do I get the group ID? I've just connected it to the CurrentUser'sgroup ID, but I wonder if it will run correctly.
//        self.user = User(uid: uid, username: username, groupID: user.groupID)
//        // self.init(uid: snapshot.key, title: title, user: user)
//    }
    
}













