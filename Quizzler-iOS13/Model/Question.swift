//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Gaurav Patil on 1/19/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let options: [String]
    let ans: String
    
    init(q: String, a: [String], correctAnswer: String) {
        self.text = q
        self.options = a
        self.ans = correctAnswer
    }
}
