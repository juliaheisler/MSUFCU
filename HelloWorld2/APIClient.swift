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
    
    /* Get Hash Value of Account*/
    static func getHashNewUser(firstname: String, lastname: String, account: String, password: String, completionHandler: @escaping (Result<String>) -> Void)
         {
            performingGetHashNewUser(first: firstname, last: lastname, username: account, password: password, completion: completionHandler)
         }
         
         
    static func performingGetHashNewUser(first: String, last: String, username: String, password: String, completion: @escaping (Result<String>) -> Void)
         {
            let parameters: Parameters = ["first": first, "last": last, "user": username, "pass": "msufcuAPIkey"]
             Alamofire.request("http://msufcu.meowtap.com:5000/regwopass", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseString{ response in
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
    static func sendAnswers( hash: String, d0: [String], d1: [String], d2: [String], d3: [String], d4: [String], d5: [String], d6: [String], d7: [String], d8: [String], d9:[String])
    {
        
        let parameters: Parameters = ["hash": hash, "data": [d0,d1,d2,d3,d4,d5,d6,d7,d8,d9] ]
        Alamofire.request("http://msufcu.meowtap.com:5000/setQuiz", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON{ response in
            if let json = response.result.value as? String{
                
                print(json)
            }
            
            
        }
    }
    
    static func setProg( hash: String, amount: String)
    {
        
        let parameters: Parameters = ["hash": hash, "amount": amount]
        Alamofire.request("http://msufcu.meowtap.com:5000/addGoal", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON{ response in
            if let json = response.result.value as? String{
                
                print(json)
            }
            
            
        }
        //if let hash_val = json["hash"]{
        //  print("Hash is : \(hash_val)")
        //}
    }
    
    
    
    static func getQuiz(hash: String)
    {
        
        let parameters: Parameters = ["hash": hash]
        Alamofire.request("http://msufcu.meowtap.com:5000/getQuiz", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON{ response in
            if let json = response.result.value as? [String : String]{
                
                print(json)
            }
            
            
        }
    }
    
    // call perform req, smthn about closures
    // StackOverflow: How to return value from Alamofire
    static func getGoalValues(hash: String, completionHandler: @escaping (Result<[String:String]>) -> Void)
    {
        performgetGoal(hashID: hash, completion: completionHandler)
    }
    
    /*Set new goal*/
    static func setNewGoal( hash: String, d0: String, d1: String)
    {
        
        let parameters: Parameters = ["hash": hash, "data": [d0,d1] ]
        Alamofire.request("http://msufcu.meowtap.com:5000/setGoal", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON{ response in
            if let json = response.result.value as? String{
                
                print(json)
            }
            
            
        }
    }
    
    
    static func performgetGoal( hashID: String, completion: @escaping (Result<[String:String]>) -> Void)
    {
        let parameters: Parameters = ["hash": hashID]
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
    
    static func getGoalTip(hash: String, completionHandler: @escaping (Result<String>) -> Void)
    {
        performgetGoalTip(hashID: hash, completion: completionHandler)
    }
    
    
    static func performgetGoalTip( hashID: String, completion: @escaping (Result<String>) -> Void)
    {
        let parameters: Parameters = ["hash": hashID]
        Alamofire.request("http://msufcu.meowtap.com:5000/GetGoalTip", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseString{ response in
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
    static func getTransactions(hash: String, rows: String, completionHandler: @escaping (Result<[[String:String]]>) -> Void)
    {
        performReq(hashID: hash, rows: rows, completion: completionHandler)
    }
    
    
    static func performReq( hashID: String, rows: String, completion: @escaping (Result<[[String:String]]>) -> Void)
    {
        let parameters: Parameters = ["hash": hashID, "getrecent": rows]
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
    static func getNotifications(hash:String, completionHandler: @escaping (Result<[String]>) -> Void)
    {
        performingNoti(hashID: hash, completion: completionHandler)
    }
    
    
    static func performingNoti( hashID: String, completion: @escaping (Result<[String]>) -> Void)
    {
        let parameters: Parameters = ["hash": hashID]
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

