//
//  DashVC.swift
//  HopesAndDreams
//
//  Created by Julia Heisler on 11/11/19.
//  Copyright © 2019 Julia Heisler. All rights reserved.
//

import UIKit
import Lottie

class DashVC: UIViewController {
    
    
    @IBOutlet weak var GoalTipView: UIView!
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
                            self.removeAni()
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
                    let amt = Double(value["3"]!)
                    let budget = value["3"] ?? ""
                    self.goalProgress.label1.text = String("saved out of " + budget.currencyFormatting())
                    let amt2 = Double(value["2"]!)
                    let prog = value["2"] ?? ""
                    self.goalProgress.goalProg.text = String(prog.currencyFormatting())

                   
    
                    let test = Double (value["3"]!)
                    
                    let amount = value["2"] ?? ""
                    let test2 = Double(amount)
                    let res = test2!/test!
                    print(res)
                    self.goalProgress.setProgress(to: res, withAnimation: false)
                    
                    if (amt2! >= amt!)
                    {
                        
                        // need backend logic for this 
//                        self.GoalTipView.backgroundColor =  #colorLiteral(red: 0.7098039216, green: 0.5960784314, blue: 0.3529411765, alpha: 1)
//                        self.GoalTip.text = "Congratulations, you have reached your goal!"
                        
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
                            //let ideal = Float(ideal_prog)
                            
                            let progress = Float(prog)
                            let lim = item["limit"] ?? ""
                            let limit = Float(lim)
                            
                            
                            self.tempBudgets.append(Budget(progress: (progress!/limit!), cat: item["cat"]!, spent: item["progress"]!, limit: item["limit"]!))
                              
                               
                              
                               print(item)
                        
                               
                               
                           }
                         
                           self.tableView.reloadData()
                       }
                       
                       
                       
                   }
            
            APIClient.getNotificationStatus(hash: UserDefaults.standard.string(forKey: "hashID")!){result in
                      switch result {
                      case .failure(let error):
                          print(error)
                      case .success(let value):
                          if value == "1"
                             {
                               UserDefaults.standard.set(true, forKey: "notificationStatus")
                              
                             }else
                             {
                               UserDefaults.standard.set(false, forKey: "notificationStatus")
                              }
                        
                          
                      }
                      
                      
                      
                  }
            
            
            
            
            
            
        }
        
        
        
        override func viewWillAppear(_ animated: Bool) {
            addAni()
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
    
        func addAni(){
            
            //Create a blur blacground
            if !UIAccessibility.isReduceTransparencyEnabled {


                let blurEffect = UIBlurEffect(style: .light)
                let blurEffectView = UIVisualEffectView(effect: blurEffect)
                //always fill the view
                blurEffectView.frame = self.view.bounds
                blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                blurEffectView.tag = 133
                blurEffectView.alpha = 0.0

                view.addSubview(blurEffectView)
                
                //Create the actrual ani view using lottie
                let animationView = AnimationView(name: "load2")
                animationView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
                animationView.center = self.view.center
                animationView.contentMode = .scaleAspectFill
                animationView.loopMode = .loop
                animationView.tag = 233
                animationView.animationSpeed = 0.5
                
                //start it
                animationView.play()
                
                UIView.animate(withDuration: 0.3, delay: 0.0, animations: {
                    blurEffectView.alpha = 1.0
                }, completion: nil)
                view.addSubview(animationView)
                
                
                
                
            }
            
            
        }
        
        func removeAni(){
            if let viewWithTag = self.view.viewWithTag(233), let viewWithTag2 = self.view.viewWithTag(133) {
                UIView.animate(withDuration: 0.5, delay: 0.0, animations: {
                    viewWithTag.alpha = 0.0
                    viewWithTag2.alpha = 0.0
                }, completion: nil)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    viewWithTag.removeFromSuperview()
                    viewWithTag2.removeFromSuperview()
                }
                }else{
                    print("There is no animation views!")
                }
        }

        
    
        
    }


extension DashVC: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 115//or whatever you need
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
    
    init(progress: Float, cat: String, spent: String, limit: String){
        self.category = cat
        self.prog = progress
        self.spent = spent
        self.limit = limit
    }
    
}

extension String {
    // formatting text for currency textField
    func currencyFormatting() -> String {
        if let value = Double(self) {
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            formatter.maximumFractionDigits = 2
            if let str = formatter.string(for: value) {
                return str
            }
        }
        return ""
    }
}
