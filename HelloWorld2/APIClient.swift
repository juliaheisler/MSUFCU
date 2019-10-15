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
                print("logged in")
                if let hash = json["hash"]
                {
                    //print(hash)
                    //UserDefaults.standard.set(hash, forKey: "hashID")
                    //UserDefaults.standard.set(username, forKey: "user")
                }
                
            }
            
                
            }
            //if let hash_val = json["hash"]{
              //  print("Hash is : \(hash_val)")
            //}
    }
    
    static func performReq(acct: String, rows: String, completionHandler: @escaping (Result<[[String:String]]>) -> Void)
    {
        getTransactions(acct: acct, rows: rows, completion: completionHandler)
    }
    
    
    static func getTransactions( acct: String, rows: String, completion: @escaping (Result<[[String:String]]>) -> Void)
    {
        let parameters: Parameters = ["accnum": acct, "getrecent": rows]
        Alamofire.request("http://msufcu.meowtap.com:5000/getdata", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON{ response in
            switch response.result
            {
            case .success(let value as [[String:String]]):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            default:
                fatalError("received non dict json response")

                
            }
            
            
        }
        //if let hash_val = json["hash"]{
        //  print("Hash is : \(hash_val)")
        //}
        //print(transactions)
        //return transactions
    }
    
    
    
    //111340 90
//    static func getTransactions( acct: String, rows: String) -> [[String : String]]
//    {
//        var transactions = [[String:String]]()
//        let parameters: Parameters = ["accnum": acct, "getrecent": rows]
//        Alamofire.request("http://msufcu.meowtap.com:5000/getdata", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON{ response in
//            if let json0 = response.result.value as? [[String : String]]
//            {
//                print("i'm in")
//
//                for i in json0
//                {
//                    transactions.append(i)
//                    print(transactions)
//                    print("OKOKOK")
//                    //print(i)
//                }
//
//
//            }
//
//
//        }
//        //if let hash_val = json["hash"]{
//        //  print("Hash is : \(hash_val)")
//        //}
//        //print(transactions)
//        return transactions
//    }
    
    

    
    
    
    
    
    
    
    
    
}



