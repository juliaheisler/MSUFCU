//
//  TransCell.swift
//  HopesAndDreams
//
//  Created by Team MSUFCU on 10/14/19.
//  Copyright © 2019 Julia Heisler. All rights reserved.
//

import UIKit

class TransCell: UITableViewCell {

 
    @IBOutlet weak var pluButton: UIButton!
    @IBOutlet weak var balance: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var amount: UILabel!
    
    var amountAdded = "0"
    
    @IBAction func addTrans(_ sender: Any)
    {
        
        
    }
    
    
    
    func setTrans(transaction: TransData)
    {
        let red = UIColor(red: 184/255.0, green: 79/255.0, blue: 78/255.0, alpha: 1.0)
        let green = UIColor(red: 0/255.0, green: 79/255.0, blue: 57/255.0, alpha: 1.0)
        var prog2 = transaction.amount
        
        if prog2[prog2.startIndex] == "-"
        {
            amount.textColor = red
            amount.highlightedTextColor = red
            prog2.remove(at: prog2.startIndex)
            let amt2 = Double(prog2)
            amount.text = String(format: "-$%.02f", amt2!)
        } else{
            amount.textColor = green
            amount.highlightedTextColor = green
            let amt2 = Double(prog2)
            amount.text = String(format: "$%.02f", amt2!)
        }
        
        let prog = transaction.balance
        let amt = Double(prog)
        balance.text = String(format: "Balance: $%.02f", amt!)
        date.text = transaction.date
        var temp = transaction.desc
        print(temp.count)
        if temp.count >= 25 {
            temp.removeSubrange(temp.index(temp.startIndex, offsetBy: 24)..<temp.endIndex)
            temp.append("...")
        }
        desc.text = temp
        
        
        
        pluButton.isHidden = false
        
        
        
        
    }
}
