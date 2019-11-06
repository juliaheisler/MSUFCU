//
//  ProgCell.swift
//  
//
//  Created by Team MSUFCU on 11/5/19.
//

import UIKit

class ProgCell: UITableViewCell {

    @IBOutlet weak var progBar: CircularProgressBar!
    
    func setCell (bar : CircularProgressBar)
    {
        progBar.lineWidth = 10
        progBar.labelSize = 27
        progBar.safePercent = 100
        
        fetch_data()
        reloadInputViews()
    }
    
    
func fetch_data()
{
    
    APIClient.getGoalValues(account: "11134027"){result in
        switch result {
        case .failure(let error):
            print(error)
        case .success(let value):
            //value is full array of dict from json
            
            self.progBar.goalName.text = value["1"]
            let budget = value["3"] ?? ""
            self.progBar.label1.text = "saved out of $" + budget
            self.progBar.goalProg.text = value["2"]
            
            
            let test = Double (budget)
            
            let amount = value["2"] ?? ""
            let test2 = Double(amount)
            let res = test2!/test!
            print(res)
            self.progBar.setProgress(to: res, withAnimation: true)
            
        }
        print( UserDefaults.standard.string(forKey: "hashID")!)
        
    }
    

}
}
