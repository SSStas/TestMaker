//
//  TestPassingController.swift
//  TestMaker
//
//  Created by Mac on 21.07.2020.
//  Copyright © 2020 Apples. All rights reserved.
//

import UIKit

class TestPassingController: UIViewController {
    
    lazy var backgroundView = BackgroundBlureView()
    lazy var startView = StartTestView()
    lazy var questionView = QuestionView()
    lazy var endView = EndView()
    
    var constants: Constants = Constants()
    
    var choosenTest: TestDescription?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setupBackgroundView() {
        
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundView.setupBackgroundView(isBackground: true, isBlure: true, isVibrancy: false)
        
        self.view.addSubview(backgroundView)
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: self.view.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
    }
    
    private func setupStartView() {
        
        guard let t = self.choosenTest else { return }
        
        startView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(startView)
        
        self.startView.cancelFunc = self.closeController
        self.startView.beginFunc = self.beginTest
        
        self.startView.setupWith(title: t.title, description: t.description, author: t.author.name, questionsNum: t.questionsCount, games: t.games, likes: t.likes)
        
        NSLayoutConstraint.activate([
            startView.topAnchor.constraint(equalTo: self.view.topAnchor),
            startView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            startView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            startView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
    
    private func setupQuestionView() {
        
        questionView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(questionView)
        
        self.questionView.getQuestionFunc = self.getQuestion
        self.questionView.closeFunc = self.endTest
        
        self.questionView.setupWith(questionsNum: self.choosenTest?.questionsCount ?? 0)
        
        NSLayoutConstraint.activate([
            questionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            questionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            questionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            questionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
    
    private func setupEndView(_ results: Int) {
        
        endView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(endView)
        
        self.endView.cancelFunc = self.closeController
        
        self.endView.setupWith(resul: results, numQuestions: self.choosenTest?.questionsCount ?? 0)
        
        NSLayoutConstraint.activate([
            endView.topAnchor.constraint(equalTo: self.view.topAnchor),
            endView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            endView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            endView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
    
    func setupStartViews(testContent: TestDescription?) {
        
        self.choosenTest = testContent
        
        self.removeViews()
        
        self.setupBackgroundView()
        self.setupStartView()
    }
    
    func removeViews() {
        self.questionView.removeFromSuperview()
        self.endView.removeFromSuperview()
        self.backgroundView.removeFromSuperview()
        self.startView.removeFromSuperview()
    }
    
    func closeController() {
        
        self.removeViews()
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func beginTest() {
        self.startView.removeFromSuperview()
        self.setupQuestionView()
    }
    
    func endTest(_ rightAnswers: Int) {
        self.questionView.removeFromSuperview()
        self.setupEndView(rightAnswers)
    }
    
    func getQuestion(_ index: Int) -> Question? {
        if (self.choosenTest?.questions) != nil {
            if index < self.choosenTest!.questions!.count {
                return self.choosenTest!.questions![index]
            }
        }
        return nil
    }
}
