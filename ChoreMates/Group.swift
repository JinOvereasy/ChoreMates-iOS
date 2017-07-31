//
//  Group.swift
//  ChoreMates
//
//  Created by James Kang on 7/26/17.
//  Copyright © 2017 James Kang. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase.FIRDataSnapshot

class Group {
    var id: String
    var users: [User]?
    var chores: [Chore]?
    
    static var currentGroup: Group?
    let user: User
    var key: String?
    
//    var dictValue: [String: Any] {
//        let userDict = [ user.groupID :
//            [user.uid : user.username] ]
//        
//        return ["id" : id,
//                "users" : users!,
//                "chores" : chores!,
//                "user" : userDict]
//    }
//    
    init(id: String) {
        self.id = id
        Group.currentGroup = self
    }
    
//    init?(snapshot: DataSnapshot) {
//        guard let dict = snapshot.value as? [String: Any],
//            let id = dict["id"] as? String,
//            let users = dict["users"] as? String,
//            let chores = dict["chores"] as? String,
//            // let currentGroup
//            
//        let userDict = dict["user"] as? [String: Any],
//        let uid = userDict["uid"] as? String,
//        let username = userDict["username"] as? String
//        else { return nil }
//        
//        self.key = snapshot.key
//        self.id = id
//        
//        self.users = users
//        self.chores = chores
//    
//        self.user = User(uid: uid, username: username, groupID: id)
//    }
    
}










