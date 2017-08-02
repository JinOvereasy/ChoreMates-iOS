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
    
    // this is returning an every User in the same group, 
    // how do I exclude the user who is currently signed in? ->  Check if User.currentUser == loop through otherUsersInGroup array?
    
    static func getOtherUsersInGroup(groupID: String, completion: @escaping ([User]?) -> Void) {
        let currentUser = User.currentUser
        // configure network call
        let ref = Database.database().reference().child("groups").child(groupID)
        // inside network call callback...
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            guard let dictionary = snapshot.value as? [String: Any]
                else { return completion( []) }
            // create array of user objects in group
            var otherUsersInGroup = [User]()
            // if  .filter { $0.uid != currentUser.uid }
            // if dictionary.value != currentUser?.uid {
            for (_ , value) in dictionary {
                otherUsersInGroup.append(value as! User)
            }
            completion(otherUsersInGroup)
        })
    }
    
    static func users(inGroup groupID: String, completion: @escaping ([String]) -> Void) {
        
    }
    

    // my question is, how should I differentiate my chores vs otherChores in group? 
    // If the chore.user == user, then append to myChore, else append to OtherChores array.
}


/*
            guard let snapshot = snapshot.children.allObjects as? [DataSnapshot] else {
                return completion(nil)
            }
 let otherUsers: [User] = []
 let otherUsers = snapshot.map( {_ in Group.rawValue })
            let otherUsers = snapshot.flatMap {
                guard let user = User(snapshot: $0) else {
                    return nil
                }
            }
 set group users property

 call completion( and pass in group we created )
 completion(otherUsersInGroup)

 static func getOtherUsersInGroup(groupID: String, completion: @escaping ([User]?) -> Void) {
 let currentUser = User.currentUser
 // configure network call
 let ref = Database.database().reference().child("groups").child(groupID)
 // inside network call callback...
 ref.observeSingleEvent(of: .value, with: { (snapshot) in
 guard let dictionary = snapshot.value as? [String: Any]
 else { return completion( []) }
 // create array of user objects in group
 var otherUsersInGroup = [User]()
 
 for (_ , value) in dictionary {
 otherUsersInGroup.append(value as! User)
 }
 completion(otherUsersInGroup)
 })
 }
 
 let currentUser = User.currentUser
 // configure network call
 let ref = Database.database().reference().child("groups").child(groupID)
 ref.observeSingleEvent(of: .value, with: { (snapshot) in
 guard let snapshot = snapshot.children.allObjects as? [DataSnapshot]
 else { return completion( []) }
 let users =
 snapshot
 .flatMap(User.init)
 .flilter { $0.uid != currentUser.uid }
 let dispatchGroup = DispatchGroup()
 users.forEach { (user) in
 dispatchGroup.enter() }
 // create array of user objects in group
 // var otherUsersInGroup = [User]()
 }
 DispatchGroup.notify(queue: .main, execute: {
 completion(users)
 })
 })
 }
 */









