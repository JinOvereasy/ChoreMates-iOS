//
//  AllChoresViewController.swift
//  ChoreMates
//
//  Created by James Kang on 7/11/17.
//  Copyright © 2017 James Kang. All rights reserved.
//

import UIKit

class AllChoresViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    var myOwnChoresArray: [Chore] = [Chore(chore: "do chore 0", user: User(), days: [.Su]),
                                     Chore(chore: "do chore 1", user: User(), days: [.M, .W]),
                                     Chore(chore: "do chore 2", user: User(), days: [.Th])]
    
    var otherChoresArray: [Chore] = [Chore(chore: "do chore 0 other user", user: User(), days: [.Th, .F]),
                                     Chore(chore: "do chore 1 other user", user: User(), days: [.M, .Th]),
                                     Chore(chore: "do chore 2 other user", user: User(), days: [.S]),
                                     Chore(chore: "do chore 3 other user", user: User(), days: [.Su])]
    
    // array of chores
    // link all of the things
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postChoreCell", for: indexPath) as! ChoreTableViewCell

        // I could use arryas of choreTitles, dueDates, use indexPath for the each text/date.u
//        cell.choreTitleLabel.text = "Do dishes"
//        cell.dueDateLabel.text = "Tu"
        
       //  String()
        
        if indexPath.section == 0 {
            cell.choreTitleLabel.text = myOwnChoresArray[indexPath.row].chore
          //   cell.dueDateLabel.text = String(  myOwnChoresArray[indexPath.row].days) //joined()
            // cell.dueDateLabel.text = myOwnChoresArray[indexPath.row].days
        } else if indexPath.section == 1 {
            cell.choreTitleLabel.text = otherChoresArray[indexPath.row].chore
            // cell.dueDateLabel.text = otherChoresArray[indexPath.row].days
        }
        

        return cell
    }
}

extension AllChoresViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("I am clicked: \(indexPath)")
    }
    
}














