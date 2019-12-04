//
//  NewUserVC.swift
//  HopesAndDreams
//
//  Created by Team MSUFCU on 10/12/19.
//  Copyright © 2019 Julia Heisler. All rights reserved.
//

import UIKit

//initial new user page
class NewUserVC: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var passwordConf: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //disable navigation bar
         self.navigationController?.setNavigationBarHidden(false, animated: false)

        // Do any additional setup after loading the view.
    }
    

}
