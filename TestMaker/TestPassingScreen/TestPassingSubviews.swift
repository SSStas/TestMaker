//
//  TestPassingSubviews.swift
//  TestMaker
//
//  Created by Mac on 22.07.2020.
//  Copyright © 2020 Apples. All rights reserved.
//

import Foundation
import UIKit

typealias ButtonPressProcess = () -> Void
typealias GetTestQuestionProcess = (_ index: Int) -> Question?
typealias CloseProcess = (_ rightAnswers: Int) -> Void

class StartTestView: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var likesButton: UIButton!
    @IBOutlet weak var gamesLabel: UILabel!
    @IBOutlet weak var questionsLabel: UILabel!
    
    @IBOutlet weak var infoBackgroundView: UIView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var backbutton: UIButton!
    
    
    let nibName = "StartTestView"
    
    var cancelFunc: ButtonPressProcess?
    var beginFunc: ButtonPressProcess?
    
    override init(frame: CGRect) {
       super.init(frame: frame)
        loadViewFromNib(nibName: self.nibName)
     }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib(nibName: self.nibName)
    }
    
    @IBAction func backButtonTap(_ sender: Any) {
        if let f = self.cancelFunc {
            f()
        }
    }
    
    @IBAction func startButtonTap(_ sender: Any) {
        if let f = self.beginFunc {
            f()
        }
    }
    
    func setupWith(title: String, description: String, author: String, questionsNum: Int, games: Int, likes: Int) {
        
        titleLabel.text = title
        authorLabel.text = "Автор: \(author)"
        descriptionTextView.text = "Описание:\n\(description)"
        questionsLabel.text = "❓: \(questionsNum)"
        gamesLabel.text = "🎮: \(games)"
        likesButton.setTitle("👍: \(likes)", for: .normal)
        
        infoBackgroundView.layer.cornerRadius = 10
        startButton.layer.cornerRadius = 10
        backbutton.layer.cornerRadius = 10
    }
    
}

class QuestionView: UIView {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var questionNumLabel: UILabel!
    
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!
    
    let nibName = "QuestionView"
    
    var questionIndex = 0
    var questionsNum = 0
    var myCorrectAnswers = 0
    var time = 30
    
    var isButtonsBlocked = false
    
    var buttonAnswersIndex: [Int] = []
    var correctAnswersIndex: [Int] = []
    
    var timer: Timer?
    
    var getQuestionFunc: GetTestQuestionProcess?
    var closeFunc: CloseProcess?
    
