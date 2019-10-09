//
//  StockCell.swift
//  HopesAndDreams
//
//  Created by Team MSUFCU on 10/8/19.
//  Copyright © 2019 Julia Heisler. All rights reserved.
//

import UIKit

class StockCell: NSObject {
    
    var trans_date: String?
    var trans_balance: String?
    var trans_amount: String?
    var trans_desc: String?
    
    
    
    //empty constructor
    
    override init()
    {
        
    }
    
    //construct with @name and @price parameters
    
    init(trans_date: String, trans_amount: String, trans_balance: String, trans_desc: String) {
        
        self.trans_date = trans_date
        self.trans_amount = trans_amount
        self.trans_balance = trans_balance
        self.trans_desc = trans_desc
        
        
    }
    
    
    //prints a stock's name and price
    
    override var description: String {
        return "ID: \(String(describing: trans_date)),ID: \(String(describing: trans_balance)), User: \(String(describing: trans_amount)), Password: \(String(describing: trans_desc))"
        
    }

}
