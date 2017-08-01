//
//  User.swift
//  ChoreMates
//
//  Created by James Kang on 7/11/17.
//  Copyright © 2017 James Kang. All rights reserved.
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot

class User {
    // MARK: - Properties
    let uid: String
    let username: String
    let groupID: String
    static var currentUser: User?
    
    // MARK: - Init
    init(uid: String, username: String, groupID: String) {
        self.uid = uid
        self.username = username
        self.groupID = groupID
        User.currentUser = self
    }
    
    convenience init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String : Any],
            let username = dict["username"] as? String,
            let groupID = dict["groupID"] as? String
            else { return nil}
        
        self.init(uid: snapshot.key, username: username, groupID: groupID)
    }
    
    //    class func setCurrent(_ user: User, writeToUserDefaults: Bool = false) {
    //        if writeToUserDefaults {
    //            let data = NSKeyedArchiver.archivedData(withRootObject: user)
    //            UserDefaults.standard.set(data, forKey: currentUser?)
    //        }
    //        currentUser = user
    //    }
}

