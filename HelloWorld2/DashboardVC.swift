//
//  DashboardVC.swift
//  HelloWorld2
//
//  Created by Team MSUFCU on 9/24/19.
//  Copyright © 2019 Julia Heisler. All rights reserved.
//

import UIKit

class DashboardVC: UIViewController {
    
    @IBOutlet weak var goalProgress: CircularProgressBar!
    
    //set variable for progress bar here
    //var progress = 0.0
    
    //var goalName = CircularProgressBar().goalName
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        goalProgress.lineWidth = 10
        goalProgress.labelSize = 27
        goalProgress.safePercent = 100
        goalProgress.setProgress(to: 0.5, withAnimation: true)
        
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
