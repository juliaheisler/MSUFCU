//
//  BudgetCell.swift
//  HopesAndDreams
//
//  Created by Team MSUFCU on 11/11/19.
//  Copyright © 2019 Julia Heisler. All rights reserved.
//

import UIKit

class BudgetCell: UITableViewCell {
    @IBOutlet weak var spent: UILabel!
    
    @IBOutlet weak var idealProg: UIProgressView!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var budgetProg: UIProgressView!
    
    func setCell(budget: Budget)
    {
        let prog = budget.spent
        let prg_amt = Double(prog)
        var lim = budget.limit
        let lim_amt = Double(lim)
        lim = String(format: "$%.02f", lim_amt!)
        spent.text = " " + String(format: "$%.02f", prg_amt!)+" out of " + lim
        category.text = budget.category
    
        
        
        budgetProg.transform = CGAffineTransform(scaleX: 1, y: 14)
        budgetProg.trackTintColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 0.6031678082)
        
        if (budget.prog >= 0.5 && budget.prog < 1)
        {
            budgetProg.tintColor = #colorLiteral(red: 0.9886597991, green: 0.9018037319, blue: 0.08357847482, alpha: 1)
        }
        else if (budget.prog >= 1)
        {
            budgetProg.tintColor = #colorLiteral(red: 0.7215686275, green: 0.3098039216, blue: 0.3058823529, alpha: 1)
            
        }
        else
        {
            budgetProg.tintColor = #colorLiteral(red: 0.4835554361, green: 0.7841576934, blue: 0.06046832353, alpha: 1)
        }
        
        budgetProg.setProgress(budget.prog, animated: false)
        
        
        idealProg.transform = CGAffineTransform(scaleX: 1, y: 14)
        idealProg.trackTintColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 0.6031678082)
        idealProg.setProgress(budget.ideal_prog, animated: false)
        
        
    }
    
    
    

}
