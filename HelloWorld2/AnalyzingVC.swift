//
//  AnalyzingVC.swift
//  HelloWorld2
//
//  Created by Team MSUFCU on 9/17/19.
//  Copyright © 2019 Julia Heisler. All rights reserved.
//

import UIKit

class AnalyzingVC: UIViewController {
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        let storyBoardHome = UIStoryboard(name:"Main", bundle: nil)
        let ResultsVC = storyBoardHome.instantiateViewController(withIdentifier: "ResultsVC")
        self.navigationController?.pushViewController(ResultsVC, animated: true)
    }
   
    
    
    
    
    
    
    

}
