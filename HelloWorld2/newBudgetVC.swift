//
//  newBudgetVC.swift
//  HopesAndDreams
//
//  Created by Team MSUFCU on 11/12/19.
//  Copyright © 2019 Julia Heisler. All rights reserved.
//

import UIKit

class newBudgetVC: UIViewController,  UIPickerViewDelegate, UIPickerViewDataSource{
    @IBOutlet weak var category: UITextField!
    
    @IBOutlet weak var limit: UITextField!
    override func viewDidLoad() {
        thePicker.delegate = self
        thePicker.dataSource = self
               
        category.inputView = thePicker
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    let myPickerData = ["Travel", "Restaurants", "Shopping", "Groceries", "Transportation", "Entertainment", "Health", "Other"]
       
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
    

    @IBAction func onAddBudget(_ sender: Any) {
        
        //send the budget to the API
        APIClient.setBudget(hash: UserDefaults.standard.string(forKey: "hashID")!, category: category.text!, amount: limit.text!)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
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
