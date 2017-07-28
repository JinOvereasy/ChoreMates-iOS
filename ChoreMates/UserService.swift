//
//  UserService.swift
//  ChoreMates
//
//  Created by James Kang on 7/26/17.
//  Copyright © 2017 James Kang. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

typealias FIRUser = FirebaseAuth.User

struct UserService {
    
    static func create(_ firUser: FIRUser, username: String, groupID: String, completion: @escaping (User?) -> Void) {
        let userAttrs = ["username": username, "groupID": groupID]
        let ref = Database.database().reference().child("users").child(firUser.uid)
        ref.setValue(userAttrs) { (error, ref) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return completion(nil)
            }
            ref.observeSingleEvent(of: .value, with: { (snapshot) in
                guard let user = User(snapshot: snapshot) else {
                    return completion(nil)
                }
                
                GroupService.addUserToGroup(user, groupID: groupID, completion: { (user) in
                    completion(user)
                })
            })
        }
    }
    
    static func show(forUID uid: String, completion: @escaping (User?) -> Void) {
        let ref = Database.database().reference().child("users").child(uid)
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            guard let user = User(snapshot: snapshot) else {
                return completion(nil)
            }
            completion(user)
        })
    }
}







