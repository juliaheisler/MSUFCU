//
//  FeedModel.swift
//  HopesAndDreams
//
//  Created by Team MSUFCU on 10/8/19.
//  Copyright © 2019 Julia Heisler. All rights reserved.
//
import Foundation
import UIKit

protocol FeedModelProtocol: class {
    func itemsDownloaded(items: NSArray)
}

class FeedModel: NSObject, URLSessionDataDelegate{
    
    weak var delegate: FeedModelProtocol!
    
 
    
    
    
    
}
    
    func parseJSON(_ data:Data) {
        
        var jsonResult = NSArray()
        
        do{
            jsonResult = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.allowFragments) as! NSArray
            
        } catch let error as NSError {
            print(error)
            
        }
        
        var jsonElement = NSDictionary()
        let stocks = NSMutableArray()
        //var transactions: Array<Array<String>> = Array()
        var temp: [String] = []
        
        for i in 0 ..< jsonResult.count
        {
            
            jsonElement = jsonResult[i] as! NSDictionary
            
            let stock = StockCell()
            
            //the following insures none of the JsonElement values are nil through optional binding
            //the following insures none of the JsonElement values are nil through optional binding
            if let trans_date = jsonElement["trans_date"] as? String,
                let trans_amount = jsonElement["trans_amount"] as? String,
                let trans_balance = jsonElement["trans_balance"] as? String,
                let trans_desc = jsonElement["trans_desc"] as? String
                
            {
                //var temp: [String] = []
                temp.append(trans_date)
                temp.append(trans_amount)
                temp.append(trans_balance)
                temp.append(trans_desc)
                //print(temp)
                stock.trans_date = trans_date
                stock.trans_balance = trans_balance
                stock.trans_amount = trans_amount
                
                stock.trans_desc = trans_desc
                
                
            }
            
            
            stocks.add(stock)
            transactions.append(temp)
            
            temp = []
            
        }
        print(transactions)
        DispatchQueue.main.async(execute: { () -> Void in
            
            self.delegate.itemsDownloaded(items: stocks)
            
        })
    }
}
