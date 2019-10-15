//
//  TransCell.swift
//  HopesAndDreams
//
//  Created by Team MSUFCU on 10/14/19.
//  Copyright © 2019 Julia Heisler. All rights reserved.
//

import UIKit

class TransCell: UITableViewCell {

 
    @IBOutlet weak var balance: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var amount: UILabel!
    
    func setTrans(transaction: TransData)
    {
        balance.text = transaction.balance
        date.text = transaction.date
        desc.text = transaction.desc
        amount.text = transaction.amount
    }
}