    override init(frame: CGRect) {
       super.init(frame: frame)
        loadViewFromNib(nibName: self.nibName)
     }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib(nibName: self.nibName)
    }
    
    @IBAction func buttonATap(_ sender: Any) {
        if !isButtonsBlocked { answer(index: 0) }
    }
    
    @IBAction func buttonBTap(_ sender: Any) {
        if !isButtonsBlocked { answer(index: 1) }
    }
    
    @IBAction func buttonCTap(_ sender: Any) {
        if !isButtonsBlocked { answer(index: 2) }
    }
    
    @IBAction func buttonDTap(_ sender: Any) {
        if !isButtonsBlocked { answer(index: 3) }
    }
    
    func setupWith(questionsNum: Int) {
        self.questionsNum = questionsNum
        self.questionIndex = 0
        self.time = 30
        
        self.isButtonsBlocked = false
        buttonA.layer.cornerRadius = 10
        buttonB.layer.cornerRadius = 10
        buttonC.layer.cornerRadius = 10
        buttonD.layer.cornerRadius = 10
        normalButtonsColor()
        
        getNewQuestion()
    }
    
    func getNewQuestion() {
        if let f = self.getQuestionFunc {
            if let q = f(self.questionIndex) {
                questionNumLabel.text = "Вопрос \(questionIndex + 1) из \(questionsNum)"
                
                questionLabel.text = q.question
                buttonAnswersIndex = stride(from: 0, through: q.answers.count - 1, by: 1).sorted(by: {
                    (_, _) in arc4random() < arc4random()
                })
                
                correctAnswersIndex = q.correct
                print("buttonAnswersIndex: \(buttonAnswersIndex)")
                print("answerTexts: \(q.answers)")
                print("correctAnswersIndex: \(correctAnswersIndex)")
                self.setupButtons(q.answers)
                
                self.createTimer(true)
                
            } else if let cancel = self.closeFunc {
                self.cancelTimer()
                cancel(myCorrectAnswers)
            }
        }
    }
    
    func setupButtons(_ answerTexts: [String]) {
        buttonA.setTitle(answerTexts[buttonAnswersIndex[0]], for: .normal)
        buttonB.setTitle(answerTexts[buttonAnswersIndex[1]], for: .normal)
        if buttonAnswersIndex.count > 2 {
            buttonC.setTitle(answerTexts[buttonAnswersIndex[2]], for: .normal)
            buttonC.isHidden = false
        } else {
            buttonC.isHidden = true
        }
        if buttonAnswersIndex.count > 3 {
            buttonD.setTitle(answerTexts[buttonAnswersIndex[3]], for: .normal)
            buttonD.isHidden = false
        } else {
            buttonD.isHidden = true
        }
    }
     
    func normalButtonsColor() {
        buttonA.backgroundColor = .gray
        buttonB.backgroundColor = .gray
        buttonC.backgroundColor = .gray
        buttonD.backgroundColor = .gray
    }
    
    /// Gets index of your button as answer
    func answer(index: Int) {
        for i in 0..<self.buttonAnswersIndex.count {
            var isCorrect = false
            for j in self.correctAnswersIndex where self.buttonAnswersIndex[i] == j { isCorrect = true }
            if i == index || isCorrect {
                switch i {
                    case 0:
                        buttonA.backgroundColor = (isCorrect ? .green : .red)
                        break
                    case 1:
                        buttonB.backgroundColor = (isCorrect ? .green : .red)
                        break
                    case 2:
                        buttonC.backgroundColor = (isCorrect ? .green : .red)
                        break
                    case 3:
                        buttonD.backgroundColor = (isCorrect ? .green : .red)
                        break
                    default:
                        break
                }
            }
            if i == index && isCorrect {
                self.myCorrectAnswers += 1
            }
        }
        
        self.isButtonsBlocked = true
        
        self.createTimer(false)
    }
    
    // timer process
    @objc func completeTimer() {
        timeLabel.text = "Время: \(self.time)"
        self.time -= 1
        if self.time <= 0 {
            self.cancelTimer()
            self.answer(index: -1)
        }
    }
    
    // activates after geting an answer
    @objc func completeQuestion() {
        self.normalButtonsColor()
        questionIndex += 1
        self.isButtonsBlocked = false
        self.cancelTimer()
        self.getNewQuestion()
    }
    
    func createTimer(_ onStart: Bool = true) {
        if self.timer != nil {
            cancelTimer()
        }
        
        if self.timer == nil {
            let timer = onStart ? Timer(timeInterval: 1.0, target: self, selector: #selector(completeTimer), userInfo: nil, repeats: true) :
            Timer(timeInterval: 3.0, target: self, selector: #selector(completeQuestion), userInfo: nil, repeats: false)
            RunLoop.current.add(timer, forMode: .common)
            timer.tolerance = 0.1
          
            self.timer = timer
        }
    }
    
    func cancelTimer() {
        self.timer?.invalidate()
        self.timer = nil
    }
}

class EndView: UIView {
    
    let nibName = "EndView"
    
    var cancelFunc: ButtonPressProcess?
    
    override init(frame: CGRect) {
       super.init(frame: frame)
        loadViewFromNib(nibName: self.nibName)
     }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib(nibName: self.nibName)
    }
    
    func setupWith(_ resul: Int) {
        
    }
}
