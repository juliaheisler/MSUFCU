//
//  DashboardVC.swift
//  HelloWorld2
//
//  Created by Team MSUFCU on 9/24/19.
//  Copyright © 2019 Julia Heisler. All rights reserved.
//

import UIKit

class DashboardVC: UIViewController {
    
    @IBOutlet weak var goalProgress: CircularProgressBar!
    
    
    
    //set variable for progress bar here
    //var progress = 0.0
    
    //var goalName = CircularProgressBar().goalName
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        APIClient.getGoalValues(account: "11134090"){result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let value):
                //value is full array of dict from json

                self.goalProgress.goalName.text = value["4"]
                let budget = value["6"] ?? ""
                self.goalProgress.label1.text = "saved out of $" + budget
                self.goalProgress.goalProg.text = value["5"]


                let test = Double (budget)

                let amount = value["5"] ?? ""
                let test2 = Double(amount)
                let res = test2!/test!
                print(res)
                self.goalProgress.setProgress(to: res, withAnimation: true)
            }


        }

        // Do any additional setup after loading the view.
        goalProgress.lineWidth = 10
        goalProgress.labelSize = 27

        goalProgress.safePercent = 100
        
        
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
