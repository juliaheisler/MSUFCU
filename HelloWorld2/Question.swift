//
//  Questions.swift
//  HelloWorld2
//
//  Created by Team MSUFCU on 9/17/19.
//  Copyright © 2019 Julia Heisler. All rights reserved.
//

import Foundation

class Question{
    
    let question: String
    let option1: String
    let option2: String
    let option3: String
    let option4: String
  
    
    init(questionText: String, answer1: String, answer2: String, answer3: String, answer4: String){
        
        question = questionText
        option1 = answer1
        option2 = answer2
        option3 = answer3
        option4 = answer4
    }
    
}


