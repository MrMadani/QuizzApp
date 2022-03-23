//
//  ViewController.swift
//  QuizzApp
//
//  Created by shahinmadani on 1/7/21.
//

import UIKit

class ViewController: UIViewController {
    let allQuestions = QuestionBank()
    var pickedAnswer = false
    var questionNumber : Int = 0
    var score = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var playerLabel: UILabel!
    

    override func viewDidLoad() {
    //when the code runs and the screen loads from here.
        
        super.viewDidLoad()
   nextQuestion()
    }
     
    //the button function starts from here!
    @IBAction func anwerPressed(_ sender: Any) {
        if (sender as AnyObject).tag == 1 {
            pickedAnswer = true
        }else if (sender as AnyObject).tag == 2 {
            pickedAnswer = false
        }else{
            print(sender)
        }
        
        checkAnswer()
        questionNumber += 1
        nextQuestion()
    }
    
    
    func updateUI(){
        scoreLabel.text = "Score :\(score)"
        progressLabel.text = "\(questionNumber+1) / 13"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber+1)
        
        
    }
    
    
    func nextQuestion() {
        if questionNumber <= 12{
            questionLabel.text = allQuestions.list[questionNumber].questionText
            updateUI()
        }else {
            let alert = UIAlertController(title: "Awesome", message: "You've finished the all the questions", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default) { UIAlertAction in
                self.startOver()
            }
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
            
        }
        
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNumber].answer
        if correctAnswer == pickedAnswer {
            ProgressHUD.showSuccess("Correct")
            score += 1
        }else if correctAnswer != pickedAnswer {
            ProgressHUD.showError("Wrong Answer!")      }
        
    }
    
    
    func startOver() {
        score = 0
        questionNumber = 0
        nextQuestion()
        playerLabel.text = "Player 2"
        
    }
    

}


