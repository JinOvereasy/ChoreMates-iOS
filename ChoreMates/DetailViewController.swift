//
//  DetailViewController.swift
//  ChoreMates
//
//  Created by James Kang on 7/21/17.
//  Copyright © 2017 James Kang. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var chore: Chore?
    var daysArray: [Day] = [Day]()
    var pickerData: [String] = [String]()
    var placementAnswer = 0
    
    // MARK: - IBOutlets
    @IBOutlet weak var choreTextField: UITextField!
    @IBOutlet weak var assignChoreLabel: UILabel!
    @IBOutlet weak var personPicker: UIPickerView!
    @IBOutlet weak var chosenPersonLabel: UILabel!

    // MARK: - IBAction
    @IBAction func dayButtonClicked(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if let day = Day(rawValue: sender.currentTitle!) {
            if sender.isSelected != true {
                // daysArray.remove(Day(rawValue: sender.currentTitle) ?? .Su)
                if let index = daysArray.index(of: day) {
                    daysArray.remove(at: index)
                }
            } else {
                // daysArray.append(Day(rawValue: sender.currentTitle!) ?? .Su)
                daysArray.append(day)
            }
        }
        print(daysArray)
    }
    
    // MARK: - Layout
    override func viewDidLoad() {
        super.viewDidLoad()
        self.personPicker.delegate = self
        self.personPicker.dataSource = self
        
        pickerData = ["Will", "Jeff", "Jin", "Su"]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        chosenPersonLabel.text = pickerData[row]
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "Update" {
            if let chore = chore {
                print("SAVE TO FIREBASE")
            } else {
                print("SAVE NEW TO FIREBASE")
            }
        }
    }

}











