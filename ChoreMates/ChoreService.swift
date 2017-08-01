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
    static func editChore(chore: Chore, completion: @escaping () -> Void) {
        var days: [String: Bool] = [:]
        for day in chore.days {
            days[day.rawValue] = true
        }
        let title = chore.title
        let choreuid = chore.uid
        let user = chore.user
        let groupID = user.groupID
        let choreAttrs = ["title": title, "user_uid" : user.uid, "username": user.username, "day_of_the_week" : days] as [String : Any]
        
        let ref: DatabaseReference
        if let choreuid = choreuid {
            ref = Database.database().reference().child("chores").child(groupID).child(choreuid)
        } else {
            ref = Database.database().reference().child("chores").child(groupID).childByAutoId()
        }
        ref.updateChildValues(choreAttrs, withCompletionBlock: { (error, ref) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return completion()
            }
            completion()
        })
    }
    
    
    static func completeChore(chore: Chore, completion: () -> Void) {
        
    }
    
    static func deleteChore(chore: Chore, completion: @escaping ([Chore]?) -> Void) {
    
    }



/* add the Bool to check whether the task was complete/not on line 17, let choreAttrs after -> completed: completed */
    
}








