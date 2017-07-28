//
//  ChoreService.swift
//  ChoreMates
//
//  Created by James Kang on 7/20/17.
//  Copyright © 2017 James Kang. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

struct ChoreService {
    
    static func addChores(_ user: User, groupID: String, chore: Chore, days: [Day], completion: @escaping (User?) -> Void) {
        
        let choreAttrs = ["name/title": chore, "user" : user.username, "day of the week" : days] as [String : Any]
        let ref = Database.database().reference().child("chores").child(groupID).childByAutoId()
        
        ref.updateChildValues(choreAttrs)
        
        ref.setValue(choreAttrs) { (error, ref) in
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
    
    
    static func getChores(completion: ([Chore]?) -> Void) {
        
    }
    
    static func deleteChores(completion: ([Chore]?) -> Void) {
        
    }
    
}


/* add the Bool on line 17, let choreAttrs    after -> completed: completed */









