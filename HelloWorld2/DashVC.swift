//
//  DashVC.swift
//  HopesAndDreams
//
//  Created by Julia Heisler on 11/11/19.
//  Copyright © 2019 Julia Heisler. All rights reserved.
//

import UIKit

class DashVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var goalProgress: CircularProgressBar!
    var tempBudgets = [Budget]()
   
        func fetch_data()
        {
            
            APIClient.getGoalValues(account: "11134027"){result in
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let value):
                    //value is full array of dict from json
                    
                    self.goalProgress.goalName.text = value["1"]
                    let budget = value["3"] ?? ""
                    self.goalProgress.label1.text = "saved out of $" + budget
                    self.goalProgress.goalProg.text = value["2"]
                    
                    
                    let test = Double (budget)
                    
                    let amount = value["2"] ?? ""
                    let test2 = Double(amount)
                    let res = test2!/test!
                    print(res)
                    self.goalProgress.setProgress(to: res, withAnimation: true)
                    
                }
                print( UserDefaults.standard.string(forKey: "hashID")!)
                
            }
            
            
        }
        
        
        
        override func viewWillAppear(_ animated: Bool) {
            
            tableView.delegate = self
            tableView.dataSource = self
            
            tempBudgets.append(Budget(progress: 0, cat: "Test", spent: "0", limit: "100"))
            tempBudgets.append(Budget(progress: 0, cat: "Test", spent: "0", limit: "100"))
            self.tableView.reloadData()
            
            
            goalProgress.lineWidth = 10
            goalProgress.labelSize = 27
                   //
            goalProgress.safePercent = 100
            
            fetch_data()
             super.viewWillAppear(animated)
            
            
            
        }

        
    
        
    }


extension DashVC: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 200//or whatever you need
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) ->Int{
        return tempBudgets.count
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let budget = tempBudgets[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BudgetCell") as! BudgetCell
        
        
        cell.setCell(budget: budget)
        
        return cell
    }
    
}


class Budget
{
    var prog: Float
    var category: String
    var spent: String
    var limit: String
    
    init(progress: Float, cat: String, spent: String, limit: String) {
        self.category = cat
        self.prog = progress
        self.spent = spent
        self.limit = limit
    }
    
}