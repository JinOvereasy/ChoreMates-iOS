//
//  DetailViewController.swift
//  ChoreMates
//
//  Created by James Kang on 7/21/17.
//  Copyright © 2017 James Kang. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var chore: Chore?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dayButtonClicked(_ sender: UIButton) {
    }
    
    /*
     if the chore == nil, put the input as chore (gotta be optional since it could be nil),
     if the chore has value, then it will head to Edit chore viewController
     */
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
