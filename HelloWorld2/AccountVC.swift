//
//  AccountVC.swift
//  HopesAndDreams
//
//  Created by Team MSUFCU on 11/17/19.
//  Copyright © 2019 Julia Heisler. All rights reserved.
//

import UIKit

class AccountVC: UIViewController {

    @IBOutlet weak var name: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        APIClient.getUser(hash: UserDefaults.standard.string(forKey: "hashID")!){result in
                        switch result {
                        case .failure(let error):
                            print(error)
                        case .success(let value):
                          self.name.text = value
                      
                            
                        }
                        
                        
                        
                    }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
