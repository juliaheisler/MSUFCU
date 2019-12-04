//
//  UpdateGoal.swift
//  HopesAndDreams
//
//  Created by Team MSUFCU on 12/3/19.
//  Copyright © 2019 Julia Heisler. All rights reserved.
//

import UIKit

class UpdateGoal: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var amount: UITextField!
    @IBOutlet weak var category: UITextField!
    @IBOutlet weak var goal: UITextField!
    @IBAction func save(_ sender: Any) {
        
        APIClient.setNewGoal(hash: UserDefaults.standard.string(forKey: "hashID")!, d0: goal.text!, d1: amount.text!)
    }
    let myPickerData = ["Travel", "Education", "Event", "Home", "Automotive", "Family", "Other"]
    
    var thePicker = UIPickerView()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
      return  1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myPickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myPickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        category.text = myPickerData[row]
        self.view.endEditing(false)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        thePicker.delegate = self
        thePicker.dataSource = self
        category.inputView = thePicker
    

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
