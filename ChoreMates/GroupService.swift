//
//  GroupService.swift
//  ChoreMates
//
//  Created by James Kang on 7/20/17.
//  Copyright © 2017 James Kang. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

struct GroupService {
    
    static func addUserToGroup(_ user: User, groupID: String, completion: @escaping (User?) -> Void) {
        let groupAttrs = [user.uid: user.username]
        let ref = Database.database().reference().child("groups").child(groupID)
        
        ref.updateChildValues(groupAttrs)
    }
    
    static func getOtherUsersInGroup(groupID: String, completion: @escaping (Group?) -> Void) {
        // configure network call
        let ref = Database.database().reference().child("groups").child(groupID)
        
        // inside network call callback...
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            guard let snapshot = snapshot.children.allObjects as? [DataSnapshot] else {
                return completion(nil)
            }
            // create array of user objects in group
            // let otherUsers: [User] = []
            let otherUsers = snapshot.flatMap {
                guard let user = User(snapshot: $0) else {
                    return nil
                }
            }
            // let otherUsers = snapshot.map( {_ in Group.rawValue })
            // set group users property
            
            // call completion( and pass in group we created )
            completion(otherUsers)
        })
    }
    
    static func getChoresInGroup(groupID: String, completion: @escaping (Chore?) -> Void) { // FILL IN COMPLETION PARAMETER
        let ref = Database.database().reference().child("groups").child(groupID)
        
        ref.observeSingleEvent(of: .value, with:  { (snapshot) in
            guard let snapshot = snapshot.children.allObjects as? [DataSnapshot] else {
                return completion([])
            }
            
            let choresInGroup = snapshot.flatMap {
                guard let chore = Chore(snapshot: $0) else {
                    return nil
                }
            }
            
            completion(choresInGroup)
        })
    }
    
}











