//
//  CreateTestController.swift
//  TEstaddScreen
//
//  Created by Чурсина Юлия on 16.07.2020.
//  Copyright © 2020 Julia. All rights reserved.
//

import UIKit

class CreateTestController: UIViewController {
    
    lazy var backgroundView = BackgroundBlureView()
    lazy var addQuestion = AddQuestionView()
    lazy var addOptions = AddOptionsView()
    
    let iphoneContentView = UIView()
    lazy var iphoneScrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = .clear
        return scroll
    }()
    
    var testDescription: TestDescription!
    var questions: [Question] = []
    var isNew = false
    var questionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addOptions.delegate = self
        setupBackground()
        addTapGestureToHideKeyboard()
        backgroundView.backgroundImageView.tintColor = .blue
        presentData()
        
        let nweBarButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(save))
        navigationItem.rightBarButtonItem = nweBarButton
    }
    
    @objc func save() {
        testDescription.questions = questions
        
        let api = TestsAPI()
        api.createNewTest(testDescription: testDescription)
    }
    
    private func showData() {
        
        let newQuestion = questions[questionIndex]
        addQuestion.showData(question: newQuestion)
        addOptions.showData(question: newQuestion)
    }
    
    private func addNewQuestion() {
        
        let quest = addQuestion.inputGuestionTextField.text ?? ""
        let ansOne = addOptions.optionOneTextField.text ?? ""
        let ansTwo = addOptions.optionTwoTextField.text ?? ""
        let ansThree = addOptions.optionthreeTextField.text ?? ""
        let ansFour = addOptions.optionFourTextField.text ?? ""
        
        let new = Question(question: quest, answers: [ansOne, ansTwo, ansThree, ansFour], correct: [2])
        questions.append(new)
    }
    
    private func correctQuestion() {
        
        let quest = addQuestion.inputGuestionTextField.text ?? ""
        let ansOne = addOptions.optionOneTextField.text ?? ""
        let ansTwo = addOptions.optionTwoTextField.text ?? ""
        let ansThree = addOptions.optionthreeTextField.text ?? ""
        let ansFour = addOptions.optionFourTextField.text ?? ""
        
        let new = Question(question: quest, answers: [ansOne, ansTwo, ansThree, ansFour], correct: [1])
        questions[questionIndex] = new
    }

    
    private func setupBackground() {
        
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.setupBackgroundView(isBackground: true, isBlure: true, isVibrancy: false)
        self.view.addSubview(backgroundView)
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: self.view.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
        setupIphoneViews()
    }
    
    func addTapGestureToHideKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(view.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
    
    private func presentData() {
        if questions.count == 0 {
            addQuestion.showEmptyScreen()
            addOptions.showEmptyScreen()
            isNew = true
            addOptions.pastButton.isHidden = true
        } else {
            if questionIndex == questions.count {
                addQuestion.showEmptyScreen()
                addOptions.showEmptyScreen()
            } else {
                showData()
            }
        }
    }
}

//TODO: - Переделать логику
extension CreateTestController: AddOptionsViewDelegate {
    func nextButton() {
        
        for i in 0..<questions.count where i == questionIndex {
            correctQuestion()
        }
        
        questionIndex += 1
        
        if isNew {
            addNewQuestion()
            isNew = false
        }
        
        if questionIndex == questions.count {
            isNew = true
            presentData()
        } else {
            presentData()
        }
        
        if questionIndex <= 0 {
            addOptions.pastButton.isHidden = true
            questionIndex = 0
        } else {
            addOptions.pastButton.isHidden = false
        }
    }
    
    func backButton() {
        
        for i in 0..<questions.count where i == questionIndex {
            correctQuestion()
        }
        
        questionIndex -= 1
        
        if isNew {
            addNewQuestion()
            isNew = false
        }
        
        if questionIndex <= 0 {
            addOptions.pastButton.isHidden = true
            questionIndex = 0
        } else {
            addOptions.pastButton.isHidden = false
        }
        
        presentData()
    }
}
