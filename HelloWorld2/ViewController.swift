//
//  ViewController.swift
//  HelloWorld2
//
//  Created by Julia Heisler on 9/9/19.
//  Copyright © 2019 Julia Heisler. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.navigationController?.setNavigationBarHidden(true, animated: false)
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressed(_ sender: Any) {
        
        guard let username = email.text, let pw = password.text, username.count > 0, pw.count > 0 else {return}
        
//        APIClient.getHashValue(username: email.text!, password: password.text! )
//       // print(UserDefaults.standard.object(forKey: "hashID"))
//
//        //UserDefaults.standard.string(forKey: "hashID") != "error"
//        if (singleton.hashID != "error")
//        {
//            let storyBoardHome = UIStoryboard(name:"Main", bundle: nil)
//            let Dashboard = storyBoardHome.instantiateViewController(withIdentifier: "TabBar")
//            self.navigationController?.pushViewController(Dashboard, animated: true)
//
//        }
        
        handleLogin()
        
    }
    //APIClient.getHashValue(username: email.text!, password: password.text!
    func handleLogin(){
        //APIClient.getHashValue(username: email.text!, password: password.text! )
        
        APIClient.getHash(username: email.text!, password: password.text! ){result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let value):
                UserDefaults.standard.set(value, forKey: "hashID")
                //value is full array of dict from json
                
                
                self.handleNoti()
            }
            
            
            
        }
        
        
        
    }
    
    func handleNoti(){
                APIClient.getNotificationStatus(hash: UserDefaults.standard.string(forKey: "hashID")!){result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let value):
                if value == "1"
                   {
                     UserDefaults.standard.set(true, forKey: "notificationStatus")
                    
                   }else
                   {
                     UserDefaults.standard.set(false, forKey: "notificationStatus")
                    }
                
                self.switchSB()
            }
            
            
            
        }
        
        
        
    }
    
    func switchSB(){
        if (UserDefaults.standard.string(forKey: "hashID") != "error")
        {
            let storyBoardHome = UIStoryboard(name:"Main", bundle: nil)
            let Dashboard = storyBoardHome.instantiateViewController(withIdentifier: "TabBar")
            self.navigationController?.pushViewController(Dashboard, animated: true)
        }
    }
    
}
