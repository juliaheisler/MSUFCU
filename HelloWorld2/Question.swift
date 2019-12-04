//
//  Questions.swift
//  HelloWorld2
//
//  Created by Team MSUFCU on 9/17/19.
//  Copyright © 2019 Julia Heisler. All rights reserved.
//

import Foundation
// Quiz Question
class Question{
    
    let question: String
    let options: Array<String>
    let questionType: String
  
    
    init(questionText: String, answers: Array<String>, Qtype: String){
        
        question = questionText
        options = answers
        questionType = Qtype
        
    }
    
}


