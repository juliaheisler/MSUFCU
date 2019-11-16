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
        amountAdded = amount.text!
        
        APIClient.setProg(account: "11134027", amount: amountAdded)
        print(amountAdded)
        
        pluButton.isHidden = true
        
        
    }
    
    
    
    func setTrans(transaction: TransData)
    {
        let prog = transaction.balance
        let amt = Double(prog)
        balance.text = String(format: "Balance: $%.02f", amt!)
        date.text = transaction.date
        desc.text = transaction.desc
        let prog2 = transaction.amount
        let amt2 = Double(prog2)
        amount.text = String(format: "$%.02f", amt2!)
        
        pluButton.isHidden = false
        
//        let temp: String = transaction.amount
//
//        if temp[temp.startIndex] == "-"
//        {
//            pluButton.isHidden = false
//
//
//        }
//        else
//        {
//            pluButton.isHidden = false
//        }
        
        
    }
}
