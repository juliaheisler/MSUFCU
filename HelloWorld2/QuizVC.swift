//
//  QuizVC.swift
//  HelloWorld2
//
//  Created by Julia Heisler on 9/17/19.
//  Copyright © 2019 Julia Heisler. All rights reserved.
//

import UIKit

class QuizVC: UIViewController {
    
    @IBOutlet weak var questionCounter: UILabel!
    @IBOutlet weak var imageShown: UIImageView!
    @IBOutlet weak var question: UITextView!
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var option4: UIButton!
    
    var answerSelected = 0
    var questionNumber = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    

    @IBAction func answerPressed(_ sender: UIButton) {
        
//        if sender.tag == 1 {
//            print("option 1 pressed")
//        }
//        if sender.tag == 2 {
//            print("option 2 pressed")
//        }
//        if sender.tag == 3 {
//            print("option 3 pressed")
//        }
//        if sender.tag == 4 {
//            print("option 4 pressed")
//        }
        
        //eventually -- append to question/answer list
        //
       // answerSelected = sender.tag
        
        
        func NextQuestion()
        {
            // write this
            
        }
        
        func UpdateUI()
        {
            //write this
            
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
