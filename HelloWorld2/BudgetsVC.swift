//
//  BudgetsVC.swift
//  HopesAndDreams
//
//  Created by Team MSUFCU on 11/5/19.
//  Copyright © 2019 Julia Heisler. All rights reserved.
//

import UIKit

class BudgetsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var offerarray: [CircularProgressBar] = []
    
         
         override func viewDidLoad() {
             super.viewDidLoad()
            
            tableView.delegate = self
            tableView.dataSource = self
            tableView.reloadData()
             
             //createArray()
            
             
         }
    
    override func viewDidAppear(_ animated: Bool) {
        
        tableView.reloadData()
        super.viewDidAppear(true)
    }
    
        
}




    extension BudgetsVC: UITableViewDataSource, UITableViewDelegate{
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) ->Int{
            return 1
        }
     
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
           // let offer = offerarray[indexPath.row]
            
            let prog = CircularProgressBar()
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProgCell") as! ProgCell
            
            
            cell.setCell(bar: prog)
            
            cell .reloadInputViews()
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
        {
            return 300 //or whatever you need
        }
        
    }
