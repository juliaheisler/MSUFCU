//
//  HomeScreenVCViewController.swift
//  HopesAndDreams
//
//  Created by Team MSUFCU on 11/5/19.
//  Copyright © 2019 Julia Heisler. All rights reserved.
//

import UIKit

class HomeScreenVCViewController: UIViewController {

    @IBOutlet weak var Goals: UIView!
    @IBOutlet weak var Budgets: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func switchViews(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0
        {
            Goals.alpha = 1
            Budgets.alpha = 0
        }
        
        if sender.selectedSegmentIndex == 1
        {
            Goals.alpha = 0
            Budgets.alpha = 1
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
