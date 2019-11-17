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
    @IBAction func onTransfer(_ sender: Any) {
        APIClient.setProg(hash: UserDefaults.standard.string(forKey: "hashID")!, amount: amount.text!)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
