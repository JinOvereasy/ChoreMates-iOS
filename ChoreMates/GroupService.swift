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
        let groupAttrs = [groupID: [user.uid: user.username]]
        let ref = Database.database().reference().child("groups")
        
        ref.setValue(groupAttrs) { (error, ref) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return completion(nil)
            }
            ref.observeSingleEvent(of: .value, with: { (snapshot) in
                let user = User(snapshot: snapshot)
                completion(user)
            })
        }
    }
}













