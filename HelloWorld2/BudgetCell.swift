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
    
    @IBOutlet weak var limit: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var budgetProg: UIProgressView!
    
    func setCell(budget: Budget)
    {
        var prog = budget.spent
        var amt = Double(prog)
        spent.text = String(format: "$%.02f", amt!)
        category.text = budget.category
        prog = budget.limit
        amt = Double(prog)
        limit.text = String(format: "$%.02f", amt!)
        budgetProg.setProgress(budget.prog, animated: true)
    }
    

}
