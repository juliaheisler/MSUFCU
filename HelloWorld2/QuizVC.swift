//
//  QuizVC.swift
//  HelloWorld2
//
//  Created by Julia Heisler on 9/17/19.
//  Copyright © 2019 Julia Heisler. All rights reserved.
//

import UIKit

class QuizVC: UIViewController {
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var option4: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var textIn: UITextField!
    @IBOutlet weak var slideIn: UISlider!
    
    let allQuestions = Quiz()
    var currentQuestion: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //updateQuestion()
    }
    
    override func viewDidAppear(_ animated: Bool) {
           super.viewDidAppear(true)
        
        updateQuestion()
        
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
    
    func updateQuestion() {
        if currentQuestion <= allQuestions.questions.count-1{
            if allQuestions.questions[currentQuestion].questionType == "multiple choice"{
                // Display correct elements
                option1.isHidden = false
                option2.isHidden = false
                option3.isHidden = false
                option4.isHidden = false
                textIn.isHidden = true
                slideIn.isHidden = true
                
                questionLabel.text = allQuestions.questions[currentQuestion].question
                option1.setTitle(allQuestions.questions[currentQuestion].options[0], for: UIControl.State.normal)
                option2.setTitle(allQuestions.questions[currentQuestion].options[1], for: UIControl.State.normal)
                option3.setTitle(allQuestions.questions[currentQuestion].options[2], for: UIControl.State.normal)
                option4.setTitle(allQuestions.questions[currentQuestion].options[3], for: UIControl.State.normal)
            }
            else if allQuestions.questions[currentQuestion].questionType == "slider"{
                // Display correct elements
                option1.isHidden = true
                option2.isHidden = true
                option3.isHidden = true
                option4.isHidden = true
                textIn.isHidden = true
                slideIn.isHidden = false
                
                questionLabel.text = allQuestions.questions[currentQuestion].question
                option1.setTitle(allQuestions.questions[currentQuestion].options[0], for: UIControl.State.normal)
                option2.setTitle(allQuestions.questions[currentQuestion].options[1], for: UIControl.State.normal)
                option3.setTitle(allQuestions.questions[currentQuestion].options[2], for: UIControl.State.normal)
                option4.setTitle(allQuestions.questions[currentQuestion].options[3], for: UIControl.State.normal)
            }
            updateUI()
        }
    }
    
    func updateUI(){
        
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
