//
//  Quiz.swift
//  HopesAndDreams
//
//  Created by Team MSUFCU on 10/1/19.
//  Copyright © 2019 Julia Heisler. All rights reserved.
//

import Foundation

class Quiz{
    
    var questions = [Question]()
    
    init(){
        
        questions.append(Question(questionText: "Are you a homeowner? Do you intend to be a homeowner?", answers: ["Current homeowner","I’d like to be a homeowner soon","Maybe someday","Why buy a house when you can travel the world"], Qtype: "multiple choice"))
        
        questions.append(Question(questionText: "If you had an extra hundred dollars in your next paycheck what yould you do with it?", answers: ["Spend it","Save it","Split it between Savings and Spending","Invest it"], Qtype: "multiple choice"))
        
        questions.append(Question(questionText: "Do you like being involved in your community?", answers: ["Yes, I volunteer my time","No, not currently","A little bit of both","I like to attend community events"], Qtype: "multiple choice"))
        
        questions.append(Question(questionText: "Describe yourself in one word:", answers: ["Loyal","Creative","Thoughtful","Analytical"],Qtype: "multiple choice"))
        
        
        
    }
    
}
