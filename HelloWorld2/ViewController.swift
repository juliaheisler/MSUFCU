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
    
    var hashID:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressed(_ sender: Any) {
        
        guard let username = email.text, let pw = password.text, username.count > 0, pw.count > 0 else {return}
        
        APIClient.getHashValue(username: email.text!, password: password.text! )
       // print(UserDefaults.standard.object(forKey: "hashID"))
        if (UserDefaults.standard.string(forKey: "hashID") != "error")
        {
            let storyBoardHome = UIStoryboard(name:"Main", bundle: nil)
            let Dashboard = storyBoardHome.instantiateViewController(withIdentifier: "TabBar")
            self.navigationController?.pushViewController(Dashboard, animated: true)
            
        }
        
//        APIClient.getHash(username: email.text!, pass: password.text! ){result in
//        switch result {
//        case .failure(let error):
//            print(error)
//        case .success(let value):
//            //value is full array of dict from json
//            self.hashID = value
//            let storyBoardHome = UIStoryboard(name:"Main", bundle: nil)
//            let Dashboard = storyBoardHome.instantiateViewController(withIdentifier: "TabBar")
//            self.navigationController?.pushViewController(Dashboard, animated: true)
//
//            }
//        }
            
////        APIClient.getHashValue(username: email.text!, password: password.text! )
//        let storyBoardHome = UIStoryboard(name:"Main", bundle: nil)
//        let Dashboard = storyBoardHome.instantiateViewController(withIdentifier: "TabBar")
//        self.navigationController?.pushViewController(Dashboard, animated: true)
//        if (UserDefaults.standard.object(forKey: "hashID") != nil )
//        {
////            let storyBoardHome = UIStoryboard(name:"Main", bundle: nil)
////            let Dashboard = storyBoardHome.instantiateViewController(withIdentifier: "TabBar")
////            self.navigationController?.pushViewController(Dashboard, animated: true)
//            
//        }
    }
    
}

