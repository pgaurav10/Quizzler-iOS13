//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var optionC: UIButton!
    @IBOutlet weak var optionB: UIButton!
    @IBOutlet weak var optionA: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!


    var timer = Timer()
    var quizData = QuizData()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func ansButtonPressed(_ sender: UIButton) {
        
        
        if(quizData.checkAns(sender.currentTitle!)) {
            sender.backgroundColor = UIColor.green
            print("Correct!")
        } else {
            sender.backgroundColor = UIColor.red
            print("Wrong :(")
        }
        
        quizData.updateQuestion()
        
        progressBar.progress = quizData.getProgess()
        Timer.scheduledTimer(timeInterval: 0.5, target:self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI() {
        questionLabel.text = quizData.getNextQuestion()
        scoreLabel.text = "Score: \(quizData.getScore())"
        
        let options = quizData.getNextOptions()
        optionA.setTitle(options[0], for: UIControl.State.normal)
        optionB.setTitle(options[1], for: UIControl.State.normal)
        optionC.setTitle(options[2], for: UIControl.State.normal)
        
        
        optionA.backgroundColor = UIColor.clear
        optionB.backgroundColor = UIColor.clear
        optionC.backgroundColor = UIColor.clear
    }
    
}

