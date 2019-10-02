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
    @IBOutlet weak var startLabel: UILabel!
    @IBOutlet weak var endLabel: UILabel!
    @IBOutlet weak var NextQuestion: UIButton!
    let allQuestions = Quiz()
    var currentQuestion: Int = 0
    var selectedAnswer: Int = 0
    var tempStorage = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateQuestion()
    }
    
    override func viewDidAppear(_ animated: Bool) {
           super.viewDidAppear(true)
        
    }

    

    @IBAction func answerPressed(_ sender: UIButton) {
        
        selectedAnswer = sender.tag
        
        if selectedAnswer == 1{
            option1.alpha = 0.5
            option2.alpha = 1
            option3.alpha = 1
            option4.alpha = 1
        }else if selectedAnswer == 2{
            option1.alpha = 1
            option2.alpha = 0.5
            option3.alpha = 1
            option4.alpha = 1
            
        }else if selectedAnswer == 3{
            option1.alpha = 1
            option2.alpha = 1
            option3.alpha = 0.5
            option4.alpha = 1
            
        }else if selectedAnswer == 4{
            option1.alpha = 1
            option2.alpha = 1
            option3.alpha = 1
            option4.alpha = 0.5
            
        }
        
    }
    
    @IBAction func sliderChange(_ sender: UISlider) {
        selectedAnswer = Int(sender.value)
    }
    
    @IBAction func nextPressed(_ sender: UIButton) {
        //append to array before calling new question
        
        currentQuestion += 1
        updateQuestion()
    }
    
    
    func updateQuestion() {
        if currentQuestion == allQuestions.questions.count-1
        {
            NextQuestion.setTitle("Finish Quiz →", for: .normal)
            
        }
        
        if currentQuestion < allQuestions.questions.count{
            selectedAnswer = 0
            if allQuestions.questions[currentQuestion].questionType == "multiple choice"{
                // Display correct elements
                option1.isHidden = false
                option2.isHidden = false
                option3.isHidden = false
                option4.isHidden = false
                option1.alpha = 1
                option2.alpha = 1
                option3.alpha = 1
                option4.alpha = 1
                textIn.isHidden = true
                slideIn.isHidden = true
                startLabel.isHidden = true
                endLabel.isHidden = true
                
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
                slideIn.value = 1
                startLabel.isHidden = false
                endLabel.isHidden = false
                
                questionLabel.text = allQuestions.questions[currentQuestion].question
                startLabel.text = allQuestions.questions[currentQuestion].options[0]
                endLabel.text = allQuestions.questions[currentQuestion].options[1]
            }
            else if allQuestions.questions[currentQuestion].questionType == "text"{
                // Display correct elements
                option1.isHidden = true
                option2.isHidden = true
                option3.isHidden = true
                option4.isHidden = true
                textIn.isHidden = false
                slideIn.isHidden = true
                startLabel.isHidden = true
                endLabel.isHidden = true
                
                questionLabel.text = allQuestions.questions[currentQuestion].question
            }
        }
        else {
            // Quiz end
            let storyBoardHome = UIStoryboard(name:"Main", bundle: nil)
            let Analyzing = storyBoardHome.instantiateViewController(withIdentifier: "AnalyzingVC")
            self.navigationController?.pushViewController(Analyzing, animated: true)
            
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
