//
//  ChoreTableViewCell.swift
//  ChoreMates
//
//  Created by James Kang on 7/19/17.
//  Copyright © 2017 James Kang. All rights reserved.
//

import UIKit

class ChoreTableViewCell: UITableViewCell {

    // MARK - IBOutlets
    // link all the items, labels, buttons,
    
    @IBOutlet weak var choreTitleLabel: UILabel!
    @IBOutlet weak var dueDateLabel: UILabel!
    
    @IBAction func checkMarkButton(_ sender: UIButton) {
        
    }
    
    @IBAction func editChoreButton(_ sender: UIButton) {
        
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
