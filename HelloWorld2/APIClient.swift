//
//  APIClient.swift
//  HopesAndDreams
//
//  Created by Team MSUFCU on 10/13/19.
//  Copyright © 2019 Julia Heisler. All rights reserved.
//

import Foundation
import Alamofire
class APIClient
    
{
    
    static func getHashValue( username: String, password: String)
    {
        let parameters: Parameters = ["user": username, "pass": password]
        Alamofire.request("http://msufcu.meowtap.com:5000/login", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON{ response in
            if let json = response.result.value as? [String: AnyObject]
            {
                if let hash = json["hash"]
                {
                    print(hash)
                    UserDefaults.standard.set(hash, forKey: "hashID")
                    UserDefaults.standard.set(username, forKey: "user")
                }
                
            }
            
                
            }
            //if let hash_val = json["hash"]{
              //  print("Hash is : \(hash_val)")
            //}
        }
    
    
    static func getTransactions( acct: String, rows: String, hash: String)
    {
        let parameters: Parameters = ["accnum": acct, "getrecent": rows, "hash": hash]
        Alamofire.request("http://msufcu.meowtap.com:5000/getdata", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON{ response in
            if let json = response.result.value as? [[String : String]]
            {
               // UserDefaults.standard.set(transactions, forKey: "data")
                //debugPrint(json)
                var transactions = [[String:String]]()
                
                for i in json
                {
                    transactions.append(i)
                    print(i)
                }
                
                UserDefaults.standard.set(transactions, forKey: "data")
                
            }
            
            
        }
        
        
        
        //if let hash_val = json["hash"]{
        //  print("Hash is : \(hash_val)")
        //}
    }
    
    
    
    
    
    
}



