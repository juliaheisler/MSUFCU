//
//  Quiz.swift
//  HopesAndDreams
//
//  Created by Team MSUFCU on 10/1/19.
//  Copyright © 2019 Julia Heisler. All rights reserved.
//

import Foundation
// Class for actual quiz
class Quiz{
    
    var questions = [Question]()
    
    init(){
        
        questions.append(Question(questionText: "Who are the members of you household? (click all that apply) ", answers: ["Spouse/partner","Children","Parents or other relatives", "Pets"], Qtype: "check"))
        
        questions.append(Question(questionText: "What are some of your hobbies? (Click all that apply) ", answers: ["Shopping","Sports","Video Games", "Music/Art"], Qtype: "check"))
        
        questions.append(Question(questionText: "Do you consider yourself an early adopter with technology?", answers: ["No", "Yes"], Qtype: "slider"))
        
        questions.append(Question(questionText: "Are you a homeowner? Do you intend to be a homeowner?", answers: ["Current homeowner","I’d like to be a homeowner soon","Maybe someday","Why buy a house when you can travel"], Qtype: "multiple choice"))
        
        questions.append(Question(questionText: "What would be an ideal day off activity for you?", answers: ["Relaxing spa day","Going for a hike ","Exploring local restaurants","Attending a sporting event"], Qtype: "multiple choice"))
        
        questions.append(Question(questionText: "On a scale of 1-10 how important is the service you receive from your financial institution?", answers: ["1", "10"], Qtype: "slider"))
        
        questions.append(Question(questionText: "Which product are you most interested in?", answers: ["Auto loan","Mortgage","Credit card","Checking and savings"],Qtype: "multiple choice"))
        
        questions.append(Question(questionText: "What is your financial dream/goal?", answers: [],Qtype: "text"))
        
        questions.append(Question(questionText: "What category best fits this dream?", answers: [],Qtype: "dropdown"))
        
        questions.append(Question(questionText: "How much would you be willing save towards this? ", answers: [], Qtype: "text"))
        
        
        
        
    }
    
}
