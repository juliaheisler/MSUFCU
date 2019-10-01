//
//  QuizVC.swift
//  HelloWorld2
//
//  Created by Julia Heisler on 9/17/19.
//  Copyright © 2019 Julia Heisler. All rights reserved.
//

import UIKit

class QuizVC: UIViewController {
    

    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var option4: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    

    @IBAction func answerPressed(_ sender: UIButton) {
        
        if sender.tag == 1{
            
            option1.alpha = 0.5
        }else if sender.tag == 2{
                option2.alpha = 0.5
            
        }else if sender.tag == 3{
            option3.alpha = 0.5
            
        }else if sender.tag == 4{
            option4.alpha = 0.5
            
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
