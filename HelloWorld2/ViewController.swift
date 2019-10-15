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
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressed(_ sender: Any) {
        
        guard let username = email.text, let pw = password.text, username.count > 0, pw.count > 0 else {return
            
        }
        APIClient.getHashValue(username: email.text!, password: password.text! )
        let storyBoardHome = UIStoryboard(name:"Main", bundle: nil)
        let Dashboard = storyBoardHome.instantiateViewController(withIdentifier: "TabBar")
        self.navigationController?.pushViewController(Dashboard, animated: true)
        if (UserDefaults.standard.object(forKey: "hashID") != nil )
        {
//            let storyBoardHome = UIStoryboard(name:"Main", bundle: nil)
//            let Dashboard = storyBoardHome.instantiateViewController(withIdentifier: "TabBar")
//            self.navigationController?.pushViewController(Dashboard, animated: true)
            
        }
    }
    
}

