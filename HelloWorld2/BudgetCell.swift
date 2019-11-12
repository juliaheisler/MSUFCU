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
        spent.text = budget.spent
        category.text = budget.category
        limit.text = budget.limit
        budgetProg.setProgress(0.0, animated: true)
    }
    

}
