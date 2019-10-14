//
//  TransactionCell.swift
//  HopesAndDreams
//
//  Created by Team MSUFCU on 10/13/19.
//  Copyright © 2019 Julia Heisler. All rights reserved.
//

import UIKit

struct Transaction{
    
}

class TransactionTableViewCell: UITableViewCell{
    
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var balance: UILabel!
    @IBOutlet weak var trans: UILabel!
    @IBOutlet weak var charge: UILabel!
    
}

class tempViewVS: UITableViewController
{
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        as! TransactionTableViewCell
    }
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        

    }
    
}
