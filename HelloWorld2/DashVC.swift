//
//  DashVC.swift
//  HopesAndDreams
//
//  Created by Julia Heisler on 11/11/19.
//  Copyright © 2019 Julia Heisler. All rights reserved.
//

import UIKit

class DashVC: UIViewController {
    
    
    @IBOutlet weak var GoalTip: UILabel!
    
    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var goalProgress: CircularProgressBar!
    var tempBudgets = [Budget]()
   
    
    @IBAction func addBudget(_ sender: Any)
    {
        
        
    }
    func fetch_data()
        {
            
            APIClient.getGoalTip(hash: UserDefaults.standard.string(forKey: "hashID")!){result in
                        switch result {
                        case .failure(let error):
                            print(error)
                        case .success(let value):
                            if value != "error"
                            {
                                self.GoalTip.text = value
                                
                            }
                            print(value)
                            
                            
                        }
                        
                        
                    }
            
            
            
            
            APIClient.getGoalValues(hash: UserDefaults.standard.string(forKey: "hashID")!){result in
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let value):
                    //value is full array of dict from json
                    
                    self.goalProgress.goalName.text = value["1"]
                    let budget = value["3"] ?? ""
                    let amt = Double(budget)
                    self.goalProgress.label1.text = String(format: "saved out of $%.02f", amt!)
                    let prog = value["2"] ?? ""
                    let amt2 = Double(prog)
                    self.goalProgress.goalProg.text = String(format: "$%.02f", amt2!)
    
                    let test = Double (budget)
                    
                    let amount = value["2"] ?? ""
                    let test2 = Double(amount)
                    let res = test2!/test!
                    print(res)
                    self.goalProgress.setProgress(to: res, withAnimation: false)
                    
                    if (amt2! >= amt!)
                    {
                       print("Goal Reached!!!!")
                        
                    }
                    
                }
                print( UserDefaults.standard.string(forKey: "hashID")!)
                
            }
            
            
            
            
            APIClient.getBudget(hash: UserDefaults.standard.string(forKey: "hashID")!){result in
                       switch result {
                       case .failure(let error):
                           print(error)
                       case .success(let value):
                           //value is full array of dict from json
                           self.tempBudgets = []
                           for item in value
                           {
                            let prog = item["progress"] ?? ""
                            let ideal_prog = item["ideal"] ?? ""
                            let ideal = Float(ideal_prog)
                            
                            let progress = Float(prog)
                            let lim = item["limit"] ?? ""
                            let limit = Float(lim)
                            
                            
                            self.tempBudgets.append(Budget(progress: (progress!/limit!), cat: item["cat"]!, spent: item["progress"]!, limit: item["limit"]!, ideal_progress: (ideal!/limit!)))
                              
                               
                              
                               print(item)
                        
                               
                               
                           }
                         
                           self.tableView.reloadData()
                       }
                       
                       
                       
                   }
            
            
        }
        
        
        
        override func viewWillAppear(_ animated: Bool) {
            self.navigationController?.setNavigationBarHidden(true, animated: false)
          
            
            tableView.delegate = self
            tableView.dataSource = self
            
           // tempBudgets.append(Budget(progress: 0, cat: "Test", spent: "0", limit: "100"))
            //tempBudgets.append(Budget(progress: 0, cat: "Test", spent: "0", limit: "100"))
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
        return 120//or whatever you need
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
    var ideal_prog: Float
    
    init(progress: Float, cat: String, spent: String, limit: String, ideal_progress: Float) {
        self.category = cat
        self.prog = progress
        self.spent = spent
        self.limit = limit
        self.ideal_prog = ideal_progress
    }
    
}
