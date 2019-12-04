//
//  TransferFundsVC.swift
//  HopesAndDreams
//
//  Created by Team MSUFCU on 11/12/19.
//  Copyright © 2019 Julia Heisler. All rights reserved.
//

import UIKit

class TransferFundsVC: UIViewController {

    @IBOutlet weak var balance: UILabel!

    @IBOutlet weak var amount: UITextField!
    
    //set the goal progress based on the transfer amount
    @IBAction func onTransfer(_ sender: Any) {
        APIClient.setProg(hash: UserDefaults.standard.string(forKey: "hashID")!, amount: amount.text!)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        // get balance
        APIClient.getTransactions(hash: UserDefaults.standard.string(forKey: "hashID")!, rows: "1"){result in
        switch result {
        case .failure(let error):
            print(error)
        case .success(let value):
            //value is full array of dict from json
            for item in value
            {
                self.balance.text = item["trans_balance"]!
                
            }
            
            }
            
        }
        
    }
    


}
