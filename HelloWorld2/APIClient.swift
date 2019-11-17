//
//  APIClient.swift
//  HopesAndDreams
//
//  Created by Team MSUFCU on 10/13/19.
//  Copyright © 2019 Julia Heisler. All rights reserved.
//
import Foundation
import Alamofire
class APIClient{
    
    /* Get Hash Value of Account*/
       static func getHash(username: String, password: String, completionHandler: @escaping (Result<String>) -> Void)
            {
               performingGetHash(username: username, password: password, completion: completionHandler)
            }
            
            
       static func performingGetHash(username: String, password: String, completion: @escaping (Result<String>) -> Void)
            {
                let parameters: Parameters = ["user": username, "pass": password]
                Alamofire.request("http://msufcu.meowtap.com:5000/login", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseString{ response in
                        switch response.result
                        {
                        case .success(let value as String):
                            completion(.success(value))
                        case .failure(let error):
                            completion(.failure(error))
                        default:
                            fatalError("received non dict json response")
                            
                       }
                }
            }
    
    
    
    
    /*Get Personalized Offers*/
    static func getOffers(hash:String, completionHandler: @escaping (Result<[[String:String]]>) -> Void)
         {
            performingGetOffers(hashID: hash, completion: completionHandler)
         }
         
         
    static func performingGetOffers(hashID: String, completion: @escaping (Result<[[String:String]]>) -> Void)
         {
             let parameters: Parameters = ["hash": hashID]
             Alamofire.request("http://msufcu.meowtap.com:5000/offers", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON{ response in
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
         }
     /*Get All Offers besides your personalized offers*/
    static func getAllOffers(hash:String, completionHandler: @escaping (Result<[[String:String]]>) -> Void)
         {
            performingGetAllOffers(hashID: hash, completion: completionHandler)
         }
         
         
    static func performingGetAllOffers(hashID: String, completion: @escaping (Result<[[String:String]]>) -> Void)
         {
             let parameters: Parameters = ["hash": hashID]
             Alamofire.request("http://msufcu.meowtap.com:5000/alloffers", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON{ response in
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
         }
    
    /*Send the Answers from the Quiz*/
    static func sendAnswers( account: String, d0: [String], d1: [String], d2: [String], d3: [String], d4: [String], d5: [String], d6: [String], d7: [String], d8: [String], d9:[String])
    {
        
        let parameters: Parameters = ["account": "11134027", "data": [d0,d1,d2,d3,d4,d5,d6,d7,d8,d9] ]
        Alamofire.request("http://msufcu.meowtap.com:5000/setQuiz", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON{ response in
            if let json = response.result.value as? String{
                
                print(json)
            }
            
            
        }
    }
    
    static func setProg( account: String, amount: String)
    {
        
        let parameters: Parameters = ["account": "11134027", "amount": amount]
        Alamofire.request("http://msufcu.meowtap.com:5000/addGoal", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON{ response in
            if let json = response.result.value as? String{
                
                print(json)
            }
            
            
        }
        //if let hash_val = json["hash"]{
        //  print("Hash is : \(hash_val)")
        //}
    }
    
    
    
    static func getQuiz(account: String)
    {
        
        let parameters: Parameters = ["account": "11134027"]
        Alamofire.request("http://msufcu.meowtap.com:5000/getQuiz", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON{ response in
            if let json = response.result.value as? [String : String]{
                
                print(json)
            }
            
            
        }
    }
    
    // call perform req, smthn about closures
    // StackOverflow: How to return value from Alamofire
    static func getGoalValues(account:String, completionHandler: @escaping (Result<[String:String]>) -> Void)
    {
        performgetGoal(acct: account, completion: completionHandler)
    }
    
    
    static func performgetGoal( acct: String, completion: @escaping (Result<[String:String]>) -> Void)
    {
        let parameters: Parameters = ["account": acct]
        Alamofire.request("http://msufcu.meowtap.com:5000/getQuiz", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON{ response in
            switch response.result
            {
            case .success(let value as [String:String]):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            default:
                fatalError("received non dict json response")
                
                
            }
            
            
        }
    }
    
    
    
    
    // call perform req, smthn about closures
    // StackOverflow: How to return value from Alamofire
    static func getTransactions(acct: String, rows: String, completionHandler: @escaping (Result<[[String:String]]>) -> Void)
    {
        performReq(acct: acct, rows: rows, completion: completionHandler)
    }
    
    
    static func performReq( acct: String, rows: String, completion: @escaping (Result<[[String:String]]>) -> Void)
    {
        let parameters: Parameters = ["hash": acct, "getrecent": rows]
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
    }
    
    
    
       static func getNotificationStatus(hash:String, completionHandler: @escaping (Result<String>) -> Void)
            {
               performingGetNotiStatus(hashID: hash, completion: completionHandler)
            }
    
    static func performingGetNotiStatus( hashID: String, completion: @escaping (Result<String>) -> Void)
       {
           let parameters: Parameters = ["hash": hashID]
           Alamofire.request("http://msufcu.meowtap.com:5000/isNewNoti", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseString{ response in
               switch response.result
               {
               case .success(let value as String):
                   completion(.success(value))
               case .failure(let error):
                   completion(.failure(error))
               default:
                   fatalError("received non dict json response")
                   
                   
               }
               
               
           }
           
           
       }
    
    
    // call perform req, smthn about closures
    // StackOverflow: How to return value from Alamofire
    static func getNotifications(account:String, completionHandler: @escaping (Result<[String]>) -> Void)
    {
        performingNoti(acct: account, completion: completionHandler)
    }
    
    
    static func performingNoti( acct: String, completion: @escaping (Result<[String]>) -> Void)
    {
        let parameters: Parameters = ["account": acct]
        Alamofire.request("http://msufcu.meowtap.com:5000/notify", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON{ response in
            switch response.result
            {
            case .success(let value as [String]):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            default:
                fatalError("received non dict json response")
                
                
            }
            
            
        }
        
        
    }
    
    
    
    static func setBudget( hash: String, category: String, amount: String)
       {
           
        let parameters: Parameters = ["hash": hash, "cat": category, "amount": amount]
           Alamofire.request("http://msufcu.meowtap.com:5000/SetBudget", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON{ response in
               if let json = response.result.value as? String{
                   
                   print(json)
               }
               
               
           }
           //if let hash_val = json["hash"]{
           //  print("Hash is : \(hash_val)")
           //}
       }
    
    
    
    static func getBudget(hash: String, completionHandler: @escaping (Result<[[String:String]]>) -> Void)
       {
        performGetBudget(hashID: hash, completion: completionHandler)
        
       }
       
       
    static func performGetBudget( hashID: String, completion: @escaping (Result<[[String:String]]>) -> Void)
       {
        let parameters: Parameters = ["hash": hashID]
           Alamofire.request("http://msufcu.meowtap.com:5000/GetBudget", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON{ response in
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
       }
    
    static func getBreakdown(hash: String, completionHandler: @escaping (Result<[String]>) -> Void)
          {
           performGetBreakdown(hashID: hash, completion: completionHandler)
           
          }
          
          
       static func performGetBreakdown( hashID: String, completion: @escaping (Result<[String]>) -> Void)
          {
           let parameters: Parameters = ["hash": hashID]
              Alamofire.request("http://msufcu.meowtap.com:5000/GetBreakdown", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON{ response in
                  switch response.result
                  {
                  case .success(let value as [String]):
                      completion(.success(value))
                  case .failure(let error):
                      completion(.failure(error))
                  default:
                      fatalError("received non dict json response")
                      
                      
                  }
                  
                  
              }
          }
    
    static func setAlexaPin( hash: String, email: String, pin: String)
    {
        
        let parameters: Parameters = ["hash": hash , "email": email, "pin": pin ]
        Alamofire.request("http://msufcu.meowtap.com:5000/AlexaSetPinEmail", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON{ response in
            if let json = response.result.value as? String{
                
                print(json)
            }
            
            
        }
        //if let hash_val = json["hash"]{
        //  print("Hash is : \(hash_val)")
        //}
    }
    
  static func getUser(hash:String, completionHandler: @escaping (Result<String>) -> Void)
            {
               performingGetUser(hashID: hash, completion: completionHandler)
            }
    
    static func performingGetUser( hashID: String, completion: @escaping (Result<String>) -> Void)
       {
           let parameters: Parameters = ["hash": hashID]
           Alamofire.request("http://msufcu.meowtap.com:5000/GetUserName", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseString{ response in
               switch response.result
               {
               case .success(let value as String):
                   completion(.success(value))
               case .failure(let error):
                   completion(.failure(error))
               default:
                   fatalError("received non dict json response")
                   
                   
               }
               
               
           }
           
           
       }
    
    
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

