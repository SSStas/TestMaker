//
//  AddScreen.swift
//  TEstaddScreen
//
//  Created by Чурсина Юлия on 14.07.2020.
//  Copyright © 2020 Julia. All rights reserved.
//

import UIKit

class AddTestController: UIViewController {
    
    lazy var backgroundView = BackgroundBlureView()
    lazy var addView = AddView()
    var testDescription: TestDescription!
    
    let iphoneContentView = UIView()
    lazy var iphoneScrollView: UIScrollView = {
        
        let scroll = UIScrollView()
        scroll.backgroundColor = .clear
        return scroll
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackground()
        setupIphoneViews()
        addTapGestureToHideKeyboard()
        
        addView.delegate = self
        backgroundView.backgroundImageView.tintColor = .blue
    }
    
    private func setupBackground() {
        
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        addView.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundView.setupBackgroundView(isBackground: true, isBlure: true, isVibrancy: false)
        
        self.view.addSubview(backgroundView)
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: self.view.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
    }
    
    func addTapGestureToHideKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(view.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
}

extension AddTestController: ToCreateQuestionDelegate {
    func toCreateQuestion() {
        
        if let name = addView.testNameTextField.text, name != "" {
            
            testDescription = TestDescription(title: name,
                                              description: addView.testSectionTextField.text ?? "",
                                              code: addView.testPasswordLabelTextField.text ?? "",
                                              author: Author(name: "", id: ""),
                                              games: 0,
                                              likes: 0,
                                              id: "",
                                              questionsCount: 0,
                                              questions: nil)
            
            let vc = CreateTestController()
            vc.testDescription = testDescription
            navigationController?.show(vc, sender: self)
        }
    }

}
