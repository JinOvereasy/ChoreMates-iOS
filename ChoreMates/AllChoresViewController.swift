//
//  AllChoresViewController.swift
//  ChoreMates
//
//  Created by James Kang on 7/11/17.
//  Copyright © 2017 James Kang. All rights reserved.
//

import UIKit


class AllChoresViewController: UIViewController {
   // let ref = FIRDatabase.database().reference(withPath:"chore-items")
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    let sectionTitle = ["My Chores", "Other's Chores"]
    // var myOwnChoresArray: [Chore]()
    // var otherChoresArray: [Chore]()
    
    var myOwnChoresArray: [Chore] = [Chore(title: "do chore 0", user: User(uid: "aksdjfkjsdhf", username: "first", groupID: "ios"), days: [.Su], uid: "uidChore"),
                                     Chore(title: "do chore 1", user: User(uid: "aksdjfkjsdhf", username: "sec", groupID: "ios"), days: [.M, .W], uid: "uidChore"),
                                     Chore(title: "do chore 2", user: User(uid: "aksdjfkjsdhf", username: "thr", groupID: "ios"), days: [.Th], uid: "uidChore")]
    
    var otherChoresArray: [Chore] = [Chore(title: "do chore 0 other user", user: User(uid: "aksdjfkjsdhf", username: "four", groupID: "ios"), days: [.Th, .F], uid: "uidChore"),
                                     Chore(title: "do chore 1 other user", user: User(uid: "aksdjfkjsdhf", username: "five", groupID: "ios"), days: [.M, .Th], uid: "uidChore"),
                                     Chore(title: "do chore 2 other user", user: User(uid: "aksdjfkjsdhf", username: "six", groupID: "ios"), days: [.S], uid: "uidChore"),
                                     Chore(title: "do chore 3 other user", user: User(uid: "aksdjfkjsdhf", username: "sev", groupID: "ios"), days: [.Su], uid: "uidChore")]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - IBAction
    @IBAction func unwindtoAllChoresView (segue: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Navigation
}

extension AllChoresViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return myOwnChoresArray.count
        } else if section == 1 {
            return otherChoresArray.count
        } else {
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (section == 0){
            return sectionTitle[0]
        }
        else if (section == 1) {
            return sectionTitle[1]
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postChoreCell", for: indexPath) as! ChoreTableViewCell
        if indexPath.section == 0 {
            cell.choreTitleLabel.text = myOwnChoresArray[indexPath.row].title
            cell.dueDateLabel.text = "\(myOwnChoresArray[indexPath.row].days.map({ $0.rawValue }).joined(separator: ", "))"
        } else if indexPath.section == 1 {
            cell.choreTitleLabel.text = otherChoresArray[indexPath.row].title
            cell.dueDateLabel.text = "\(otherChoresArray[indexPath.row].days.map({ $0.rawValue }).joined(separator: ", "))"
            } else {
                cell.choreTitleLabel.text = "Empty Empty nil"
            }
        return cell
    }
    
}

extension AllChoresViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("I am clicked: \(indexPath)")
    }
    
}









