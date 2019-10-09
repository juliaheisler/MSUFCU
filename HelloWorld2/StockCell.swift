//
//  StockCell.swift
//  HopesAndDreams
//
//  Created by Team MSUFCU on 10/8/19.
//  Copyright © 2019 Julia Heisler. All rights reserved.
//

import UIKit

class StockCell: NSObject {
    
    var id: String?
    var user: String?
    var password: String?
    
    
    
    //empty constructor
    
    override init()
    {
        
    }
    
    //construct with @name and @price parameters
    
    init(id: String, user: String, password: String) {
        
        self.id = id
        self.user = user
        self.password = password
        
        
    }
    
    
    //prints a stock's name and price
    
    override var description: String {
        return "ID: \(String(describing: id)), User: \(String(describing: user)), Password: \(String(describing: password))"
        
    }

}
