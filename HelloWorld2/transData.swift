//
//  transData.swift
//  HopesAndDreams
//
//  Created by Team MSUFCU on 10/14/19.
//  Copyright © 2019 Julia Heisler. All rights reserved.
//

import Foundation

class TransData{
    
    var desc: String
    var amount: String
    var date: String
    var balance: String
    
    init(trans_desc:String, trans_amount:String, trans_date:String, trans_balance:String)
    {
        self.desc = trans_desc
        self.amount = trans_amount
        self.date = trans_date
        self.balance = trans_balance
    }
}
