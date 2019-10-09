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
    
    let urlPath = "http://webdev.cse.msu.edu/~yangti18/cse476/step6/test.php" //Change to the web address of your stock_service.php file
    
    func downloadItems() {
        
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print("Error")
            }else {
                print("stocks downloaded")
                self.parseJSON(data!)
            }
            
        }
        
        task.resume()
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
        
        for i in 0 ..< jsonResult.count
        {
            
            jsonElement = jsonResult[i] as! NSDictionary
            
            let stock = StockCell()
            
            //the following insures none of the JsonElement values are nil through optional binding
            //the following insures none of the JsonElement values are nil through optional binding
            if let id = jsonElement["id"] as? String,
                let user = jsonElement["user"] as? String,
                let password = jsonElement["password"] as? String
                
            {
                print(id)
                print(user)
                print(password)
                stock.id = id
                stock.user = user
                stock.password = password
                
                
            }
            
            stocks.add(stock)
            
        }
        
        DispatchQueue.main.async(execute: { () -> Void in
            
            self.delegate.itemsDownloaded(items: stocks)
            
        })
    }
}
