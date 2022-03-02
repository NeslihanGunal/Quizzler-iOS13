//
//  ViewController.swift
//  Quizzler
//
//  Created by Neslihan Günal on 2.03.2022.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    
    @IBOutlet weak var falseButton: UIButton!

    @IBOutlet weak var progressBar: UIProgressView!
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    
    }

    @IBAction func answerPressed(_ sender: UIButton) {
        
        if quizBrain.checkAnswer(userAnswer: sender.currentTitle!){
            sender.backgroundColor = UIColor.green
        }else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    
    @objc func updateUI(){
        
        questionLabel.text = quizBrain.getQuestionText()
        scoreLabel.text = "Score: \(quizBrain.getSocore())"
        progressBar.progress = quizBrain.getProgress()
        
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
    
}

