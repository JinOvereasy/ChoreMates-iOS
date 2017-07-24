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
    
    var myOwnChoresArray = [Chore]()
    var otherChoresArray = [Chore]()
    
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
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postChoreCell", for: indexPath) as! ChoreTableViewCell

        // I could use arryas of choreTitles, dueDates, use indexPath for the each text/date.u
        cell.choreTitleLabel.text = "Do dishes"
        cell.dueDateLabel.text = "Tu"

        return cell
    }
}

extension AllChoresViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("I am clicked: \(indexPath)")
    }
    
}














