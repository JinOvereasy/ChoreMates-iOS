//
//  User.swift
//  ChoreMates
//
//  Created by James Kang on 7/11/17.
//  Copyright © 2017 James Kang. All rights reserved.
//

import Foundation

class User {
//    // MARK: - Properties
    let uid: String
    let username: String
    let groupID: String
    
    static var currentUser: User?
//
//    // MARK: - Init
    init(uid: String, username: String, groupID: String) {
        self.uid = uid
        self.username = username
        self.groupID = groupID
    }
    
}
