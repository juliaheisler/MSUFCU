//
//  QuizVC.swift
//  HelloWorld2
//
//  Created by Julia Heisler on 9/17/19.
//  Copyright © 2019 Julia Heisler. All rights reserved.
//

import UIKit

class QuizVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
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
       @IBOutlet weak var category: UITextField!
    
    let myPickerData = ["Travel", "Education", "Event", "Home", "Automotive", "Family", "Other"]
    
    var thePicker = UIPickerView()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
      return  1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myPickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myPickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        category.text = myPickerData[row]
        self.view.endEditing(false)
    }

  


    
    
    
    let allQuestions = Quiz()
    var currentQuestion: Int = 0
    var selectedAnswer: Int = 0
    var tempStorage = [Int: [String]]()
    var checkAnswers = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        thePicker.delegate = self
        thePicker.dataSource = self
        
        category.inputView = thePicker
    
        // Do any additional setup after loading the view.
        updateQuestion()
    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
    }

    

    @IBAction func answerPressed(_ sender: UIButton) {
        
        nextButton.isEnabled = true
        
        selectedAnswer = sender.tag
        
        
        
        
        if allQuestions.questions[currentQuestion].questionType != "check"
        {
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
            //if question type allows for multiple answers
        else {
            
            if sender.alpha==1{
                sender.alpha = 0.5
                checkAnswers.append(allQuestions.questions[currentQuestion].options[selectedAnswer-1])
            }
            else{
                sender.alpha = 1
                let i = checkAnswers.firstIndex(of: allQuestions.questions[currentQuestion].options[selectedAnswer-1])
                checkAnswers.remove(at: i!)
            }
            
            
        }
        
        
    }
    
    @IBAction func sliderChange(_ sender: UISlider) {
        selectedAnswer = Int(sender.value)
    }
    
    @IBAction func nextPressed(_ sender: UIButton) {
        //append to dictionary before going to next question
        
        if allQuestions.questions[currentQuestion].questionType == "multiple choice"
        {
            tempStorage[currentQuestion] = [allQuestions.questions[currentQuestion].options[selectedAnswer-1]]
            
        }
        
        else if allQuestions.questions[currentQuestion].questionType == "slider"
        {
            
            tempStorage[currentQuestion] = [String(slideIn.value)]
        }
        
        else if allQuestions.questions[currentQuestion].questionType == "text"
        {
            tempStorage[currentQuestion] = [textIn.text!]
            textIn.text = ""
            
        }
        else if allQuestions.questions[currentQuestion].questionType == "dropdown"
        {
            
            tempStorage[currentQuestion] = [String(category.text!)]
        
            
        }
        else if allQuestions.questions[currentQuestion].questionType == "check"
        {
            
            tempStorage[currentQuestion] = checkAnswers
            checkAnswers = []
            
        }
        
    
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
                category.isHidden = true
                
                selectedAnswer = 0
                nextButton.isEnabled = false
                
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
                category.isHidden = true
                
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
                category.isHidden = true
                
                questionLabel.text = allQuestions.questions[currentQuestion].question
            }
            
            else if allQuestions.questions[currentQuestion].questionType == "dropdown"{
                // Display correct elements
                option1.isHidden = true
                option2.isHidden = true
                option3.isHidden = true
                option4.isHidden = true
                textIn.isHidden = true
                slideIn.isHidden = true
                startLabel.isHidden = true
                endLabel.isHidden = true
                category.isHidden = false
                
                questionLabel.text = allQuestions.questions[currentQuestion].question
            }
            else if allQuestions.questions[currentQuestion].questionType == "check"{
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
                category.isHidden = true
                
                selectedAnswer = 0
                nextButton.isEnabled = false
                
                questionLabel.text = allQuestions.questions[currentQuestion].question
                option1.setTitle(allQuestions.questions[currentQuestion].options[0], for: UIControl.State.normal)
                option2.setTitle(allQuestions.questions[currentQuestion].options[1], for: UIControl.State.normal)
                option3.setTitle(allQuestions.questions[currentQuestion].options[2], for: UIControl.State.normal)
                option4.setTitle(allQuestions.questions[currentQuestion].options[3], for: UIControl.State.normal)
            }
        }
        else {
            // Quiz end
            print(tempStorage)
            APIClient.sendAnswers(account: "hi", d0: tempStorage[0]!, d1: tempStorage[1]!, d2: tempStorage[2]!, d3: tempStorage[3]!, d4: tempStorage[4]!, d5: tempStorage[5]!, d6: tempStorage[6]!, d7: tempStorage[7]!, d8: tempStorage[8]!, d9: tempStorage[9]!)
            
           // APIClient.sendAnswers(account: "random", d0: tempStorage[0]!, d1: "0", d2: "0", d3: "0", d4: tempStorage[8]!, d5: "0", d6: tempStorage[10]!,d7: tempStorage[9]!)
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
